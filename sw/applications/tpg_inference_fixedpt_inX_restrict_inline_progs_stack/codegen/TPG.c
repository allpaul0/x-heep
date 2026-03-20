/**
 * File generated with GEGELATI v2.0.0
 * On the 2026-02-18 17:09:18
 * With the CodeGen::TPGGenerationEngine.
 */

#include "TPG.h"

#include <limits.h> 
#include <assert.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <math.h>

void inferenceTPG(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	executeFromVertex(root, actions, in1, in2, in3, in4);
}

void executeFromVertex(void*(*ptr_f)(fixedpt*), fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	void*(*f)(fixedpt*) = ptr_f;
	while (f!=NULL){
		f = (void*(*)(fixedpt*)) (f(actions));
	}
}

void* executeTeam(Edge* e, int nbEdge){
	int idxNext = execute(e, nbEdge); 
	if(idxNext != -1) {
		return e[idxNext].ptr_vertex;
	}
	return NULL;
}

int execute(Edge* e, int nbEdge){
	fixedpt bestResult;
	int idxNext = 0;
	int idx;
	fixedpt r;

	bestResult = e[idxNext].ptr_prog();
	idx = idxNext + 1;

	while (idx < nbEdge){
		r = e[idx].ptr_prog();
		if (r >= bestResult){
			bestResult = r;
			idxNext = idx;
		}
		idx++;
	}
	return idxNext;
}

void* T0(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{A4Vert, P0, A4}
	};
	int nbEdge = 1;
	return executeTeam(e,nbEdge);
}

void* T1(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{A5Vert, P1, A5}
	};
	int nbEdge = 1;
	return executeTeam(e,nbEdge);
}

void* T2(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{A5Vert, P2, A5}
	};
	int nbEdge = 1;
	return executeTeam(e,nbEdge);
}

void* T3(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{A4Vert, P3, A4}
	};
	int nbEdge = 1;
	return executeTeam(e,nbEdge);
}

void* T4(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{T1Vert, P4, T1},
			{A0Vert, P5, A0}
	};
	int nbEdge = 2;
	return executeTeam(e,nbEdge);
}

void* T5(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{T3Vert, P6, T3},
			{T3Vert, P7, T3}
	};
	int nbEdge = 2;
	return executeTeam(e,nbEdge);
}

void* T6(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{A4Vert, P8, A4},
			{A0Vert, P9, A0},
			{A6Vert, P10, A6},
			{A3Vert, P11, A3},
			{A6Vert, P12, A6}
	};
	int nbEdge = 5;
	return executeTeam(e,nbEdge);
}

void* T7(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{T2Vert, P13, T2},
			{T4Vert, P14, T4}
	};
	int nbEdge = 2;
	return executeTeam(e,nbEdge);
}

void* T8(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{A4Vert, P3, A4}
	};
	int nbEdge = 1;
	return executeTeam(e,nbEdge);
}

void* T9(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{T6Vert, P15, T6},
			{A6Vert, P16, A6}
	};
	int nbEdge = 2;
	return executeTeam(e,nbEdge);
}

void* T10(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{A5Vert, P17, A5},
			{T9Vert, P18, T9}
	};
	int nbEdge = 2;
	return executeTeam(e,nbEdge);
}

void* T11(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{T0Vert, P19, T0},
			{T7Vert, P20, T7}
	};
	int nbEdge = 2;
	return executeTeam(e,nbEdge);
}

void* T12(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{A8Vert, P21, A8},
			{T4Vert, P22, T4},
			{A6Vert, P23, A6},
			{A8Vert, P24, A8},
			{A6Vert, P25, A6},
			{T5Vert, P26, T5}
	};
	int nbEdge = 6;
	return executeTeam(e,nbEdge);
}

void* T13(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{T4Vert, P14, T4},
			{T5Vert, P27, T5},
			{T11Vert, P28, T11},
			{A4Vert, P8, A4}
	};
	int nbEdge = 4;
	return executeTeam(e,nbEdge);
}

void* T14(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{T12Vert, P29, T12}
	};
	int nbEdge = 1;
	return executeTeam(e,nbEdge);
}

void* T15(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{A1Vert, P30, A1},
			{T12Vert, P31, T12},
			{T6Vert, P32, T6}
	};
	int nbEdge = 3;
	return executeTeam(e,nbEdge);
}

void* T16(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{T14Vert, P33, T14},
			{A0Vert, P34, A0},
			{T13Vert, P35, T13},
			{A1Vert, P36, A1}
	};
	int nbEdge = 4;
	return executeTeam(e,nbEdge);
}

void* T17(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{T15Vert, P37, T15},
			{A1Vert, P38, A1},
			{A1Vert, P39, A1},
			{T13Vert, P40, T13},
			{T10Vert, P41, T10},
			{T16Vert, P42, T16},
			{T15Vert, P43, T15}
	};
	int nbEdge = 7;
	return executeTeam(e,nbEdge);
}

void* T18(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{T8Vert, P44, T8}
	};
	int nbEdge = 1;
	return executeTeam(e,nbEdge);
}

void* T19(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{T14Vert, P45, T14},
			{T18Vert, P46, T18},
			{T17Vert, P47, T17}
	};
	int nbEdge = 3;
	return executeTeam(e,nbEdge);
}

void* T20(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{T19Vert, P48, T19},
			{T17Vert, P49, T17},
			{T15Vert, P50, T15}
	};
	int nbEdge = 3;
	return executeTeam(e,nbEdge);
}

void* T21(fixedpt* actions, const fixedpt * restrict in1,
                	const fixedpt * restrict in2,
					const fixedpt * restrict in3,
                	const fixedpt * restrict in4){
	static Edge e[] = {
			{A3Vert, P51, A3},
			{A1Vert, P38, A1},
			{T20Vert, P52, T20},
			{T17Vert, P49, T17},
			{T15Vert, P53, T15}
	};
	int nbEdge = 5;
	return executeTeam(e,nbEdge);
}

void* A3(fixedpt* actions){

    *actions = 3;
	return NULL;
}

void* A4(fixedpt* actions){

    *actions = 4;
	return NULL;
}

void* A5(fixedpt* actions){

    *actions = 5;
	return NULL;
}

void* A6(fixedpt* actions){

    *actions = 6;
	return NULL;
}

void* A8(fixedpt* actions){

    *actions = 8;
	return NULL;
}

void* A0(fixedpt* actions){

    *actions = 0;
	return NULL;
}

void* A1(fixedpt* actions){

    *actions = 1;
	return NULL;
}

void* (*root)(fixedpt* actions) = T21;
