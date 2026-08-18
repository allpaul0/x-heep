/**
 * File generated with GEGELATI v2.0.0
 * On the 2026-07-14 09:06:16
 * With the CodeGen::TPGGenerationEngine.
 */

#ifndef C_TPG_H
#define C_TPG_H

#ifdef __cplusplus
extern "C" {
#endif

#include "TPG_program.h"

#include <stdlib.h>
#include <limits.h>
#include <assert.h>
#include <float.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdint.h>
#include <math.h>

#include "externHeader.h"
#include "precalcul/LE_states.h"

# define NB_TEAMS 15
#define NB_PROGS_MAX 7
#define DISPATCH_RECORDS_SIZE (NB_SEED * (NB_TEAMS + 1))

void inferenceTPG(int* actions, 
					const fixedpt * __restrict__ in1, 
					const fixedpt * __restrict__ in2, 
					const fixedpt * __restrict__ in3, 
					const fixedpt * __restrict__ in4, 
					uint32_t * team_cycles,
					uint32_t * dispatch_counts,
                    uint32_t dispatch_cycles[NB_PROGS_MAX + 1][DISPATCH_RECORDS_SIZE]);

#ifdef __cplusplus
}
#endif

#endif
