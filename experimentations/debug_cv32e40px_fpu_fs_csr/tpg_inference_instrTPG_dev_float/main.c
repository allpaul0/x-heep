/* File: benchmarks/tpg_embedded_benchmark.c
   Embedded RISC-V benchmark adapted from desktop version.
   - Uses CSR cycle counter (MCYCLE)
   - Uses inferenceTPG(&actionID)
   - Uses in1..in4 pointers, passed to inferenceTPG as args instead of global extern, to allow restrict qualifier in externHeader.h
     (and thus better optimization opportunities for inferenceTPG)
     Note: in1..in4 are still global pointers, but now they are set to point to local buffers in main() instead of being directly used as extern arrays.
     This allows us to keep the same precalculated dataSourcesLE_* arrays and just copy their values into local buffers before calling inferenceTPG.
     This way we can still use the same precalculated data without modification, while enabling better optimization in inferenceTPG.
   - Computes per-class mean & stddev using Welford algorithm (online)
*/


#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

#include "csr.h"                        // CSR macros (CSR_WRITE/READ/CLEAR_BITS)
#include "codegen/externHeader.h"       // extern declarations: typeInf, inferenceTPG
#include "precalcul/LE_states.h"        // dataSourcesLE_* arrays, ids_graph_traversals[], NB_SEED, NB_CLASSES
#include "codegen/TPG.h"                // forward declarations if needed

/* By default, printfs are activated for FPGA and disabled for simulation. */
#define PRINTF_IN_FPGA  1
#define PRINTF_IN_SIM   1

#if TARGET_SIM && PRINTF_IN_SIM
    #define PRINTF(fmt, ...)    printf(fmt, ## __VA_ARGS__)
#elif PRINTF_IN_FPGA
        #define PRINTF(fmt, ...)    printf(fmt, ## __VA_ARGS__)
#else
     #define PRINTF(...)
#endif

void inferenceTPG(int *actions, const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4);
#define DECL(n) float P##n(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4);

DECL(0)  DECL(1)  DECL(2)  DECL(3)  DECL(4)  DECL(5)  DECL(6)  DECL(7)
DECL(8)  DECL(9)  DECL(10) DECL(11) DECL(12) DECL(13) DECL(14) DECL(15)
DECL(16) DECL(17) DECL(18) DECL(19) DECL(20) DECL(21) DECL(22) DECL(23)
DECL(24) DECL(25) DECL(26) DECL(27) DECL(28) DECL(29) DECL(30) DECL(31)
DECL(32) DECL(33) DECL(34) DECL(35) DECL(36) DECL(37) DECL(38) DECL(39)
DECL(40) DECL(41) DECL(42) DECL(43) DECL(44) DECL(45) DECL(46) DECL(47)
DECL(48) DECL(49) DECL(50) DECL(51) DECL(52) DECL(53) DECL(54) DECL(55)
DECL(56) DECL(57) DECL(58) DECL(59) DECL(60) DECL(61) DECL(62) DECL(63)

#undef DECL
/* Assign input buffers for seed and point global in1..in4 pointers at them */
static void assign_LE_values(int seed, 
                             typeInf *in1, 
                             typeInf *in2, 
                             typeInf *in3, 
                             typeInf *in4)
{
    in1[0] = dataSourcesLE_0[seed];
    in1[1] = dataSourcesLE_1[seed];
    in1[2] = dataSourcesLE_2[seed];

    in2[0] = dataSourcesLE_3[seed];
    in2[1] = dataSourcesLE_4[seed];
    in2[2] = dataSourcesLE_5[seed];

    in3[0] = dataSourcesLE_6[seed];
    in3[1] = dataSourcesLE_7[seed];
    in3[2] = dataSourcesLE_8[seed];

    in4[0] = dataSourcesLE_9[seed];
    in4[1] = dataSourcesLE_10[seed];
    in4[2] = dataSourcesLE_11[seed];
    in4[3] = dataSourcesLE_12[seed];
    in4[4] = dataSourcesLE_13[0];
    in4[5] = dataSourcesLE_14[0];
}

/* Welford accumulators per class */
typedef struct {
    uint32_t count;
    float mean;
    float M2;
} Welford;

