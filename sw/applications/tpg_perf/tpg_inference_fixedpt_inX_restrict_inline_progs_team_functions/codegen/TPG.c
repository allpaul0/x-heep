/**
 * File generated with GEGELATI v2.0.0
 * Refactored version: TX logic moved to functions.
 */

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

enum vertices {T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24, A25, A26, A27, A28, A29, A30, A31};

/* ========================= */
/* ===== TX FUNCTIONS ====== */
/* ========================= */

enum vertices T0_func(const fixedpt * restrict in1,
                      const fixedpt * restrict in2,
                      const fixedpt * restrict in3,
                      const fixedpt * restrict in4)
{
	const enum vertices next[2] = { A27, A28 };
	fixedpt scores[2];
	scores[0] = P0(in1, in2, in3, in4);
	scores[1] = P1(in1, in2, in3, in4);
	return next[bestProgram(scores, 2)];
}

enum vertices T1_func(const fixedpt * restrict in1,
                      const fixedpt * restrict in2,
                      const fixedpt * restrict in3,
                      const fixedpt * restrict in4)
{
	const enum vertices next[2] = { A27, A28 };
	fixedpt scores[2];
	scores[0] = P2(in1, in2, in3, in4);
	scores[1] = P3(in1, in2, in3, in4);
	return next[bestProgram(scores, 2)];
}

enum vertices T2_func(const fixedpt * restrict in1,
                      const fixedpt * restrict in2,
                      const fixedpt * restrict in3,
                      const fixedpt * restrict in4)
{
	const enum vertices next[2] = { T1, A26 };
	fixedpt scores[2];
	scores[0] = P4(in1, in2, in3, in4);
	scores[1] = P5(in1, in2, in3, in4);
	return next[bestProgram(scores, 2)];
}

enum vertices T3_func(const fixedpt * restrict in1,
                      const fixedpt * restrict in2,
                      const fixedpt * restrict in3,
                      const fixedpt * restrict in4)
{
	const enum vertices next[3] = { A28, A27, A30 };
	fixedpt scores[3];
	scores[0] = P3(in1, in2, in3, in4);
	scores[1] = P6(in1, in2, in3, in4);
	scores[2] = P7(in1, in2, in3, in4);
	return next[bestProgram(scores, 3)];
}

enum vertices T4_func(const fixedpt * restrict in1,
                      const fixedpt * restrict in2,
                      const fixedpt * restrict in3,
                      const fixedpt * restrict in4)
{
	const enum vertices next[3] = { A28, A30, T0 };
	fixedpt scores[3];
	scores[0] = P8(in1, in2, in3, in4);
	scores[1] = P9(in1, in2, in3, in4);
	scores[2] = P10(in1, in2, in3, in4);
	return next[bestProgram(scores, 3)];
}

enum vertices T5_func(const fixedpt * restrict in1,
                      const fixedpt * restrict in2,
                      const fixedpt * restrict in3,
                      const fixedpt * restrict in4)
{
	const enum vertices next[1] = { T2 };
	fixedpt scores[1];
	scores[0] = P11(in1, in2, in3, in4);
	return next[bestProgram(scores, 1)];
}

enum vertices T6_func(const fixedpt * restrict in1,
                      const fixedpt * restrict in2,
                      const fixedpt * restrict in3,
                      const fixedpt * restrict in4)
{
	const enum vertices next[5] = { A26, A30, A28, A25, A28 };
	fixedpt scores[5];
	scores[0] = P12(in1, in2, in3, in4);
	scores[1] = P13(in1, in2, in3, in4);
	scores[2] = P14(in1, in2, in3, in4);
	scores[3] = P15(in1, in2, in3, in4);
	scores[4] = P16(in1, in2, in3, in4);
	return next[bestProgram(scores, 5)];
}

enum vertices T7_func(const fixedpt * restrict in1,
                      const fixedpt * restrict in2,
                      const fixedpt * restrict in3,
                      const fixedpt * restrict in4)
{
	const enum vertices next[1] = { T4 };
	fixedpt scores[1];
	scores[0] = P17(in1, in2, in3, in4);
	return next[bestProgram(scores, 1)];
}

enum vertices T8_func(const fixedpt * restrict in1,
                      const fixedpt * restrict in2,
                      const fixedpt * restrict in3,
                      const fixedpt * restrict in4)
{
	const enum vertices next[1] = { T3 };
	fixedpt scores[1];
	scores[0] = P18(in1, in2, in3, in4);
	return next[bestProgram(scores, 1)];
}

enum vertices T9_func(const fixedpt * restrict in1,
                      const fixedpt * restrict in2,
                      const fixedpt * restrict in3,
                      const fixedpt * restrict in4)
{
	const enum vertices next[3] = { T6, A25, A28 };
	fixedpt scores[3];
	scores[0] = P19(in1, in2, in3, in4);
	scores[1] = P20(in1, in2, in3, in4);
	scores[2] = P21(in1, in2, in3, in4);
	return next[bestProgram(scores, 3)];
}

