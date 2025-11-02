/**
 * File generated with GEGELATI v1.3.1
 * On the 2024-06-07 10:10:23
 * With the CodeGen::TPGGenerationEngine.
 */

#include "TPGGraph.h"
#include "TPGPrograms.h"
#include <limits.h>
#include <assert.h>
#include <float.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdint.h>
#include <math.h>

int bestProgram(int *results, int nb) {
	int bestProgram = 0;
	int bestScore = results[0];
	//int bestScore = (isnan(results[0]))? -INFINITY : results[0];
	for (int i = 1; i < nb; i++) {
		int challengerScore = results[i];
		//int challengerScore = (isnan(results[i]))? -INFINITY : results[i];
		if (challengerScore >= bestScore) {
			bestProgram = i;
			bestScore = challengerScore;
		}
	}
	return bestProgram;
}

enum vertices {T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24, T25, T26, T27, T28, T29, T30, T31, T32, A33, A34, A35, A36, A37, A38, A39, A40, A41, };

int inferenceTPG() {
	enum vertices currentVertex = T32;
	while(1) {
		switch (currentVertex) {
		case T0: {
			const enum vertices next[3] = { A33, A36, A37,  };

			int T0Scores[3];

			T0Scores[0] = P0();
			T0Scores[1] = P1();
			T0Scores[2] = P2();

			int best = bestProgram(T0Scores, 3);
			currentVertex = next[best];
			break;
		}
		case T1: {
			const enum vertices next[2] = { A35, A34,  };

			int T1Scores[2];

			T1Scores[0] = P3();
			T1Scores[1] = P4();

			int best = bestProgram(T1Scores, 2);
			currentVertex = next[best];
			break;
		}
		case T2: {
			const enum vertices next[1] = { A38,  };

			int T2Scores[1];

			T2Scores[0] = P5();

			int best = bestProgram(T2Scores, 1);
			currentVertex = next[best];
			break;
		}
		case T3: {
			const enum vertices next[1] = { A33,  };

			int T3Scores[1];

			T3Scores[0] = P6();

			int best = bestProgram(T3Scores, 1);
			currentVertex = next[best];
			break;
		}
		case T4: {
			const enum vertices next[1] = { A38,  };

			int T4Scores[1];

			T4Scores[0] = P7();

			int best = bestProgram(T4Scores, 1);
			currentVertex = next[best];
			break;
		}
		case T5: {
			const enum vertices next[2] = { T0, A39,  };

			int T5Scores[2];

			T5Scores[0] = P8();
			T5Scores[1] = P9();

			int best = bestProgram(T5Scores, 2);
			currentVertex = next[best];
			break;
		}
		case T6: {
			const enum vertices next[1] = { A37,  };

			int T6Scores[1];

			T6Scores[0] = P10();

			int best = bestProgram(T6Scores, 1);
			currentVertex = next[best];
			break;
		}
		case T7: {
			const enum vertices next[2] = { A36, T4,  };

			int T7Scores[2];

			T7Scores[0] = P11();
			T7Scores[1] = P12();

			int best = bestProgram(T7Scores, 2);
			currentVertex = next[best];
			break;
		}
		case T8: {
			const enum vertices next[3] = { A40, T1, A37,  };

			int T8Scores[3];

			T8Scores[0] = P13();
			T8Scores[1] = P14();
			T8Scores[2] = P15();

			int best = bestProgram(T8Scores, 3);
			currentVertex = next[best];
			break;
		}
		case T9: {
			const enum vertices next[1] = { T5,  };

			int T9Scores[1];

			T9Scores[0] = P16();

			int best = bestProgram(T9Scores, 1);
			currentVertex = next[best];
			break;
		}
		case T10: {
			const enum vertices next[4] = { T5, A41, T7, T9,  };

			int T10Scores[4];

			T10Scores[0] = P17();
			T10Scores[1] = P18();
			T10Scores[2] = P19();
			T10Scores[3] = P20();

			int best = bestProgram(T10Scores, 4);
			currentVertex = next[best];
			break;
		}
		case T11: {
			const enum vertices next[3] = { T5, T6, T5,  };

			int T11Scores[3];

			T11Scores[0] = P21();
			T11Scores[1] = P22();
			T11Scores[2] = P17();

			int best = bestProgram(T11Scores, 3);
			currentVertex = next[best];
			break;
		}
		case T12: {
			const enum vertices next[3] = { T5, T8, T5,  };

			int T12Scores[3];

			T12Scores[0] = P23();
			T12Scores[1] = P24();
			T12Scores[2] = P25();

			int best = bestProgram(T12Scores, 3);
			currentVertex = next[best];
			break;
		}
		case T13: {
			const enum vertices next[2] = { T10, T5,  };

			int T13Scores[2];

			T13Scores[0] = P26();
			T13Scores[1] = P17();

			int best = bestProgram(T13Scores, 2);
			currentVertex = next[best];
			break;
		}
		case T14: {
			const enum vertices next[1] = { T5,  };

			int T14Scores[1];

			T14Scores[0] = P27();

			int best = bestProgram(T14Scores, 1);
			currentVertex = next[best];
			break;
		}
		case T15: {
			const enum vertices next[1] = { T5,  };

			int T15Scores[1];

			T15Scores[0] = P17();

			int best = bestProgram(T15Scores, 1);
			currentVertex = next[best];
			break;
		}
		case T16: {
			const enum vertices next[2] = { T11, T12,  };

			int T16Scores[2];

			T16Scores[0] = P28();
			T16Scores[1] = P29();

			int best = bestProgram(T16Scores, 2);
			currentVertex = next[best];
			break;
		}
		case T17: {
			const enum vertices next[3] = { T2, T5, T5,  };

			int T17Scores[3];

			T17Scores[0] = P30();
			T17Scores[1] = P31();
			T17Scores[2] = P32();

			int best = bestProgram(T17Scores, 3);
			currentVertex = next[best];
			break;
		}
		case T18: {
			const enum vertices next[1] = { T17,  };

			int T18Scores[1];

			T18Scores[0] = P33();

			int best = bestProgram(T18Scores, 1);
			currentVertex = next[best];
			break;
		}
		case T19: {
			const enum vertices next[2] = { T5, T8,  };

			int T19Scores[2];

			T19Scores[0] = P34();
			T19Scores[1] = P35();

			int best = bestProgram(T19Scores, 2);
			currentVertex = next[best];
			break;
		}
		case T20: {
			const enum vertices next[2] = { T5, T16,  };

			int T20Scores[2];

			T20Scores[0] = P36();
			T20Scores[1] = P37();

			int best = bestProgram(T20Scores, 2);
			currentVertex = next[best];
			break;
		}
		case T21: {
			const enum vertices next[3] = { T19, T16, T15,  };

			int T21Scores[3];

			T21Scores[0] = P38();
			T21Scores[1] = P39();
			T21Scores[2] = P40();

			int best = bestProgram(T21Scores, 3);
			currentVertex = next[best];
			break;
		}
		case T22: {
			const enum vertices next[2] = { T14, T16,  };

			int T22Scores[2];

			T22Scores[0] = P41();
			T22Scores[1] = P42();

			int best = bestProgram(T22Scores, 2);
			currentVertex = next[best];
			break;
		}
		case T23: {
			const enum vertices next[1] = { T17,  };

			int T23Scores[1];

			T23Scores[0] = P43();

			int best = bestProgram(T23Scores, 1);
			currentVertex = next[best];
			break;
		}
		case T24: {
			const enum vertices next[3] = { T20, T23, T13,  };

			int T24Scores[3];

			T24Scores[0] = P44();
			T24Scores[1] = P45();
			T24Scores[2] = P46();

			int best = bestProgram(T24Scores, 3);
			currentVertex = next[best];
			break;
		}
		case T25: {
			const enum vertices next[1] = { T21,  };

			int T25Scores[1];

			T25Scores[0] = P47();

			int best = bestProgram(T25Scores, 1);
			currentVertex = next[best];
			break;
		}
		case T26: {
			const enum vertices next[4] = { T17, T16, T18, A37,  };

			int T26Scores[4];

			T26Scores[0] = P48();
			T26Scores[1] = P49();
			T26Scores[2] = P50();
			T26Scores[3] = P51();

			int best = bestProgram(T26Scores, 4);
			currentVertex = next[best];
			break;
		}
		case T27: {
			const enum vertices next[4] = { T24, T22, T25, T21,  };

			int T27Scores[4];

			T27Scores[0] = P52();
			T27Scores[1] = P53();
			T27Scores[2] = P54();
			T27Scores[3] = P55();

			int best = bestProgram(T27Scores, 4);
			currentVertex = next[best];
			break;
		}
		case T28: {
			const enum vertices next[3] = { T27, T11, T26,  };

			int T28Scores[3];

			T28Scores[0] = P56();
			T28Scores[1] = P57();
			T28Scores[2] = P58();

			int best = bestProgram(T28Scores, 3);
			currentVertex = next[best];
			break;
		}
		case T29: {
			const enum vertices next[4] = { T26, T28, T27, T17,  };

			int T29Scores[4];

			T29Scores[0] = P59();
			T29Scores[1] = P60();
			T29Scores[2] = P56();
			T29Scores[3] = P61();

			int best = bestProgram(T29Scores, 4);
			currentVertex = next[best];
			break;
		}
		case T30: {
			const enum vertices next[5] = { T27, T28, T28, T3, T17,  };

			int T30Scores[5];

			T30Scores[0] = P62();
			T30Scores[1] = P63();
			T30Scores[2] = P64();
			T30Scores[3] = P65();
			T30Scores[4] = P66();

			int best = bestProgram(T30Scores, 5);
			currentVertex = next[best];
			break;
		}
		case T31: {
			const enum vertices next[3] = { T28, T30, T29,  };

			int T31Scores[3];

			T31Scores[0] = P67();
			T31Scores[1] = P68();
			T31Scores[2] = P69();

			int best = bestProgram(T31Scores, 3);
			currentVertex = next[best];
			break;
		}
		case T32: {
			const enum vertices next[4] = { T28, T31, T30, T8,  };

			int T32Scores[4];

			T32Scores[0] = P70();
			T32Scores[1] = P71();
			T32Scores[2] = P72();
			T32Scores[3] = P24();

			int best = bestProgram(T32Scores, 4);
			currentVertex = next[best];
			break;
		}
		case A33: {
			return 3;
			break;
		}
		case A34: {
			return 4;
			break;
		}
		case A35: {
			return 7;
			break;
		}
		case A36: {
			return 6;
			break;
		}
		case A37: {
			return 2;
			break;
		}
		case A38: {
			return 0;
			break;
		}
		case A39: {
			return 9;
			break;
		}
		case A40: {
			return 1;
			break;
		}
		case A41: {
			return 8;
			break;
		}
		}
	}
}
