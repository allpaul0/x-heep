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
static inline int bestProgram6(const fixedpt * restrict results)
{
    fixedpt s0 = results[0], s1 = results[1], s2 = results[2];
    fixedpt s3 = results[3], s4 = results[4], s5 = results[5];

    /* Branchless tournament — 5 compares, zero branches */
    int32_t m01 = -(s1 >= s0);
    fixedpt t01 = (s0 & ~m01) | (s1 & m01);
    int     i01 = (0  & ~m01) | (1  & m01);

    int32_t m012 = -(s2 >= t01);
    fixedpt t012 = (t01 & ~m012) | (s2 & m012);
    int     i012 = (i01 & ~m012) | (2  & m012);

    int32_t m0123 = -(s3 >= t012);
    fixedpt t0123 = (t012 & ~m0123) | (s3 & m0123);
    int     i0123 = (i012 & ~m0123) | (3  & m0123);

    int32_t m01234 = -(s4 >= t0123);
    fixedpt t01234 = (t0123 & ~m01234) | (s4 & m01234);
    int     i01234 = (i0123 & ~m01234) | (4  & m01234);

    int32_t m012345 = -(s5 >= t01234);
    int     i012345 = (i01234 & ~m012345) | (5 & m012345);

    return i012345;
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

    fixedpt  scores[6];
    uint32_t start, end;

    /* Initial dispatch — always start at T0 */
    goto *jump_table[0];   /* == &&L_T0 */

    /* ---- Team nodes ----------------------------------------- */

L_T0: {
        static const int next[6] = { 1, 1, 4, 5, 1, 7 }; /* T1,T1,A3,A4,T1,A6 */

        scores[0] = P0(in1, in2, in3, in4);
        scores[1] = P1(in1, in2, in3, in4);
        scores[2] = P2(in1, in2, in3, in4);
        scores[3] = P3(in1, in2, in3, in4);
        scores[4] = P4(in1, in2, in3, in4);
        scores[5] = P5(in1, in2, in3, in4);

        goto *jump_table[next[bestProgram6(scores)]];
    }

L_T1: {
        static const int next[6] = { 2, 3, 4, 5, 6, 7 }; /* A1–A6 */

        scores[0] = P0(in1, in2, in3, in4);
        scores[1] = P1(in1, in2, in3, in4);
        scores[2] = P2(in1, in2, in3, in4);
        scores[3] = P3(in1, in2, in3, in4);
        scores[4] = P4(in1, in2, in3, in4);
        scores[5] = P5(in1, in2, in3, in4);

        goto *jump_table[next[bestProgram6(scores)]];
    }

    /* ---- Action nodes (direct returns, no jump needed) -------- */

L_A1: actions[0] = 1; return;
L_A2: actions[0] = 2; return;
L_A3: actions[0] = 3; return;
L_A4: actions[0] = 4; return;
L_A5: actions[0] = 5; return;
L_A6: actions[0] = 6; return;
}