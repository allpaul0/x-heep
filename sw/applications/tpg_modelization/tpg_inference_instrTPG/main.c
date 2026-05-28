/* File: benchmarks/tpg_embedded_benchmark.c
   Embedded RISC-V benchmark adapted from desktop version.
   - Uses CSR cycle counter (MCYCLE)
   - Uses inferenceTPG(&actionID)
   - Uses in1..in4 pointers, passed to inferenceTPG as args instead of global extern, to allow restrict qualifier in externHeader.h
     (and thus better optimization opportunities for inferenceTPG)
     Note: in1..in4 are still global pointers, but now they are set to point to local buffers in main() instead of being directly used as extern arrays.
     This allows us to keep the same precalculated dataSourcesLE_* arrays and just copy their values into local buffers before calling inferenceTPG.
     This way we can still use the same precalculated data without modification, while enabling better optimization in inferenceTPG.
   - Computes per-class mean & stddev using Welford algorithm (online)
*/


#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include "csr.h"                        // CSR macros (CSR_WRITE/READ/CLEAR_BITS)
#include "codegen/externHeader.h"       // extern declarations: typeInf, inferenceTPG
#include "precalcul/LE_states.h"        // dataSourcesLE_* arrays, ids_graph_traversals[], NB_SEED, NB_CLASSES
#include "codegen/TPG.h"                // forward declarations if needed

/* By default, printfs are activated for FPGA and disabled for simulation. */
#define PRINTF_IN_FPGA  1
#define PRINTF_IN_SIM   1

#if TARGET_SIM && PRINTF_IN_SIM
    #define PRINTF(fmt, ...)    printf(fmt, ## __VA_ARGS__)
#elif PRINTF_IN_FPGA
        #define PRINTF(fmt, ...)    printf(fmt, ## __VA_ARGS__)
#else
     #define PRINTF(...)
#endif


typeInf* in1;
typeInf* in2;
typeInf* in3;
typeInf* in4;

/* Local static buffers */
typeInf in1_buf[3];
typeInf in2_buf[3];
typeInf in3_buf[3];
typeInf in4_buf[6];


/* Assign input buffers for seed and point global in1..in4 pointers at them */
static void assign_LE_values(int seed)
{
    in1_buf[0] = dataSourcesLE_0[seed];
    in1_buf[1] = dataSourcesLE_1[seed];
    in1_buf[2] = dataSourcesLE_2[seed];

    in2_buf[0] = dataSourcesLE_3[0];
    in2_buf[1] = dataSourcesLE_4[0];
    in2_buf[2] = dataSourcesLE_5[0];

    in3_buf[0] = dataSourcesLE_6[seed];
    in3_buf[1] = dataSourcesLE_7[seed];
    in3_buf[2] = dataSourcesLE_8[seed];

    in4_buf[0] = dataSourcesLE_9[0];
    in4_buf[1] = dataSourcesLE_10[0];
    in4_buf[2] = dataSourcesLE_11[0];
    in4_buf[3] = dataSourcesLE_12[0];
    in4_buf[4] = dataSourcesLE_13[0];
    in4_buf[5] = dataSourcesLE_14[0];

    in1 = in1_buf;
    in2 = in2_buf;
    in3 = in3_buf;
    in4 = in4_buf;
}

/* Welford accumulators per class */
typedef struct {
    uint32_t count;
    double mean;
    double M2;
} Welford;

static void welford_add(Welford *s, double x)
{
    s->count++;
    double delta = x - s->mean;
    s->mean += delta / s->count;
    double delta2 = x - s->mean;
    s->M2 += delta * delta2;
}

int main(void)
{
    /* Prepare CSR cycle counter */
    CSR_CLEAR_BITS(CSR_REG_MCOUNTINHIBIT, 0x1); // enable cycle counting

    /* Arrays sized by NB_CLASSES (extern from LE_states.h) */
    Welford accumulators[NB_CLASSES];

    for (int c = 0; c < NB_CLASSES; ++c) {
        accumulators[c].count = 0;
        accumulators[c].mean = 0.0;
        accumulators[c].M2 = 0.0;
    }

    /* Temporary variables */
    uint32_t total_cycles = 0;
    typeInf actionID = -1;

    for (int seed = 0; seed < NB_SEED; ++seed)
    {
        assign_LE_values(seed);

        /* reset MCYCLE */
        CSR_WRITE(CSR_REG_MCYCLE, 0);

        inferenceTPG(&actionID, in1, in2, in3, in4);

        /* read cycles (64-bit if available in CSR_READ) */
        CSR_READ(CSR_REG_MCYCLE, &total_cycles);

        int cls = ids_graph_traversals[seed];
        if (cls < 0 || cls >= NB_CLASSES) {
            PRINTF("Seed %d has invalid class %d\n", seed, cls);
            continue;
        }

        welford_add(&accumulators[cls], total_cycles);
    }

    /* Print per-class statistics */
    PRINTF("Class,Count,AvgCyclesPerClass,StddevCyclesPerClass\n");
    for (int c = 0; c < NB_CLASSES; ++c)
    {
        if (accumulators[c].count == 0) continue;
        double mean = accumulators[c].mean;
        double variance = (accumulators[c].count > 1) ? (accumulators[c].M2 / (accumulators[c].count - 1)) : 0.0;
        double stddev = (variance > 0.0) ? sqrt(variance) : 0.0;
        PRINTF("%d,%u,%d,%d\n", c, accumulators[c].count, (int) mean, (int) stddev);
    }

    return 0;
}
