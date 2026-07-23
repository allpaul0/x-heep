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

uint32_t ms, fc;

void inferenceTPG(int *actions, float * in1, float * in2, float * in3, float * in4);
#define DECL(n) float P##n(float *in1, float *in2, float *in3, float *in4);

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
	 /* FP unit init — must precede any FP instruction */
    //asm volatile ("csrs mstatus, %0" :: "r"(0x2000));  /* FS = Initial */
    //asm volatile ("fscsr x0");                         /* RNE, clear exception flags */
	

	// asm volatile ("csrr %0, mstatus" : "=r"(ms));
	// asm volatile ("csrr %0, fcsr"    : "=r"(fc));
	// PRINTF("mstatus=%08x FS=%d | fcsr=%08x frm=%d fflags=%02x\n",
    //    (unsigned)ms, (int)((ms>>13)&3),
    //    (unsigned)fc, (int)((fc>>5)&7), (unsigned)(fc&0x1f));

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

    // Print per-class statistics 
    PRINTF("Class,Count,AvgCyclesPerClass,StddevCyclesPerClass\n");
    for (int c = 0; c < NB_CLASSES; ++c)
    {
        if (accumulators[c].count == 0) continue;
        float mean = accumulators[c].mean;
        float variance = (accumulators[c].count > 1) ? (accumulators[c].M2 / (accumulators[c].count - 1)) : 0.0;
        float stddev = (variance > 0.0) ? sqrt(variance) : 0.0;
        PRINTF("%d,%u,%d,%d\n", c, accumulators[c].count, (int) mean, (int) stddev);
    }


/*
	asm volatile ("csrr %0, mstatus" : "=r"(ms));
	asm volatile ("csrr %0, fcsr"    : "=r"(fc));
	PRINTF("mstatus=%08x FS=%d | fcsr=%08x frm=%d fflags=%02x\n",
       (unsigned)ms, (int)((ms>>13)&3),
       (unsigned)fc, (int)((fc>>5)&7), (unsigned)(fc&0x1f));


	asm volatile ("csrs mstatus, %0" :: "r"(0x2000));  // FS = Initial 


	asm volatile ("csrr %0, mstatus" : "=r"(ms));
	asm volatile ("csrr %0, fcsr"    : "=r"(fc));
	PRINTF("mstatus=%08x FS=%d | fcsr=%08x frm=%d fflags=%02x\n",
       (unsigned)ms, (int)((ms>>13)&3),
       (unsigned)fc, (int)((fc>>5)&7), (unsigned)(fc&0x1f));


    for (int c = 0; c < NB_CLASSES; ++c) {
        accumulators[c].count = 0;
        accumulators[c].mean = 0.0;
        accumulators[c].M2 = 0.0;
    }

    // Temporary variables 
    total_cycles = 0;
    actionID = -1;

    for (int seed = 0; seed < 2; ++seed)
    {        
        assign_LE_values(seed, in1, in2, in3, in4);

        // PRINTF("seed %d: %d %d %d %d\n", seed, (int)in1[0], (int)in2[0], (int)in3[0], (int)in4[0]);

        // float s[7] = { P57(in1,in2,in3,in4), P58(in1,in2,in3,in4), P59(in1,in2,in3,in4),
        //             P60(in1,in2,in3,in4), P61(in1,in2,in3,in4), P62(in1,in2,in3,in4),
        //             P63(in1,in2,in3,in4) };

        // for (int k=0;k<7;k++){ uint32_t b; memcpy(&b,&s[k],4); PRINTF("s%d=%08x\n",k,b); }

        // reset MCYCLE 
        CSR_WRITE(CSR_REG_MCYCLE, 0);

        inferenceTPG(&actionID, in1, in2, in3, in4);

        // read cycles (64-bit if available in CSR_READ) 
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

    // Print per-class statistics 
    PRINTF("Class,Count,AvgCyclesPerClass,StddevCyclesPerClass\n");
    for (int c = 0; c < NB_CLASSES; ++c)
    {
        if (accumulators[c].count == 0) continue;
        float mean = accumulators[c].mean;
        float variance = (accumulators[c].count > 1) ? (accumulators[c].M2 / (accumulators[c].count - 1)) : 0.0;
        float stddev = (variance > 0.0) ? sqrt(variance) : 0.0;
        PRINTF("%d,%u,%d,%d\n", c, accumulators[c].count, (int) mean, (int) stddev);
    }

*/
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


