/* File: benchmarks/tpg_embedded_benchmark.c
   Embedded RISC-V benchmark adapted from desktop version.
   - Uses CSR cycle counter (MCYCLE)
   - Uses inferenceTPG(&actionID)
   - Uses in1..in4 global pointers from externHeader.h
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

    in2_buf[0] = dataSourcesLE_3[seed];
    in2_buf[1] = dataSourcesLE_4[seed];
    in2_buf[2] = dataSourcesLE_5[seed];

    in3_buf[0] = dataSourcesLE_6[seed];
    in3_buf[1] = dataSourcesLE_7[seed];
    in3_buf[2] = dataSourcesLE_8[seed];

    in4_buf[0] = dataSourcesLE_9[seed];
    in4_buf[1] = dataSourcesLE_10[seed];
    in4_buf[2] = dataSourcesLE_11[seed];
    in4_buf[3] = dataSourcesLE_12[seed];
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
    float mean;
    float M2;
} Welford;

static void welford_add(Welford *s, float x)
{
    s->count++;
    float delta = x - s->mean;
    s->mean += delta / s->count;
    float delta2 = x - s->mean;
    s->M2 += delta * delta2;
}

int main(void)
{
    /* Prepare CSR cycle counter */
    CSR_CLEAR_BITS(CSR_REG_MCOUNTINHIBIT, 0x1); // enable cycle counting

    /* Arrays sized by NB_CLASSES (extern from LE_states.h) */
    static Welford classes_accumulators[NB_CLASSES];

    static Welford team_accumulators[NB_TEAMS];

    static Welford dispatch_accumulators[NB_PROGS_MAX + 1];   // index = number of programs (2..7)

    static uint32_t dispatch_counts[NB_PROGS_MAX + 1] = {0};

    static uint32_t dispatch_cycles[NB_PROGS_MAX + 1][DISPATCH_RECORDS_SIZE];

    // Team cycle_counters
    static uint32_t team_cycles[NB_TEAMS];

    for (int c = 0; c < NB_CLASSES; ++c) {
        classes_accumulators[c].count = 0;
        classes_accumulators[c].mean = 0.0;
        classes_accumulators[c].M2 = 0.0;
    }

    for (int t = 0; t < NB_TEAMS; ++t) {
        team_accumulators[t].count = 0;
        team_accumulators[t].mean = 0.0;
        team_accumulators[t].M2 = 0.0;
    }

    for (int size = 2; size <= NB_PROGS_MAX; ++size) {
        dispatch_accumulators[size].count = 0;
        dispatch_accumulators[size].mean = 0.0;
        dispatch_accumulators[size].M2 = 0.0;
    }

    /* Temporary variables */
    int actionID = -1;

    for (int seed = 0; seed < NB_SEED; ++seed)
    {
        assign_LE_values(seed);

        for (int i = 0; i < NB_TEAMS; ++i) team_cycles[i] = 0;

        uint32_t total_cycles = 0;

        /* reset MCYCLE */
        CSR_WRITE(CSR_REG_MCYCLE, 0);
        
        inferenceTPG(&actionID, in1, in2, in3, in4, 
             team_cycles, 
             dispatch_counts,
             dispatch_cycles);

        /* read cycles (64-bit if available in CSR_READ) */
        CSR_READ(CSR_REG_MCYCLE, &total_cycles);

        int cls = ids_graph_traversals[seed];
        if (cls < 0 || cls >= NB_CLASSES) {
            PRINTF("Seed %d has invalid class %d\n", seed, cls);
            continue;
        }
        

        welford_add(&classes_accumulators[cls], total_cycles);
        
        for (int t = 0; t < NB_TEAMS; ++t) {
            if (team_cycles[t] > 0)
                welford_add(&team_accumulators[t], (float) team_cycles[t]);
        }

        for (int size = 2; size <= NB_PROGS_MAX; size++)
        {
            /* Guard: inferenceTPG may have written more records than the array
               holds. Clamp before reading so we don't walk off the end. */
            if (dispatch_counts[size] > DISPATCH_RECORDS_SIZE) {
                PRINTF("OVERFLOW: size=%d count=%u > %d\n",
                       size, dispatch_counts[size], DISPATCH_RECORDS_SIZE);
                dispatch_counts[size] = DISPATCH_RECORDS_SIZE;
            }

            for (uint32_t i = 0; i < dispatch_counts[size]; i++)
            {
                welford_add(&dispatch_accumulators[size],
                            (float)dispatch_cycles[size][i]);
            }

            // reset for next seed
            dispatch_counts[size] = 0;
        }
    }

    /* Print per-class statistics */
    PRINTF("Class,Count,AvgCyclesPerClass,StddevCyclesPerClass\n");
    for (int c = 0; c < NB_CLASSES; ++c)
    {
        if (classes_accumulators[c].count == 0) continue;
        
        float mean = classes_accumulators[c].mean;
        float variance = (classes_accumulators[c].count > 1) ? (classes_accumulators[c].M2 / (classes_accumulators[c].count -1)) : 0.0;
        float stddev = (variance > 0.0) ? sqrt(variance) : 0.0;
        
        PRINTF("%d,%u,%d,%d\n", c, classes_accumulators[c].count, (int) mean, (int) stddev);
    }

    PRINTF("\nTeam,Count,AvgCyclesPerTeam,StddevCyclesPerTeam\n");
    for (int t = 0; t < NB_TEAMS; ++t)
    {
        if (team_accumulators[t].count == 0) continue;

        float mean = team_accumulators[t].mean;
        float variance = (team_accumulators[t].count > 1) ? (team_accumulators[t].M2 / (team_accumulators[t].count - 1)) : 0.0;
        float stddev = (variance > 0.0) ? sqrt(variance) : 0.0;

        PRINTF("%d,%u,%d,%d\n", t, team_accumulators[t].count, (int) mean, (int) stddev);
    }

    PRINTF("\nDispatchSize,Count,AvgCyclesPerDispatch,StddevCyclesPerDispatch\n");

    for (int size = 2; size <= NB_PROGS_MAX; size++)
    {
        if (dispatch_accumulators[size].count == 0)
            continue;

        float mean = dispatch_accumulators[size].mean;

        float variance =
            (dispatch_accumulators[size].count > 1)
            ?
            dispatch_accumulators[size].M2 /
            (dispatch_accumulators[size].count - 1)
            :
            0.0;

        float stddev = (variance > 0.0) ? sqrt(variance) : 0.0;

        PRINTF("%d,%u,%d,%d\n",
            size,
            dispatch_accumulators[size].count,
            (int)mean,
            (int)stddev);
    }

    return 0;
}
