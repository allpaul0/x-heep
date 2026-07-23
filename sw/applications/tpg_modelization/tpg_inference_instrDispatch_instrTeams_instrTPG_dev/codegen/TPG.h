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
#define MAX_TRANSITION_SIZE 7
#define MAX_TRANSITION_RECORDS (NB_SEED * (NB_TEAMS + 1))

void inferenceTPG(int* actions, 
					const fixedpt * __restrict__ in1, 
					const fixedpt * __restrict__ in2, 
					const fixedpt * __restrict__ in3, 
					const fixedpt * __restrict__ in4, 
					uint32_t * team_cycles,
					uint32_t * transition_counts,
                    uint32_t transition_cycles[][MAX_TRANSITION_RECORDS]);

#ifdef __cplusplus
}
#endif

#endif