//static inline
/*
int bestProgram(const float *results, int nb) {
   
	int bestProgram = 0;
	int n0 = isnan(results[0]);

    float bestScore = n0 ? -INFINITY : results[0];

	char dbg[512];
    int dp = 0;
    {
        uint32_t r0, b0;
        memcpy(&r0, &results[0], 4);
        memcpy(&b0, &bestScore, 4);
        dp += snprintf(dbg + dp, sizeof(dbg) - dp,
                       "[i0 raw=%08lx isnan=%d -> best=%08lx]",
                       (unsigned long)r0, n0, (unsigned long)b0);
    }

	for (int i = 1; i < nb; i++) {
		int ni = isnan(results[i]);
        float challengerScore = ni ? -INFINITY : results[i];
        int ge = (challengerScore >= bestScore);


		 if (dp < (int)sizeof(dbg)) {
            uint32_t ri, ci;
            memcpy(&ri, &results[i], 4);
            memcpy(&ci, &challengerScore, 4);
            dp += snprintf(dbg + dp, sizeof(dbg) - dp,
                           "[i%d raw=%08lx isnan=%d chal=%08lx ge=%d]",
                           i, (unsigned long)ri, ni, (unsigned long)ci, ge);
        }

        if (ge) { bestProgram = i; bestScore = challengerScore; }
    }
    
  	uint32_t b_before, b_after;
    memcpy(&b_before, &bestScore, 4);          // snapshot BEFORE any %f 

    char buf[512];
    int pos = 0;
    pos += snprintf(buf + pos, sizeof(buf) - pos, "Results:");
    for (int i = 0; i < nb && pos < (int)sizeof(buf); i++)
        pos += snprintf(buf + pos, sizeof(buf) - pos, " %f", results[i]);

    memcpy(&b_after, &bestScore, 4);           // snapshot AFTER the %f calls 

    PRINTF("%s | best=%d before=%08lx after=%08lx\n",
           buf, bestProgram, (unsigned long)b_before, (unsigned long)b_after);

    return bestProgram;
}
	*/



/* ------------------------------------------------------------ */
/* Inference — computed goto dispatch                            */
/* ------------------------------------------------------------ */
//__attribute__((noipa, optimize("no-gcse,no-crossjumping,no-thread-jumps,no-tree-tail-merge")))
//__attribute__((optimize("no-finite-math-only","rounding-math","fp-contract=off")))

void inferenceTPG(int *actions,
					float * in1,
					float * in2,
					float * in3,
					float * in4)
{
	/* Jump table — static const lets GCC keep it in .rodata and
	   potentially cache it in a register across iterations.       */
	static const void * const jump_table[] = {
		&&L_T0, &&L_T1, &&L_T2, &&L_T3, &&L_T4, &&L_T5, &&L_T6, &&L_T7, &&L_T8, &&L_T9, &&L_T10, &&L_T11, &&L_T12, &&L_T13, &&L_T14, &&L_A2, &&L_A5, &&L_A6, &&L_A7, &&L_A4, &&L_A0
    };

	/* Initial dispatch — always start at T14 */
	goto *jump_table[14];	/* == &&L_T14 */

	/* ---- Team nodes ----------------------------------------- */

L_T0: {
		static const int next[2] = { 16, 17 };
		float  scores[2];

        scores[0] = P0(in1, in2, in3, in4);
        scores[1] = P1(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 2)]];
	}

L_T1: {
		static const int next[4] = { 19, 17, 15, 19 };
		float  scores[4];

        scores[0] = P2(in1, in2, in3, in4);
        scores[1] = P3(in1, in2, in3, in4);
        scores[2] = P4(in1, in2, in3, in4);
        scores[3] = P5(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 4)]];
	}

