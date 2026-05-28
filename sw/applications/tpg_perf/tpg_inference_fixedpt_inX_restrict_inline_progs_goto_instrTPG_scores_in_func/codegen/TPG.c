/**
 * File generated with GEGELATI v2.0.0
 * Refactored: computed goto dispatch — GCC extension (__label__ / &&label).
 * Eliminates while(1)+switch overhead; each handler jumps directly to the
 * next label. No branch misprediction on the dispatch, no loop counter.
 */

#include "csr.h"
#include "TPG_program.h"
#include "TPG.h"

/* ------------------------------------------------------------ */
/* Helper                                                        */
/* ------------------------------------------------------------ */

static inline int bestProgram(const fixedpt *results, int nb) {
    int   best  = 0;
    fixedpt top = results[0];
    for (int i = 1; i < nb; i++) {
        if (results[i] >= top) { top = results[i]; best = i; }
    }
    return best;
}

/* ------------------------------------------------------------ */
/* Inference — computed goto dispatch                            */
/* ------------------------------------------------------------ */

void inferenceTPG(fixedpt *actions,
                  const fixedpt * restrict in1,
                  const fixedpt * restrict in2,
                  const fixedpt * restrict in3,
                  const fixedpt * restrict in4)
{
    /* Jump table — static const lets GCC keep it in .rodata and
       potentially cache it in a register across iterations.       */
    static const void * const jump_table[] = {
        &&L_T0, &&L_T1,
        &&L_A1, &&L_A2, &&L_A3, &&L_A4, &&L_A5, &&L_A6
    };

    uint32_t start, end;

    /* Initial dispatch — always start at T0 */
    goto *jump_table[0];   /* == &&L_T0 */

    /* ---- Team nodes ----------------------------------------- */

L_T0: {
        static const int next[6] = { 1, 1, 4, 5, 1, 7 }; /* T1,T1,A3,A4,T1,A6 */
        fixedpt  scores[6];

        scores[0] = P0(in1, in2, in3, in4);
        scores[1] = P1(in1, in2, in3, in4);
        scores[2] = P2(in1, in2, in3, in4);
        scores[3] = P3(in1, in2, in3, in4);
        scores[4] = P4(in1, in2, in3, in4);
        scores[5] = P5(in1, in2, in3, in4);

        goto *jump_table[next[bestProgram(scores, 6)]];
    }

L_T1: {
        static const int next[6] = { 2, 3, 4, 5, 6, 7 }; /* A1–A6 */
        fixedpt  scores[6];

        scores[0] = P0(in1, in2, in3, in4);
        scores[1] = P1(in1, in2, in3, in4);
        scores[2] = P2(in1, in2, in3, in4);
        scores[3] = P3(in1, in2, in3, in4);
        scores[4] = P4(in1, in2, in3, in4);
        scores[5] = P5(in1, in2, in3, in4);

        goto *jump_table[next[bestProgram(scores, 6)]];
    }

    /* ---- Action nodes -------- */

L_A1: actions[0] = 1; return;
L_A2: actions[0] = 2; return;
L_A3: actions[0] = 3; return;
L_A4: actions[0] = 4; return;
L_A5: actions[0] = 5; return;
L_A6: actions[0] = 6; return;
}