static void welford_add(Welford *s, float x)
{
    s->count++;
    float delta = x - s->mean;
    s->mean += delta / s->count;
    float delta2 = x - s->mean;
    s->M2 += delta * delta2;
}

int main(void)
{
    typeInf in1[3];
    typeInf in2[3];
    typeInf in3[3];
    typeInf in4[6];

    /* Prepare CSR cycle counter */
    CSR_CLEAR_BITS(CSR_REG_MCOUNTINHIBIT, 0x1); // enable cycle counting

    /* Arrays sized by NB_CLASSES (extern from LE_states.h) */
    Welford accumulators[NB_CLASSES];

    for (int c = 0; c < NB_CLASSES; ++c) {
        accumulators[c].count = 0;
        accumulators[c].mean = 0.0;
        accumulators[c].M2 = 0.0;
    }

    /* Temporary variables */
    uint32_t total_cycles = 0;
    int actionID = -1;

    for (int seed = 0; seed < NB_SEED; ++seed)
    {        
        assign_LE_values(seed, in1, in2, in3, in4);

        // PRINTF("seed %d: %d %d %d %d\n", seed, (int)in1[0], (int)in2[0], (int)in3[0], (int)in4[0]);

        // float s[7] = { P57(in1,in2,in3,in4), P58(in1,in2,in3,in4), P59(in1,in2,in3,in4),
        //             P60(in1,in2,in3,in4), P61(in1,in2,in3,in4), P62(in1,in2,in3,in4),
        //             P63(in1,in2,in3,in4) };

        // for (int k=0;k<7;k++){ uint32_t b; memcpy(&b,&s[k],4); PRINTF("s%d=%08x\n",k,b); }

        /* reset MCYCLE */
        CSR_WRITE(CSR_REG_MCYCLE, 0);

        inferenceTPG(&actionID, in1, in2, in3, in4);

        /* read cycles (64-bit if available in CSR_READ) */
        CSR_READ(CSR_REG_MCYCLE, &total_cycles);

        //PRINTF("actionID=%d, class=%d\n", actionID, ids_graph_traversals[seed]);

        int cls = ids_graph_traversals[seed];
        if (cls < 0 || cls >= NB_CLASSES) {
            PRINTF("Seed %d has invalid class %d\n", seed, cls);
            continue;
        }

        PRINTF("action: %d, seed %d cls %d\n", actionID, seed, cls);

        welford_add(&accumulators[cls], total_cycles);
        
    }

    /* Print per-class statistics */
    PRINTF("Class,Count,AvgCyclesPerClass,StddevCyclesPerClass\n");
    for (int c = 0; c < NB_CLASSES; ++c)
    {
        if (accumulators[c].count == 0) continue;
        float mean = accumulators[c].mean;
        float variance = (accumulators[c].count > 1) ? (accumulators[c].M2 / (accumulators[c].count - 1)) : 0.0;
        float stddev = (variance > 0.0) ? sqrt(variance) : 0.0;
        PRINTF("%d,%u,%d,%d\n", c, accumulators[c].count, (int) mean, (int) stddev);
    }

    return 0;
}


//static inline
int bestProgram(const float *results, int nb) {
   
	int bestProgram = 0;
	float bestScore = (isnan(results[0]))? -INFINITY : results[0];
	for (int i = 1; i < nb; i++) {
		float challengerScore = (isnan(results[i]))? -INFINITY : results[i];
		if (challengerScore >= bestScore) {
			bestProgram = i;
			bestScore = challengerScore;
		}
	}
    
    // char buf[512];
    // int pos = 0;

    // pos += snprintf(buf + pos, sizeof(buf) - pos, "Results:");

    // for (int i = 0; i < nb && pos < (int)sizeof(buf); i++) {
    //     pos += snprintf(buf + pos, sizeof(buf) - pos, " %f", results[i]);
    // }

    // snprintf(buf + pos, sizeof(buf) - pos," | bestProgram=%d score=%f\n", bestProgram, bestScore);
    // PRINTF("%s", buf);

	return bestProgram;
}