L_T2: {
		static const int next[4] = { 17, 15, 16, 19 };
		float  scores[4];

        scores[0] = P3(in1, in2, in3, in4);
        scores[1] = P4(in1, in2, in3, in4);
        scores[2] = P6(in1, in2, in3, in4);
        scores[3] = P7(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 4)]];
	}

L_T3: {
		static const int next[5] = { 17, 18, 19, 18, 16 };
		float  scores[5];

        scores[0] = P8(in1, in2, in3, in4);
        scores[1] = P9(in1, in2, in3, in4);
        scores[2] = P10(in1, in2, in3, in4);
        scores[3] = P11(in1, in2, in3, in4);
        scores[4] = P6(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 5)]];
	}

L_T4: {
		static const int next[2] = { 15, 2 };
		float  scores[2];

        scores[0] = P12(in1, in2, in3, in4);
        scores[1] = P13(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 2)]];
	}

L_T5: {
		static const int next[7] = { 0, 16, 3, 2, 15, 4, 16 };
		float  scores[7];

        scores[0] = P14(in1, in2, in3, in4);
        scores[1] = P15(in1, in2, in3, in4);
        scores[2] = P16(in1, in2, in3, in4);
        scores[3] = P17(in1, in2, in3, in4);
        scores[4] = P18(in1, in2, in3, in4);
        scores[5] = P19(in1, in2, in3, in4);
        scores[6] = P6(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 7)]];
	}

L_T6: {
		static const int next[2] = { 1, 5 };
		float  scores[2];

        scores[0] = P20(in1, in2, in3, in4);
        scores[1] = P21(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 2)]];
	}

L_T7: {
		static const int next[2] = { 6, 0 };
		float  scores[2];

        scores[0] = P22(in1, in2, in3, in4);
        scores[1] = P23(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 2)]];
	}

L_T8: {
		static const int next[4] = { 0, 0, 6, 2 };
		float  scores[4];

        scores[0] = P24(in1, in2, in3, in4);
        scores[1] = P23(in1, in2, in3, in4);
        scores[2] = P22(in1, in2, in3, in4);
        scores[3] = P25(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 4)]];
	}

L_T9: {

		// asm volatile ("csrr %0, mstatus" : "=r"(ms));
		// asm volatile ("csrr %0, fcsr"    : "=r"(fc));
		// PRINTF("mstatus=%08x FS=%d | fcsr=%08x frm=%d fflags=%02x\n",
		// (unsigned)ms, (int)((ms>>13)&3),
		// (unsigned)fc, (int)((fc>>5)&7), (unsigned)(fc&0x1f));

		static const int next[3] = { 7, 3, 1 };
		float  scores[3];

        scores[0] = P26(in1, in2, in3, in4);
        scores[1] = P27(in1, in2, in3, in4);
        scores[2] = P20(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 3)]];
	}

L_T10: {
		static const int next[3] = { 8, 1, 3 };
		float  scores[3];

        scores[0] = P28(in1, in2, in3, in4);
        scores[1] = P20(in1, in2, in3, in4);
        scores[2] = P27(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 3)]];
	}

L_T11: {
		static const int next[2] = { 10, 20 };
		float  scores[2];

        scores[0] = P29(in1, in2, in3, in4);
        scores[1] = P30(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 2)]];
	}

L_T12: {
		static const int next[5] = { 15, 11, 3, 15, 20 };
		float  scores[5];

        scores[0] = P31(in1, in2, in3, in4);
        scores[1] = P32(in1, in2, in3, in4);
        scores[2] = P33(in1, in2, in3, in4);
        scores[3] = P34(in1, in2, in3, in4);
        scores[4] = P35(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 5)]];
	}

L_T13: {

		// asm volatile ("csrr %0, mstatus" : "=r"(ms));
		// asm volatile ("csrr %0, fcsr"    : "=r"(fc));
		// PRINTF("mstatus=%08x FS=%d | fcsr=%08x frm=%d fflags=%02x\n",
		// (unsigned)ms, (int)((ms>>13)&3),
		// (unsigned)fc, (int)((fc>>5)&7), (unsigned)(fc&0x1f));
		
		static const int next[3] = { 12, 20, 9 };
		float  scores[3];

        scores[0] = P36(in1, in2, in3, in4);
        scores[1] = P37(in1, in2, in3, in4);
        scores[2] = P38(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 3)]];
	}

