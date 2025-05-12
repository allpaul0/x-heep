/**
 * File generated with GEGELATI v1.3.1
 * On the 2024-10-04 09:50:24
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

int bestProgram(float *results, int nb) {
	int bestProgram = 0;
	float bestScore = (isnan(results[0]))? -INFINITY : results[0];
	for (int i = 1; i < nb; i++) {
		float challengerScore = (isnan(results[i]))? -INFINITY : results[i];
		if (challengerScore >= bestScore) {
			bestProgram = i;
			bestScore = challengerScore;
		}
	}
	return bestProgram;
}

enum vertices {T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, A19, A20, A21, A22, A23, A24, A25, A26, A27, };

int inferenceTPG() {
	enum vertices currentVertex = T18;
	while(1) {
		switch (currentVertex) {
		case T0: {
			const enum vertices next[3] = { A27, A23, A26,  };

			float T0Scores[3];

			T0Scores[0] = P0();
			T0Scores[1] = P1();
			T0Scores[2] = P2();

			int best = bestProgram(T0Scores, 3);
			currentVertex = next[best];
			break;
		}
		case T1: {
			const enum vertices next[1] = { A25,  };

			float T1Scores[1];

			T1Scores[0] = P3();

			int best = bestProgram(T1Scores, 1);
			currentVertex = next[best];
			break;
		}
		case T2: {
			const enum vertices next[3] = { A20, A22, A22,  };

			float T2Scores[3];

			T2Scores[0] = P4();
			T2Scores[1] = P5();
			T2Scores[2] = P6();

			int best = bestProgram(T2Scores, 3);
			currentVertex = next[best];
			break;
		}
		case T3: {
			const enum vertices next[1] = { A20,  };

			float T3Scores[1];

			T3Scores[0] = P7();

			int best = bestProgram(T3Scores, 1);
			currentVertex = next[best];
			break;
		}
		case T4: {
			const enum vertices next[2] = { A19, T1,  };

			float T4Scores[2];

			T4Scores[0] = P8();
			T4Scores[1] = P9();

			int best = bestProgram(T4Scores, 2);
			currentVertex = next[best];
			break;
		}
		case T5: {
			const enum vertices next[1] = { T4,  };

			float T5Scores[1];

			T5Scores[0] = P10();

			int best = bestProgram(T5Scores, 1);
			currentVertex = next[best];
			break;
		}
		case T6: {
			const enum vertices next[5] = { T3, A20, A22, A27, T2,  };

			float T6Scores[5];

			T6Scores[0] = P11();
			T6Scores[1] = P12();
			T6Scores[2] = P13();
			T6Scores[3] = P0();
			T6Scores[4] = P14();

			int best = bestProgram(T6Scores, 5);
			currentVertex = next[best];
			break;
		}
		case T7: {
			const enum vertices next[2] = { T0, T2,  };

			float T7Scores[2];

			T7Scores[0] = P15();
			T7Scores[1] = P16();

			int best = bestProgram(T7Scores, 2);
			currentVertex = next[best];
			break;
		}
		case T8: {
			const enum vertices next[3] = { T0, T5, A21,  };

			float T8Scores[3];

			T8Scores[0] = P17();
			T8Scores[1] = P18();
			T8Scores[2] = P19();

			int best = bestProgram(T8Scores, 3);
			currentVertex = next[best];
			break;
		}
		case T9: {
			const enum vertices next[3] = { T8, T6, A24,  };

			float T9Scores[3];

			T9Scores[0] = P20();
			T9Scores[1] = P21();
			T9Scores[2] = P22();

			int best = bestProgram(T9Scores, 3);
			currentVertex = next[best];
			break;
		}
		case T10: {
			const enum vertices next[1] = { T9,  };

			float T10Scores[1];

			T10Scores[0] = P23();

			int best = bestProgram(T10Scores, 1);
			currentVertex = next[best];
			break;
		}
		case T11: {
			const enum vertices next[1] = { T7,  };

			float T11Scores[1];

			T11Scores[0] = P24();

			int best = bestProgram(T11Scores, 1);
			currentVertex = next[best];
			break;
		}
		case T12: {
			const enum vertices next[1] = { T6,  };

			float T12Scores[1];

			T12Scores[0] = P25();

			int best = bestProgram(T12Scores, 1);
			currentVertex = next[best];
			break;
		}
		case T13: {
			const enum vertices next[1] = { T7,  };

			float T13Scores[1];

			T13Scores[0] = P24();

			int best = bestProgram(T13Scores, 1);
			currentVertex = next[best];
			break;
		}
		case T14: {
			const enum vertices next[3] = { T10, T12, T6,  };

			float T14Scores[3];

			T14Scores[0] = P26();
			T14Scores[1] = P27();
			T14Scores[2] = P28();

			int best = bestProgram(T14Scores, 3);
			currentVertex = next[best];
			break;
		}
		case T15: {
			const enum vertices next[3] = { T13, T11, T6,  };

			float T15Scores[3];

			T15Scores[0] = P29();
			T15Scores[1] = P30();
			T15Scores[2] = P28();

			int best = bestProgram(T15Scores, 3);
			currentVertex = next[best];
			break;
		}
		case T16: {
			const enum vertices next[4] = { T15, T15, T14, A22,  };

			float T16Scores[4];

			T16Scores[0] = P31();
			T16Scores[1] = P32();
			T16Scores[2] = P33();
			T16Scores[3] = P34();

			int best = bestProgram(T16Scores, 4);
			currentVertex = next[best];
			break;
		}
		case T17: {
			const enum vertices next[1] = { T16,  };

			float T17Scores[1];

			T17Scores[0] = P35();

			int best = bestProgram(T17Scores, 1);
			currentVertex = next[best];
			break;
		}
		case T18: {
			const enum vertices next[1] = { T17,  };

			float T18Scores[1];

			T18Scores[0] = P36();

			int best = bestProgram(T18Scores, 1);
			currentVertex = next[best];
			break;
		}
		case A19: {
			return 0;
			break;
		}
		case A20: {
			return 1;
			break;
		}
		case A21: {
			return 5;
			break;
		}
		case A22: {
			return 6;
			break;
		}
		case A23: {
			return 12;
			break;
		}
		case A24: {
			return 8;
			break;
		}
		case A25: {
			return 3;
			break;
		}
		case A26: {
			return 7;
			break;
		}
		case A27: {
			return 14;
			break;
		}
		}
	}
}
