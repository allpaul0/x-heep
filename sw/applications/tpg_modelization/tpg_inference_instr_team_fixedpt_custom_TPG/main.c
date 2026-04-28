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
#include "codegen/externHeader.h"       // extern declarations: in1,in2,in3,in4, typeInf, inferenceTPG
#include "precalcul/LE_states.h"        // dataSourcesLE_* arrays, ids_graph_traversals[], NB_SEED, NB_CLASSES
#include "codegen/TPG_program.h"
#include "codegen/TPG.h"            // forward declarations if needed

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

int main(void)
{
    uint32_t * total_cycles = malloc(sizeof(uint32_t));
    *total_cycles = 0;

    typeInf actionID = -1;

    for (int seed = 0; seed < 5; ++seed) // NB_SEED
    {
        assign_LE_values(seed);

        inferenceTPG(&actionID, in1, in2, in3, in4, total_cycles);

        PRINTF("cycles_avg: %d, actionID; %d\n", *total_cycles, actionID);
    }

    return 0;
}