/* ------------------------------------------------------------ */
/* Inference — computed goto dispatch                            */
/* ------------------------------------------------------------ */
//__attribute__((noipa, optimize("no-gcse,no-crossjumping,no-thread-jumps,no-tree-tail-merge")))
//__attribute__((optimize("no-finite-math-only","rounding-math","fp-contract=off")))
void inferenceTPG(int *actions,
					const float * __restrict__ in1, 
					const float * __restrict__ in2, 
					const float * __restrict__ in3, 
					const float * __restrict__ in4)
{
	/* Jump table — static const lets GCC keep it in .rodata and
	   potentially cache it in a register across iterations.       */
	static const void * const jump_table[] = {
		&&L_T0, &&L_T1, &&L_T2, &&L_T3, &&L_T4, &&L_T5, &&L_T6, &&L_T7, &&L_T8, &&L_T9, &&L_T10, &&L_T11, &&L_T12, &&L_T13, &&L_T14, &&L_T15, &&L_T16, &&L_T17, &&L_T18, &&L_T19, &&L_A4, &&L_A0, &&L_A7, &&L_A8, &&L_A5, &&L_A6, &&L_A1, &&L_A2
    };

	/* Initial dispatch — always start at T19 */
	goto *jump_table[19];	/* == &&L_T19 */

	/* ---- Team nodes ----------------------------------------- */

L_T0: {
		//PRINTF("Team %d\n", 0);
		static const int next[3] = { 20, 21, 23 };
		float  scores[3];

        scores[0] = P0(in1, in2, in3, in4);
        scores[1] = P1(in1, in2, in3, in4);
        scores[2] = P2(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 3)]];
	}

L_T1: {
		//PRINTF("Team %d\n", 1);
		static const int next[3] = { 0, 24, 22 };
		float  scores[3];

        scores[0] = P3(in1, in2, in3, in4);
        scores[1] = P4(in1, in2, in3, in4);
        scores[2] = P5(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 3)]];
	}

L_T2: {
		//PRINTF("Team %d\n", 2);
		static const int next[2] = { 0, 24 };
		float  scores[2];

        scores[0] = P6(in1, in2, in3, in4);
        scores[1] = P7(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 2)]];
	}

L_T3: {
		//PRINTF("Team %d\n", 3);
		static const int next[5] = { 0, 25, 24, 0, 22 };
		float  scores[5];

        scores[0] = P3(in1, in2, in3, in4);
        scores[1] = P8(in1, in2, in3, in4);
        scores[2] = P9(in1, in2, in3, in4);
        scores[3] = P10(in1, in2, in3, in4);
        scores[4] = P11(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 5)]];
	}

L_T4: {
		//PRINTF("Team %d\n", 4);
		static const int next[3] = { 1, 0, 0 };
		float  scores[3];

        scores[0] = P12(in1, in2, in3, in4);
        scores[1] = P13(in1, in2, in3, in4);
        scores[2] = P14(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 3)]];
	}

L_T5: {
		//PRINTF("Team %d\n", 5);
		static const int next[3] = { 1, 0, 0 };
		float  scores[3];

        scores[0] = P15(in1, in2, in3, in4);
        scores[1] = P14(in1, in2, in3, in4);
        scores[2] = P16(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 3)]];
	}

L_T6: {
		//PRINTF("Team %d\n", 6);
		static const int next[4] = { 5, 22, 25, 25 };
		float  scores[4];

        scores[0] = P17(in1, in2, in3, in4);
        scores[1] = P18(in1, in2, in3, in4);
        scores[2] = P19(in1, in2, in3, in4);
        scores[3] = P20(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 4)]];
	}

L_T7: {
		//PRINTF("Team %d\n", 7);
		static const int next[4] = { 3, 0, 0, 6 };
		float  scores[4];

        scores[0] = P21(in1, in2, in3, in4);
        scores[1] = P22(in1, in2, in3, in4);
        scores[2] = P23(in1, in2, in3, in4);
        scores[3] = P24(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 4)]];
	}

L_T8: {
		//PRINTF("Team %d\n", 8);
		static const int next[5] = { 2, 0, 0, 6, 24 };
		float  scores[5];

        scores[0] = P25(in1, in2, in3, in4);
        scores[1] = P14(in1, in2, in3, in4);
        scores[2] = P26(in1, in2, in3, in4);
        scores[3] = P27(in1, in2, in3, in4);
        scores[4] = P28(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 5)]];
	}

