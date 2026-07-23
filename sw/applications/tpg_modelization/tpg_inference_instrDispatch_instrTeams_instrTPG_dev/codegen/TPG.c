/**
 * File generated with GEGELATI v2.0.0
 * On the 2026-07-14 09:06:16
 * With the CodeGen::TPGGenerationEngine.
 */

#include "csr.h"
#include "TPG.h"

static uint32_t dispatch_start;
static uint32_t dispatch_end;
static uint32_t last_transition_size;

/* ------------------------------------------------------------ */
/* Helper                                                        */
/* ------------------------------------------------------------ */

static inline int bestProgram(const fixedpt *results, int nb) {
	int bestProgram = 0;
	fixedpt top = results[0];
	for (int i = 1; i < nb; i++) {
		if (results[i] >= top) { top = results[i]; bestProgram = i; }
	}
	return bestProgram;
}

/* ------------------------------------------------------------ */
/* Inference — computed goto dispatch                            */
/* ------------------------------------------------------------ */

void inferenceTPG(int *actions,
					const fixedpt * __restrict__ in1,
					const fixedpt * __restrict__ in2,
					const fixedpt * __restrict__ in3,
					const fixedpt * __restrict__ in4,
					uint32_t * team_cycles,
					uint32_t * transition_counts,
                    uint32_t transition_cycles[][MAX_TRANSITION_RECORDS])
{
	/* Jump table — static const lets GCC keep it in .rodata and
	   potentially cache it in a register across iterations.       */
	static const void * const jump_table[] = {
		&&L_T0, &&L_T1, &&L_T2, &&L_T3, &&L_T4, &&L_T5, &&L_T6, &&L_T7, &&L_T8, &&L_T9, &&L_T10, &&L_T11, &&L_T12, &&L_T13, &&L_T14, &&L_A3, &&L_A4, &&L_A5, &&L_A6, &&L_A8, &&L_A0, &&L_A7, &&L_A1
    };

	/* Initial dispatch — always start at T14 */
	goto *jump_table[14];	/* == &&L_T14 */

	uint32_t start, end;

	/* ---- Team nodes ----------------------------------------- */

L_T0: {
		CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
		transition_cycles[last_transition_size]
			[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;


		static const int next[2] = { 15, 16 };
		fixedpt  scores[2];

		__asm__ volatile("T0_start:");
		CSR_READ(CSR_REG_MCYCLE, &start);

        scores[0] = P0(in1, in2, in3, in4);
        scores[1] = P1(in1, in2, in3, in4);

		__asm__ volatile("T0_end:");
		CSR_READ(CSR_REG_MCYCLE, &end);

		team_cycles[0] = end - start;
		

		last_transition_size = 2;
		CSR_READ(CSR_REG_MCYCLE, &dispatch_start);

		goto *jump_table[next[bestProgram(scores, 2)]];
	}

L_T1: {
		CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
		transition_cycles[last_transition_size]
			[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;

		static const int next[2] = { 0, 20 };
		fixedpt  scores[2];

		__asm__ volatile("T1_start:");
		CSR_READ(CSR_REG_MCYCLE, &start);

        scores[0] = P2(in1, in2, in3, in4);
        scores[1] = P3(in1, in2, in3, in4);

		__asm__ volatile("T1_end:");
		CSR_READ(CSR_REG_MCYCLE, &end);

		team_cycles[1] = end - start;

		last_transition_size = 2;
		CSR_READ(CSR_REG_MCYCLE, &dispatch_start);

		goto *jump_table[next[bestProgram(scores, 2)]];
	}

L_T2: {
		CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
		transition_cycles[last_transition_size]
			[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;

		static const int next[4] = { 17, 21, 16, 19 };
		fixedpt  scores[4];

		__asm__ volatile("T2_start:");
		CSR_READ(CSR_REG_MCYCLE, &start);

        scores[0] = P4(in1, in2, in3, in4);
        scores[1] = P5(in1, in2, in3, in4);
        scores[2] = P6(in1, in2, in3, in4);
        scores[3] = P7(in1, in2, in3, in4);

		__asm__ volatile("T2_end:");
		CSR_READ(CSR_REG_MCYCLE, &end);

		team_cycles[2] = end - start;

		last_transition_size = 4;
		CSR_READ(CSR_REG_MCYCLE, &dispatch_start);

		goto *jump_table[next[bestProgram(scores, 4)]];
	}

L_T3: {
		CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
		transition_cycles[last_transition_size]
			[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;

		static const int next[3] = { 21, 1, 17 };
		fixedpt  scores[3];

		__asm__ volatile("T3_start:");
		CSR_READ(CSR_REG_MCYCLE, &start);

        scores[0] = P8(in1, in2, in3, in4);
        scores[1] = P9(in1, in2, in3, in4);
        scores[2] = P4(in1, in2, in3, in4);

		__asm__ volatile("T3_end:");
		CSR_READ(CSR_REG_MCYCLE, &end);

		team_cycles[3] = end - start;

		last_transition_size = 3;
		CSR_READ(CSR_REG_MCYCLE, &dispatch_start);

		goto *jump_table[next[bestProgram(scores, 3)]];
	}

L_T4: {
		CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
		transition_cycles[last_transition_size]
			[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;

		static const int next[3] = { 21, 1, 17 };
		fixedpt  scores[3];

		__asm__ volatile("T4_start:");
		CSR_READ(CSR_REG_MCYCLE, &start);

        scores[0] = P8(in1, in2, in3, in4);
        scores[1] = P10(in1, in2, in3, in4);
        scores[2] = P4(in1, in2, in3, in4);

		__asm__ volatile("T4_end:");
		CSR_READ(CSR_REG_MCYCLE, &end);

		team_cycles[4] = end - start;

		last_transition_size = 3;
		CSR_READ(CSR_REG_MCYCLE, &dispatch_start);

		goto *jump_table[next[bestProgram(scores, 3)]];
	}

L_T5: {
		CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
		transition_cycles[last_transition_size]
			[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;

		static const int next[2] = { 2, 3 };
		fixedpt  scores[2];

		__asm__ volatile("T5_start:");
		CSR_READ(CSR_REG_MCYCLE, &start);

        scores[0] = P11(in1, in2, in3, in4);
        scores[1] = P12(in1, in2, in3, in4);

		__asm__ volatile("T5_end:");
		CSR_READ(CSR_REG_MCYCLE, &end);

		team_cycles[5] = end - start;

		last_transition_size = 2;
		CSR_READ(CSR_REG_MCYCLE, &dispatch_start);

		goto *jump_table[next[bestProgram(scores, 2)]];
	}

L_T6: {
		CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
		transition_cycles[last_transition_size]
			[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;

		static const int next[3] = { 16, 2, 4 };
		fixedpt  scores[3];

		__asm__ volatile("T6_start:");
		CSR_READ(CSR_REG_MCYCLE, &start);

        scores[0] = P13(in1, in2, in3, in4);
        scores[1] = P14(in1, in2, in3, in4);
        scores[2] = P15(in1, in2, in3, in4);

		__asm__ volatile("T6_end:");
		CSR_READ(CSR_REG_MCYCLE, &end);

		team_cycles[6] = end - start;

		last_transition_size = 3;
		CSR_READ(CSR_REG_MCYCLE, &dispatch_start);

		goto *jump_table[next[bestProgram(scores, 3)]];
	}

L_T7: {
		CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
		transition_cycles[last_transition_size]
			[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;

		static const int next[2] = { 4, 2 };
		fixedpt  scores[2];

		__asm__ volatile("T7_start:");
		CSR_READ(CSR_REG_MCYCLE, &start);

        scores[0] = P16(in1, in2, in3, in4);
        scores[1] = P17(in1, in2, in3, in4);

		__asm__ volatile("T7_end:");
		CSR_READ(CSR_REG_MCYCLE, &end);

		team_cycles[7] = end - start;

		last_transition_size = 2;
		CSR_READ(CSR_REG_MCYCLE, &dispatch_start);

		goto *jump_table[next[bestProgram(scores, 2)]];
	}

L_T8: {
		CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
		transition_cycles[last_transition_size]
			[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;

		static const int next[2] = { 18, 5 };
		fixedpt  scores[2];

		__asm__ volatile("T8_start:");
		CSR_READ(CSR_REG_MCYCLE, &start);

        scores[0] = P18(in1, in2, in3, in4);
        scores[1] = P19(in1, in2, in3, in4);

		__asm__ volatile("T8_end:");
		CSR_READ(CSR_REG_MCYCLE, &end);

		team_cycles[8] = end - start;

		last_transition_size = 2;
		CSR_READ(CSR_REG_MCYCLE, &dispatch_start);

		goto *jump_table[next[bestProgram(scores, 2)]];
	}

L_T9: {
		CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
		transition_cycles[last_transition_size]
			[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;

		static const int next[4] = { 3, 8, 18, 2 };
		fixedpt  scores[4];

		__asm__ volatile("T9_start:");
		CSR_READ(CSR_REG_MCYCLE, &start);

        scores[0] = P20(in1, in2, in3, in4);
        scores[1] = P21(in1, in2, in3, in4);
        scores[2] = P18(in1, in2, in3, in4);
        scores[3] = P14(in1, in2, in3, in4);

		__asm__ volatile("T9_end:");
		CSR_READ(CSR_REG_MCYCLE, &end);

		team_cycles[9] = end - start;

		last_transition_size = 4;
		CSR_READ(CSR_REG_MCYCLE, &dispatch_start);

		goto *jump_table[next[bestProgram(scores, 4)]];
	}

L_T10: {
		CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
		transition_cycles[last_transition_size]
			[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;

		static const int next[4] = { 7, 15, 3, 18 };
		fixedpt  scores[4];

		__asm__ volatile("T10_start:");
		CSR_READ(CSR_REG_MCYCLE, &start);

        scores[0] = P22(in1, in2, in3, in4);
        scores[1] = P23(in1, in2, in3, in4);
        scores[2] = P24(in1, in2, in3, in4);
        scores[3] = P18(in1, in2, in3, in4);

		__asm__ volatile("T10_end:");
		CSR_READ(CSR_REG_MCYCLE, &end);

		team_cycles[10] = end - start;

		last_transition_size = 4;
		CSR_READ(CSR_REG_MCYCLE, &dispatch_start);

		goto *jump_table[next[bestProgram(scores, 4)]];
	}

L_T11: {
		CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
		transition_cycles[last_transition_size]
			[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;

		static const int next[6] = { 10, 6, 9, 18, 20, 6 };
		fixedpt  scores[6];

		__asm__ volatile("T11_start:");
		CSR_READ(CSR_REG_MCYCLE, &start);

        scores[0] = P25(in1, in2, in3, in4);
        scores[1] = P26(in1, in2, in3, in4);
        scores[2] = P27(in1, in2, in3, in4);
        scores[3] = P28(in1, in2, in3, in4);
        scores[4] = P29(in1, in2, in3, in4);
        scores[5] = P30(in1, in2, in3, in4);

		__asm__ volatile("T11_end:");
		CSR_READ(CSR_REG_MCYCLE, &end);

		team_cycles[11] = end - start;

		last_transition_size = 6;
		CSR_READ(CSR_REG_MCYCLE, &dispatch_start);

		goto *jump_table[next[bestProgram(scores, 6)]];
	}

L_T12: {
		CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
		transition_cycles[last_transition_size]
			[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;

		static const int next[7] = { 10, 6, 22, 11, 6, 9, 20 };
		fixedpt  scores[7];

		__asm__ volatile("T12_start:");
		CSR_READ(CSR_REG_MCYCLE, &start);

        scores[0] = P25(in1, in2, in3, in4);
        scores[1] = P31(in1, in2, in3, in4);
        scores[2] = P32(in1, in2, in3, in4);
        scores[3] = P33(in1, in2, in3, in4);
        scores[4] = P34(in1, in2, in3, in4);
        scores[5] = P35(in1, in2, in3, in4);
        scores[6] = P36(in1, in2, in3, in4);

		__asm__ volatile("T12_end:");
		CSR_READ(CSR_REG_MCYCLE, &end);

		team_cycles[12] = end - start;

		last_transition_size = 7;
		CSR_READ(CSR_REG_MCYCLE, &dispatch_start);

		goto *jump_table[next[bestProgram(scores, 7)]];
	}

L_T13: {
		CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
		transition_cycles[last_transition_size]
			[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;

		static const int next[2] = { 10, 12 };
		fixedpt  scores[2];

		__asm__ volatile("T13_start:");
		CSR_READ(CSR_REG_MCYCLE, &start);

        scores[0] = P37(in1, in2, in3, in4);
        scores[1] = P38(in1, in2, in3, in4);

		__asm__ volatile("T13_end:");
		CSR_READ(CSR_REG_MCYCLE, &end);

		team_cycles[13] = end - start;

		last_transition_size = 2;
		CSR_READ(CSR_REG_MCYCLE, &dispatch_start);

		goto *jump_table[next[bestProgram(scores, 2)]];
	}

L_T14: {
		static const int next[4] = { 13, 16, 19, 6 };
		fixedpt  scores[4];

		__asm__ volatile("T14_start:");
		CSR_READ(CSR_REG_MCYCLE, &start);

        scores[0] = P39(in1, in2, in3, in4);
        scores[1] = P40(in1, in2, in3, in4);
        scores[2] = P41(in1, in2, in3, in4);
        scores[3] = P42(in1, in2, in3, in4);

		__asm__ volatile("T14_end:");
		CSR_READ(CSR_REG_MCYCLE, &end);

		team_cycles[14] = end - start;

		last_transition_size = 4;
		CSR_READ(CSR_REG_MCYCLE, &dispatch_start);

		goto *jump_table[next[bestProgram(scores, 4)]];
	}

L_A3: {
	CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
	transition_cycles[last_transition_size]
		[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;

	actions[0] = 3; return;
}
L_A4: {
	CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
	transition_cycles[last_transition_size]
		[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;
	
		actions[0] = 4; return;
} 
L_A5: {
	CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
	transition_cycles[last_transition_size]
		[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;
	
	actions[0] = 5; return;
}
L_A6: {
	CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
	transition_cycles[last_transition_size]
		[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;
	
	actions[0] = 6; return;
}
L_A8: {
	CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
	transition_cycles[last_transition_size]
		[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;
	
	actions[0] = 8; return;
}
L_A0: {

	CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
	transition_cycles[last_transition_size]
		[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;
	
	actions[0] = 0; return;
} 
L_A7: {
	CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
	transition_cycles[last_transition_size]
		[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;
	
	actions[0] = 7; return;
}

L_A1: {
	CSR_READ(CSR_REG_MCYCLE, &dispatch_end);
	
	transition_cycles[last_transition_size]
		[transition_counts[last_transition_size]++] = dispatch_end - dispatch_start;
	
	actions[0] = 1; return;
}
}