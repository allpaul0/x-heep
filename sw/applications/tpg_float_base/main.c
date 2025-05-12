//#include "pynq-z2.h"
#include "csr.h"
#include <stdio.h>
#include <stdlib.h>

#include "seeds_nbActionsToTerminal.h"
#include "TPGGraph.h" 
#include "TPGPrograms.h"

/* By default, printfs are activated for FPGA and disabled for simulation. */
// #define PRINTF_IN_FPGA  1
// #define PRINTF_IN_SIM   1

// #if TARGET_SIM && PRINTF_IN_SIM
//     #define PRINTF(fmt, ...)    printf(fmt, ## __VA_ARGS__)
// #elif PRINTF_IN_FPGA
        #define PRINTF(fmt, ...)    printf(fmt, ## __VA_ARGS__)
// #else
//     #define PRINTF(...)
// #endif

float* env;

int main(void) {

    unsigned int cycles[NB_SEED];
    float states[2];
    env = states;

    //enable mcycle csr
    CSR_CLEAR_BITS(CSR_REG_MCOUNTINHIBIT, 0x1);
    for (int i=0; i < NB_SEED; i++) 
    {    
        //chargement données depuis seeds.h
        env[0] = angles[i];
        env[1] = velocities[i];

        CSR_WRITE(CSR_REG_MCYCLE, 0);
        
        inferenceTPG();

        CSR_READ(CSR_REG_MCYCLE, &cycles[i]);
    }

    //Writing the header
    PRINTF("Index,Cycles\n");

    //Writing cycle data to the CSV file
    for (int i = 0; i < NB_SEED; i++) {
        PRINTF("%d,%u\n", i, cycles[i]);
    }

    //PRINTF("tpg_float_base ended\n");

    //PRINTF("TPG inference finished. Action %d was taken in %d cycles\n\r", action, cycles);

    return 0;
}