L_T14: {
		static const int next[4] = { 8, 3, 0, 13 };
		float  scores[4];

        scores[0] = P39(in1, in2, in3, in4);
        scores[1] = P40(in1, in2, in3, in4);
        scores[2] = P41(in1, in2, in3, in4);
        scores[3] = P42(in1, in2, in3, in4);

		goto *jump_table[next[bestProgram(scores, 4)]];
	}

L_A2: actions[0] = 2; return;
L_A5: actions[0] = 5; return;
L_A6: actions[0] = 6; return;
L_A7: actions[0] = 7; return;
L_A4: actions[0] = 4; return;
L_A0: actions[0] = 0; return;
}


inline __attribute__((always_inline)) float protected_div(float a, float b) {
    if (b == 0.0f) {
        if (a > 0.0f) return INFINITY;
        if (a < 0.0f) return -INFINITY;
        return NAN;              /* 0/0 */
    }
    return a / b;
}



inline __attribute__((always_inline)) float P0(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[2];
		float op1 = in4[1];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P1(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	return reg[0];
}

inline __attribute__((always_inline)) float P2(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in1[0];
		float op1 = reg[5];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P3(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[1];
		float op1 = in3[1];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P4(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[2];
		float op1 = in4[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P5(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[2];
		float op1 = in3[1];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P6(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[2];
		float op1 = in4[1];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P7(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	return reg[0];
}

inline __attribute__((always_inline)) float P8(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[0];
		float op1 = in3[1];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P9(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in1[1];
		float op1 = in2[0];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P10(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[2];
		float op1 = in3[1];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P11(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in1[2];
		float op1 = in3[1];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P12(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[2];
		float op1 = in2[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P13(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[0];
		float op1 = in4[1];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P14(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in1[2];
		float op1 = in3[1];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P15(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[2];
		float op1 = in4[1];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P16(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[1];
		float op1 = in1[1];
		reg[0] = fmaxf(op0, op1);
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P17(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[0];
		float op1 = in4[1];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P18(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[2];
		float op1 = in4[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P19(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[0];
		float op1 = in4[1];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P20(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[1];
		float op1 = in1[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P21(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[0];
		float op1 = in4[1];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P22(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[0];
		float op1 = in4[3];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P23(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[1];
		float op1 = in4[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P24(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in2[1];
		float op1 = in3[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P25(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in1[0];
		float op1 = reg[5];
		reg[7] = fmaxf(op0, op1);
	}
	{
		float op0 = in3[0];
		float op1 = reg[7];
		reg[5] = op0 / op1;
	}
	{
		float op0 = reg[5];
		float op1 = in4[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P26(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[4];
		float op1 = in4[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P27(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[1];
		float op1 = in2[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P28(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[3];
		float op1 = in2[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P29(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[3];
		float op1 = in2[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P30(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[4];
		float op1 = in2[1];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P31(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[1];
		float op1 = in4[3];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P32(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[2];
		float op1 = in2[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P33(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[3];
		float op1 = in3[1];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P34(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[0];
		float op1 = in4[3];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P35(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = reg[1];
		float op1 = in1[0];
		reg[1] = op0 + op1;
	}
	{
		float op0 = reg[1];
		float op1 = in1[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P36(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in3[1];
		float op1 = reg[7];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P37(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in1[0];
		float op1 = in3[1];
		reg[7] = op0 * op1;
	}
	{
		float op0 = in4[5];
		float op1 = reg[7];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P38(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[2];
		float op1 = in1[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P39(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[2];
		float op1 = in2[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P40(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in4[3];
		float op1 = in3[1];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P41(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in1[2];
		float op1 = in3[2];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

inline __attribute__((always_inline)) float P42(float * in1, float * in2, float * in3, float * in4) {
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = in1[0];
		float op1 = in3[2];
		reg[7] = op0 * op1;
	}
	{
		float op0 = in4[1];
		float op1 = reg[7];
		reg[0] = op0 * op1;
	}
	return reg[0];
}