L_T9: {
		//PRINTF("Team %d\n", 9);
		static const int next[4] = { 3, 24, 0, 6 };
		float  scores[4];

        scores[0] = P29(in1, in2, in3, in4);
        scores[1] = P30(in1, in2, in3, in4);
        scores[2] = P14(in1, in2, in3, in4);
        scores[3] = P31(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 4)]];
	}

L_T10: {
		//PRINTF("Team %d\n", 10);
		static const int next[6] = { 3, 0, 6, 24, 8, 27 };
		float  scores[6];

        scores[0] = P21(in1, in2, in3, in4);
        scores[1] = P14(in1, in2, in3, in4);
        scores[2] = P32(in1, in2, in3, in4);
        scores[3] = P33(in1, in2, in3, in4);
        scores[4] = P34(in1, in2, in3, in4);
        scores[5] = P35(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 6)]];
	}

L_T11: {
		//PRINTF("Team %d\n", 11);
		static const int next[3] = { 25, 6, 7 };
		float  scores[3];

        scores[0] = P36(in1, in2, in3, in4);
        scores[1] = P37(in1, in2, in3, in4);
        scores[2] = P38(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 3)]];
	}

L_T12: {
		//PRINTF("Team %d\n", 12);
		static const int next[2] = { 8, 10 };
		float  scores[2];

        scores[0] = P39(in1, in2, in3, in4);
        scores[1] = P40(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 2)]];
	}

L_T13: {
		//PRINTF("Team %d\n", 13);
		static const int next[5] = { 11, 26, 7, 0, 0 };
		float  scores[5];

        scores[0] = P41(in1, in2, in3, in4);
        scores[1] = P42(in1, in2, in3, in4);
        scores[2] = P38(in1, in2, in3, in4);
        scores[3] = P14(in1, in2, in3, in4);
        scores[4] = P43(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 5)]];
	}

L_T14: {
		//PRINTF("Team %d\n", 14);
		static const int next[5] = { 13, 10, 25, 26, 0 };
		float  scores[5];

        scores[0] = P44(in1, in2, in3, in4);
        scores[1] = P45(in1, in2, in3, in4);
        scores[2] = P46(in1, in2, in3, in4);
        scores[3] = P42(in1, in2, in3, in4);
        scores[4] = P47(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 5)]];
	}

L_T15: {
		//PRINTF("Team %d\n", 15);
		static const int next[4] = { 10, 25, 12, 7 };
		float  scores[4];

        scores[0] = P45(in1, in2, in3, in4);
        scores[1] = P46(in1, in2, in3, in4);
        scores[2] = P48(in1, in2, in3, in4);
        scores[3] = P49(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 4)]];
	}

L_T16: {
		//PRINTF("Team %d\n", 16);
		static const int next[2] = { 14, 27 };
		float  scores[2];

        scores[0] = P50(in1, in2, in3, in4);
        scores[1] = P51(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 2)]];
	}

L_T17: {
		//PRINTF("Team %d\n", 17);
		static const int next[2] = { 16, 8 };
		float  scores[2];

        scores[0] = P52(in1, in2, in3, in4);
        scores[1] = P53(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 2)]];
	}

L_T18: {
		//PRINTF("Team %d\n", 18);
		static const int next[3] = { 15, 17, 16 };
		float  scores[3];

        scores[0] = P54(in1, in2, in3, in4);
        scores[1] = P55(in1, in2, in3, in4);
        scores[2] = P56(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 3)]];
	}

L_T19: {
		//PRINTF("Team %d\n", 19);
		static const int next[7] = { 26, 9, 18, 22, 27, 4, 0 };
		float  scores[7];

        scores[0] = P57(in1, in2, in3, in4);
        scores[1] = P58(in1, in2, in3, in4);
        scores[2] = P59(in1, in2, in3, in4);
        scores[3] = P60(in1, in2, in3, in4);
        scores[4] = P61(in1, in2, in3, in4);
        scores[5] = P62(in1, in2, in3, in4);
        scores[6] = P63(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 7)]];
	}

L_A4: actions[0] = 4; return;
L_A0: actions[0] = 0; return;
L_A7: actions[0] = 7; return;
L_A8: actions[0] = 8; return;
L_A5: actions[0] = 5; return;
L_A6: actions[0] = 6; return;
L_A1: actions[0] = 1; return;
L_A2: actions[0] = 2; return;
}

