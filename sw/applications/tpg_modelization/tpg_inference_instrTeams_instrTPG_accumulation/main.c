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
#include <math.h>

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

void compute_stats(uint32_t latencies[][NB_SEED], int i, float * mean, float * stddev, uint8_t * count)
{    
    *mean = 0;
    *stddev = 0;
    *count = 0;

    // find mean 
    for(int s=0; s<NB_SEED; s++){
        if (latencies[i][s] > 0) {
            (*count)++;     
            *mean += latencies[i][s];
        }
    }
    if (*count == 0)
        return;

    *mean/=*count;

    if (*count == 1)
        return;

    //compute sum of squared diff to mean 
    for(int s=0; s<NB_SEED; s++){
        if (latencies[i][s] > 0) {     
            *stddev += (latencies[i][s] - *mean) * (latencies[i][s] - *mean);
        }
    }
    
    *stddev = sqrtf(*stddev / (*count - 1)); // sample variance
}

int main(void)
{
    /* Prepare CSR cycle counter */
    CSR_CLEAR_BITS(CSR_REG_MCOUNTINHIBIT, 0x1); // enable cycle counting

    /* Arrays sized by NB_CLASSES (extern from LE_states.h) */
    uint32_t classes_latencies[NB_CLASSES][NB_SEED];

    uint32_t team_latencies[NB_TEAMS][NB_SEED];

    // Team cycle_counters
    uint32_t team_cycles[NB_TEAMS];

    for (int cls = 0; cls < NB_CLASSES; ++cls) {
        for (int seed = 0; seed < NB_SEED; ++seed) {
            classes_latencies[cls][seed] = 0;
        }
    }

    for (int t = 0; t < NB_TEAMS; ++t) {
        for (int seed = 0; seed < NB_SEED; ++seed) {
            team_latencies[t][seed] = 0;
        }
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
        
        inferenceTPG(&actionID, in1, in2, in3, in4, team_cycles);

        /* read cycles (64-bit if available in CSR_READ) */
        CSR_READ(CSR_REG_MCYCLE, &total_cycles);

        int cls = ids_graph_traversals[seed];
        if (cls < 0 || cls >= NB_CLASSES) {
            PRINTF("Seed %d has invalid class %d\n", seed, cls);
            continue;
        }
        
        classes_latencies[cls][seed] = total_cycles;
        
        for (int t = 0; t < NB_TEAMS; ++t) {
            if (team_cycles[t] > 0) {
                team_latencies[t][seed] = team_cycles[t];
            }
        }
    }
    float mean, stddev;
    uint8_t count;

    /* Print per-class statistics */
    PRINTF("Class,Count,AvgCyclesPerClass,StddevCyclesPerClass\n");
    for (int c = 0; c < NB_CLASSES; ++c)
    {
        compute_stats(classes_latencies, c, &mean, &stddev, &count);   
        PRINTF("%d,%u,%d,%d\n", c, count, (int) mean, (int) stddev);
    }

    PRINTF("\nTeam,Count,AvgCyclesPerTeam,StddevCyclesPerTeam\n");
    for (int t = 0; t < NB_TEAMS; ++t)
    {
        compute_stats(team_latencies, t, &mean, &stddev, &count);
        PRINTF("%d,%u,%d,%d\n", t, count, (int) mean, (int) stddev);
    }

    return 0;
}