enum vertices T10_func(const fixedpt * restrict in1,
                       const fixedpt * restrict in2,
                       const fixedpt * restrict in3,
                       const fixedpt * restrict in4)
{
	const enum vertices next[2] = { A27, T9 };
	fixedpt scores[2];
	scores[0] = P22(in1, in2, in3, in4);
	scores[1] = P23(in1, in2, in3, in4);
	return next[bestProgram(scores, 2)];
}

enum vertices T11_func(const fixedpt * restrict in1,
                       const fixedpt * restrict in2,
                       const fixedpt * restrict in3,
                       const fixedpt * restrict in4)
{
	const enum vertices next[2] = { T6, T7 };
	fixedpt scores[2];
	scores[0] = P24(in1, in2, in3, in4);
	scores[1] = P25(in1, in2, in3, in4);
	return next[bestProgram(scores, 2)];
}

enum vertices T12_func(const fixedpt * restrict in1,
                       const fixedpt * restrict in2,
                       const fixedpt * restrict in3,
                       const fixedpt * restrict in4)
{
	const enum vertices next[4] = { A29, T4, A29, T5 };
	fixedpt scores[4];
	scores[0] = P26(in1, in2, in3, in4);
	scores[1] = P27(in1, in2, in3, in4);
	scores[2] = P28(in1, in2, in3, in4);
	scores[3] = P29(in1, in2, in3, in4);
	return next[bestProgram(scores, 4)];
}

enum vertices T13_func(const fixedpt * restrict in1,
                       const fixedpt * restrict in2,
                       const fixedpt * restrict in3,
                       const fixedpt * restrict in4)
{
	const enum vertices next[2] = { T11, A26 };
	fixedpt scores[2];
	scores[0] = P30(in1, in2, in3, in4);
	scores[1] = P12(in1, in2, in3, in4);
	return next[bestProgram(scores, 2)];
}

enum vertices T14_func(const fixedpt * restrict in1,
                       const fixedpt * restrict in2,
                       const fixedpt * restrict in3,
                       const fixedpt * restrict in4)
{
	const enum vertices next[1] = { T12 };
	fixedpt scores[1];
	scores[0] = P31(in1, in2, in3, in4);
	return next[bestProgram(scores, 1)];
}

enum vertices T15_func(const fixedpt * restrict in1,
                       const fixedpt * restrict in2,
                       const fixedpt * restrict in3,
                       const fixedpt * restrict in4)
{
	const enum vertices next[1] = { T13 };
	fixedpt scores[1];
	scores[0] = P32(in1, in2, in3, in4);
	return next[bestProgram(scores, 1)];
}

enum vertices T16_func(const fixedpt * restrict in1,
                       const fixedpt * restrict in2,
                       const fixedpt * restrict in3,
                       const fixedpt * restrict in4)
{
	const enum vertices next[2] = { T10, T14 };
	fixedpt scores[2];
	scores[0] = P33(in1, in2, in3, in4);
	scores[1] = P34(in1, in2, in3, in4);
	return next[bestProgram(scores, 2)];
}

enum vertices T17_func(const fixedpt * restrict in1,
                       const fixedpt * restrict in2,
                       const fixedpt * restrict in3,
                       const fixedpt * restrict in4)
{
	const enum vertices next[2] = { A31, T12 };
	fixedpt scores[2];
	scores[0] = P35(in1, in2, in3, in4);
	scores[1] = P36(in1, in2, in3, in4);
	return next[bestProgram(scores, 2)];
}

enum vertices T18_func(const fixedpt * restrict in1,
                       const fixedpt * restrict in2,
                       const fixedpt * restrict in3,
                       const fixedpt * restrict in4)
{
	const enum vertices next[6] = { T16, T15, A30, T13, A31, T13 };
	fixedpt scores[6];
	scores[0] = P37(in1, in2, in3, in4);
	scores[1] = P38(in1, in2, in3, in4);
	scores[2] = P39(in1, in2, in3, in4);
	scores[3] = P40(in1, in2, in3, in4);
	scores[4] = P41(in1, in2, in3, in4);
	scores[5] = P32(in1, in2, in3, in4);
	return next[bestProgram(scores, 6)];
}

enum vertices T19_func(const fixedpt * restrict in1,
                       const fixedpt * restrict in2,
                       const fixedpt * restrict in3,
                       const fixedpt * restrict in4)
{
	const enum vertices next[7] = { T16, A31, A31, T13, T10, T18, T17 };
	fixedpt scores[7];
	scores[0] = P42(in1, in2, in3, in4);
	scores[1] = P43(in1, in2, in3, in4);
	scores[2] = P44(in1, in2, in3, in4);
	scores[3] = P45(in1, in2, in3, in4);
	scores[4] = P46(in1, in2, in3, in4);
	scores[5] = P47(in1, in2, in3, in4);
	scores[6] = P48(in1, in2, in3, in4);
	return next[bestProgram(scores, 7)];
}

