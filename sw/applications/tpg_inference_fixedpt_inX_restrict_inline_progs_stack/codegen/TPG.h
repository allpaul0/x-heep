/**
 * File generated with GEGELATI v2.0.0
 * On the 2025-11-21 13:02:17
 * With the CodeGen::TPGGenerationEngine.
 */

#ifndef C_TPG_H
#define C_TPG_H

#ifdef __cplusplus
extern "C" {
#endif

#include "TPG_program.h"

#include <stdlib.h>
#include <limits.h>
#include <assert.h>
#include <float.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdint.h>
#include <math.h>

#include "externHeader.h"

typedef enum Vertex {T0Vert, T1Vert, T2Vert, T3Vert, T4Vert, T5Vert, T6Vert, T7Vert, T8Vert, T9Vert, T10Vert, T11Vert, T12Vert, T13Vert, T14Vert, T15Vert, T16Vert, T17Vert, T18Vert, T19Vert, T20Vert, T21Vert, A3Vert, A4Vert, A5Vert, A6Vert, A8Vert, A0Vert, A1Vert, } Vertex;

typedef struct Edge {
	Vertex destination;
	fixedpt (*ptr_prog)();
	void* (*ptr_vertex)(fixedpt* actions);
}Edge;

void inferenceTPG(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);

void executeFromVertex(void*(*)(fixedpt*), fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* executeTeam(Edge* e, int nbEdge);
int execute(Edge* e, int nbEdge);

void* T0(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* T1(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* T2(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* T3(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* T4(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* T5(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* T6(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* T7(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* T8(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* T9(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* T10(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* T11(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* T12(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* T13(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* T14(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* T15(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* T16(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* T17(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* T18(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* T19(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* T20(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* T21(fixedpt* actions, const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4);
void* A3(fixedpt* actions);
void* A4(fixedpt* actions);
void* A5(fixedpt* actions);
void* A6(fixedpt* actions);
void* A8(fixedpt* actions);
void* A0(fixedpt* actions);
void* A1(fixedpt* actions);

extern void* (*root)(fixedpt* actions);

#ifdef __cplusplus
}
#endif

#endif