inline __attribute__((always_inline)) float protected_div(float a, float b) {
    if (b == 0.0f) {
        if (a > 0.0f) return INFINITY;
        if (a < 0.0f) return -INFINITY;
        return NAN;              /* 0/0 */
    }
    return a / b;
}

inline __attribute__((always_inline)) float P0(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	return reg[0];
}

inline __attribute__((always_inline)) float P1(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = reg[7];
		float op1 = in1[0];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P2(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[1];
		float op1 = reg[2];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P3(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[2];
		float op1 = in2[2];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P4(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in1[2];
		float op1 = in3[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P5(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[0];
		float op1 = in3[1];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P6(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[2];
		float op1 = in2[2];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P7(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[2];
		float op1 = in3[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P8(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in2[0];
		float op1 = in3[1];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P9(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in2[2];
		float op1 = in3[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P10(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[2];
		float op1 = in2[0];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P11(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[0];
		float op1 = in3[1];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P12(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in2[0];
		float op1 = in2[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P13(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[2];
		float op1 = in4[2];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P14(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in1[0];
		float op1 = in2[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P15(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in2[0];
		float op1 = in2[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P16(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[5];
		float op1 = in2[2];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P17(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in1[2];
		float op1 = in3[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P18(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[1];
		float op1 = in3[1];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P19(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[2];
		float op1 = in3[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P20(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[1];
		float op1 = in3[2];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P21(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in2[0];
		float op1 = in2[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P22(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in1[0];
		float op1 = in2[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P23(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[1];
		float op1 = in2[0];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P24(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in1[2];
		float op1 = in2[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P25(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in2[0];
		float op1 = in2[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P26(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[2];
		float op1 = in4[2];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P27(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in1[1];
		float op1 = in2[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P28(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in1[2];
		float op1 = in3[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P29(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in2[0];
		float op1 = in2[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P30(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[2];
		float op1 = in4[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P31(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in1[2];
		float op1 = in2[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P32(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in1[2];
		float op1 = in2[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P33(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[2];
		float op1 = in4[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P34(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in1[0];
		float op1 = in3[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P35(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[2];
		float op1 = in3[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P36(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in2[2];
		float op1 = in2[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P37(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in1[2];
		float op1 = in2[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P38(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in2[0];
		float op1 = in2[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P39(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[5];
		float op1 = in2[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P40(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[2];
		float op1 = in4[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P41(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[0];
		float op1 = in2[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P42(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[1];
		float op1 = in3[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P43(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[1];
		float op1 = in4[2];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P44(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in1[1];
		float op1 = in3[1];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P45(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[2];
		float op1 = in4[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P46(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in2[1];
		float op1 = in4[0];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P47(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[0];
		float op1 = in1[1];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P48(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[2];
		float op1 = in4[1];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P49(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[0];
		float op1 = in3[1];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P50(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[5];
		float op1 = in2[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P51(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[2];
		float op1 = in3[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P52(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[1];
		float op1 = in2[1];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P53(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[5];
		float op1 = in2[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P54(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in1[2];
		float op1 = in4[5];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P55(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in2[0];
		float op1 = in1[0];
		reg[6] = op0 - op1;
	}
	{
		float op0 = in1[2];
		float op1 = reg[6];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P56(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in2[2];
		float op1 = in2[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P57(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in2[0];
		float op1 = in3[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P58(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[1];
		float op1 = reg[0];
        reg[0] = op0 / op1;
		//reg[0] = op0 / op1;
        //PRINTF("op0: %f, op1: %f, reg[0]: %f\n", op0, op1, reg[0]);
	}
    // {
	// 	float op0 = -in3[1];
	// 	float op1 = reg[1];
	// 	reg[1] = op0 / op1;
    //     //PRINTF("op0: %f, op1: %f, reg[1]: %f\n", op0, op1, reg[1]);
	// }

	return reg[0] ;//+ reg[1];
}

inline __attribute__((always_inline)) float P59(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[1];
		float op1 = in2[1];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P60(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[0];
		float op1 = in3[1];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P61(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[2];
		float op1 = in3[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P62(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[2];
		float op1 = in2[2];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P63(const float * __restrict__ in1, const float * __restrict__ in2, const float * __restrict__ in3, const float * __restrict__ in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[0];
		float op1 = in2[2];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

