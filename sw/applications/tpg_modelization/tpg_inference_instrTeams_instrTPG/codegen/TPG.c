/**
 * File generated with GEGELATI v2.0.0
 * Refactored version: TX logic moved to functions.
 */

#include "csr.h"                        // CSR macros (CSR_WRITE/READ/CLEAR_BITS)
#include "TPG_program.h"
#include "TPG.h"

int bestProgram(fixedpt *results, int nb) {
	int bestProgram = 0;
	fixedpt bestScore = results[0];
	for (int i = 1; i < nb; i++) {
		fixedpt challengerScore = results[i];
		if (challengerScore >= bestScore) {
			bestProgram = i;
			bestScore = challengerScore;
		}
	}
	return bestProgram;
}

enum vertices {T0, T1, A1, A2, A3, A4, A5, A6};

/* ========================= */
/* ===== TX FUNCTIONS ====== */
/* ========================= */

enum vertices T0_func(const fixedpt * restrict in1,
                      const fixedpt * restrict in2,
                      const fixedpt * restrict in3,
                      const fixedpt * restrict in4,
					  uint32_t * team_cycles)
{
	const enum vertices next[6] = { T1, T1, A3, A4, T1, A6 };
	fixedpt scores[6];

	uint32_t start, end;

	CSR_READ(CSR_REG_MCYCLE, &start);

	__asm__ volatile("T0_begin:");

	scores[0] = P0(in1, in2, in3, in4);
	scores[1] = P1(in1, in2, in3, in4);
	scores[2] = P2(in1, in2, in3, in4);
	scores[3] = P3(in1, in2, in3, in4);
	scores[4] = P4(in1, in2, in3, in4);
	scores[5] = P5(in1, in2, in3, in4);

	__asm__ volatile("T0_end:");

	CSR_READ(CSR_REG_MCYCLE, &end);

	*team_cycles = end - start;

	return next[bestProgram(scores, 6)];
}

enum vertices T1_func(const fixedpt * restrict in1,
                      const fixedpt * restrict in2,
                      const fixedpt * restrict in3,
                      const fixedpt * restrict in4,
					  uint32_t * team_cycles)
{
	const enum vertices next[6] = { A1, A2, A3, A4, A5, A6 };
	fixedpt scores[6];

	uint32_t start, end;

	CSR_READ(CSR_REG_MCYCLE, &start);

	__asm__ volatile("T1_begin:");

	scores[0] = P0(in1, in2, in3, in4);
	scores[1] = P1(in1, in2, in3, in4);
	scores[2] = P2(in1, in2, in3, in4);
	scores[3] = P3(in1, in2, in3, in4);
	scores[4] = P4(in1, in2, in3, in4);
	scores[5] = P5(in1, in2, in3, in4);

	__asm__ volatile("T1_end:");

	CSR_READ(CSR_REG_MCYCLE, &end);

	*team_cycles = end - start;

	return next[bestProgram(scores, 6)];
}


/* ========================= */
/* ===== INFERENCE LOOP ==== */
/* ========================= */

void inferenceTPG(fixedpt* actions,
                  const fixedpt * restrict in1,
                  const fixedpt * restrict in2,
                  const fixedpt * restrict in3,
                  const fixedpt * restrict in4,
				  uint32_t * team_cycles)
{
	enum vertices currentVertex = T0;

	while (1) {
		switch (currentVertex) {
			case T0:  currentVertex = T0_func(in1, in2, in3, in4, &team_cycles[0]); break;
			case T1:  currentVertex = T1_func(in1, in2, in3, in4, &team_cycles[1]); break;
			case A1: actions[0] = 1; return;
			case A2: actions[0] = 2; return;
			case A3: actions[0] = 3; return;	
			case A4: actions[0] = 4; return;
			case A5: actions[0] = 5; return;
			case A6: actions[0] = 6; return;
		}
	}
}