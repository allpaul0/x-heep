/**
 * File generated with GEGELATI v2.0.0
 * On the 2026-07-16 10:18:36
 * With the CodeGen::TPGGenerationEngine.
 */

#include "TPG.h"

// static inline int bestProgram(const float *results, int nb) {
// 	int bestProgram = 0;
// 	float bestScore = (isnan(results[0]))? -INFINITY : results[0];
// 	for (int i = 1; i < nb; i++) {
// 		float challengerScore = (isnan(results[i]))? -INFINITY : results[i];
// 		if (challengerScore >= bestScore) {
// 			bestProgram = i;
// 			bestScore = challengerScore;
// 		}
// 	}
// 	return bestProgram;
// }

/* ------------------------------------------------------------ */
/* Inference — computed goto dispatch                            */
/* ------------------------------------------------------------ */