enum vertices T20_func(const fixedpt * restrict in1,
                       const fixedpt * restrict in2,
                       const fixedpt * restrict in3,
                       const fixedpt * restrict in4)
{
	const enum vertices next[2] = { T13, T8 };
	fixedpt scores[2];
	scores[0] = P45(in1, in2, in3, in4);
	scores[1] = P49(in1, in2, in3, in4);
	return next[bestProgram(scores, 2)];
}

enum vertices T21_func(const fixedpt * restrict in1,
                       const fixedpt * restrict in2,
                       const fixedpt * restrict in3,
                       const fixedpt * restrict in4)
{
	const enum vertices next[2] = { T13, T18 };
	fixedpt scores[2];
	scores[0] = P50(in1, in2, in3, in4);
	scores[1] = P51(in1, in2, in3, in4);
	return next[bestProgram(scores, 2)];
}

enum vertices T22_func(const fixedpt * restrict in1,
                       const fixedpt * restrict in2,
                       const fixedpt * restrict in3,
                       const fixedpt * restrict in4)
{
	const enum vertices next[4] = { T15, T20, T19, T21 };
	fixedpt scores[4];
	scores[0] = P52(in1, in2, in3, in4);
	scores[1] = P53(in1, in2, in3, in4);
	scores[2] = P54(in1, in2, in3, in4);
	scores[3] = P55(in1, in2, in3, in4);
	return next[bestProgram(scores, 4)];
}

enum vertices T23_func(const fixedpt * restrict in1,
                       const fixedpt * restrict in2,
                       const fixedpt * restrict in3,
                       const fixedpt * restrict in4)
{
	const enum vertices next[4] = { T16, T22, T19, T17 };
	fixedpt scores[4];
	scores[0] = P42(in1, in2, in3, in4);
	scores[1] = P56(in1, in2, in3, in4);
	scores[2] = P57(in1, in2, in3, in4);
	scores[3] = P58(in1, in2, in3, in4);
	return next[bestProgram(scores, 4)];
}

enum vertices T24_func(const fixedpt * restrict in1,
                       const fixedpt * restrict in2,
                       const fixedpt * restrict in3,
                       const fixedpt * restrict in4)
{
	const enum vertices next[4] = { A31, T23, T19, T17 };
	fixedpt scores[4];
	scores[0] = P43(in1, in2, in3, in4);
	scores[1] = P59(in1, in2, in3, in4);
	scores[2] = P57(in1, in2, in3, in4);
	scores[3] = P60(in1, in2, in3, in4);
	return next[bestProgram(scores, 4)];
}

/* ========================= */
/* ===== INFERENCE LOOP ==== */
/* ========================= */

void inferenceTPG(fixedpt* actions,
                  const fixedpt * restrict in1,
                  const fixedpt * restrict in2,
                  const fixedpt * restrict in3,
                  const fixedpt * restrict in4)
{
	enum vertices currentVertex = T24;

	while (1) {
		switch (currentVertex) {
			case T0:  currentVertex = T0_func(in1, in2, in3, in4); break;
			case T1:  currentVertex = T1_func(in1, in2, in3, in4); break;
			case T2:  currentVertex = T2_func(in1, in2, in3, in4); break;
			case T3:  currentVertex = T3_func(in1, in2, in3, in4); break;
			case T4:  currentVertex = T4_func(in1, in2, in3, in4); break;
			case T5:  currentVertex = T5_func(in1, in2, in3, in4); break;
			case T6:  currentVertex = T6_func(in1, in2, in3, in4); break;
			case T7:  currentVertex = T7_func(in1, in2, in3, in4); break;
			case T8:  currentVertex = T8_func(in1, in2, in3, in4); break;
			case T9:  currentVertex = T9_func(in1, in2, in3, in4); break;
			case T10: currentVertex = T10_func(in1, in2, in3, in4); break;
			case T11: currentVertex = T11_func(in1, in2, in3, in4); break;
			case T12: currentVertex = T12_func(in1, in2, in3, in4); break;
			case T13: currentVertex = T13_func(in1, in2, in3, in4); break;
			case T14: currentVertex = T14_func(in1, in2, in3, in4); break;
			case T15: currentVertex = T15_func(in1, in2, in3, in4); break;
			case T16: currentVertex = T16_func(in1, in2, in3, in4); break;
			case T17: currentVertex = T17_func(in1, in2, in3, in4); break;
			case T18: currentVertex = T18_func(in1, in2, in3, in4); break;
			case T19: currentVertex = T19_func(in1, in2, in3, in4); break;
			case T20: currentVertex = T20_func(in1, in2, in3, in4); break;
			case T21: currentVertex = T21_func(in1, in2, in3, in4); break;
			case T22: currentVertex = T22_func(in1, in2, in3, in4); break;
			case T23: currentVertex = T23_func(in1, in2, in3, in4); break;
			case T24: currentVertex = T24_func(in1, in2, in3, in4); break;
			case A25: actions[0] = 3; return;
			case A26: actions[0] = 4; return;
			case A27: actions[0] = 5; return;	
			case A28: actions[0] = 6; return;
			case A29: actions[0] = 8; return;
			case A30: actions[0] = 0; return;
			case A31: actions[0] = 1; return;
		}
	}
}