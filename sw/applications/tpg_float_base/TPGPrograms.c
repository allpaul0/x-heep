/**
 * File generated with GEGELATI v1.3.1
 * On the 2024-10-04 09:50:24
 * With the CodeGen::ProgramGenerationEngine.
 */

#include "TPGPrograms.h"
#include "externHeader.h"
extern float* env;

float P0(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[0];
		float op1 = env[1];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

float P1(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[0];
		float op1 = reg[5];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

float P2(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = reg[2];
		float op1 = env[0];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

float P3(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[0];
		float op1 = env[0];
		reg[7] = op0 + op1;
	}
	{
		float op0 = env[1];
		float op1 = reg[7];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

float P4(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[0];
		float op1 = env[1];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

float P5(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[0];
		float op1 = reg[6];
		reg[7] = op0 * op1;
	}
	{
		float op0 = env[0];
		float op1 = env[1];
		reg[2] = op0 - op1;
	}
	{
		float op0 = reg[2];
		float op1 = reg[7];
		reg[0] = ((op0) < (op1)) ? (op1) : (op0);
	}
	return reg[0];
}

float P6(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[0];
		float op1 = reg[6];
		reg[7] = op0 * op1;
	}
	{
		float op0 = env[1];
		float op1 = env[1];
		reg[5] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		float op0 = reg[5];
		float op1 = reg[7];
		reg[0] = ((op0) < (op1)) ? (op1) : (op0);
	}
	return reg[0];
}

float P7(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = reg[0];
		float op1 = env[1];
		reg[3] = op0 / op1;
	}
	{
		float op0 = env[1];
		float op1 = env[0];
		reg[5] = op0 * op1;
	}
	{
		float op0 = reg[3];
		float op1 = reg[5];
		reg[2] = op0 + op1;
	}
	{
		float op0 = reg[0];
		float op1 = reg[0];
		reg[4] = op0 - op1;
	}
	{
		float op0 = reg[2];
		float op1 = reg[4];
		reg[2] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		float op0 = env[1];
		float op1 = reg[2];
		reg[0] = ((op0) < (op1)) ? (op1) : (op0);
	}
	return reg[0];
}

float P8(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[1];
		float op1 = env[0];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

float P9(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[1];
		float op1 = reg[6];
		reg[4] = op0 + op1;
	}
	{
		float op0 = reg[4];
		float op1 = env[1];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

float P10(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[1];
		float op1 = reg[4];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

float P11(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[1];
		float op1 = env[0];
		reg[1] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		float op0 = reg[6];
		float op1 = reg[1];
		reg[1] = op0 - op1;
	}
	{
		float op0 = reg[1];
		float op1 = reg[2];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

float P12(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[0];
		float op1 = env[1];
		reg[6] = op0 * op1;
	}
	{
		float op0 = reg[6];
		float op1 = env[0];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

float P13(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = reg[7];
		float op1 = env[1];
		reg[3] = op0 * op1;
	}
	{
		float op0 = env[1];
		float op1 = env[0];
		reg[4] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		float op0 = reg[4];
		float op1 = reg[3];
		reg[5] = op0 * op1;
	}
	{
		float op0 = reg[5];
		float op1 = env[0];
		reg[4] = op0 - op1;
	}
	{
		float op0 = reg[4];
		float op1 = reg[4];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

float P14(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[0];
		float op1 = env[1];
		reg[2] = op0 - op1;
	}
	{
		float op0 = env[1];
		float op1 = reg[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

float P15(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[0];
		float op1 = reg[2];
		reg[2] = op0 - op1;
	}
	{
		float op0 = env[0];
		float op1 = env[0];
		reg[7] = op0 + op1;
	}
	{
		float op0 = reg[2];
		float op1 = reg[7];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

float P16(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[0];
		float op1 = env[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

float P17(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = reg[0];
		float op1 = env[0];
		reg[0] = op0 * op1;
	}
	{
		float op0 = env[0];
		float op1 = reg[2];
		reg[2] = op0 - op1;
	}
	{
		float op0 = reg[0];
		float op1 = env[0];
		reg[7] = op0 + op1;
	}
	{
		float op0 = reg[2];
		float op1 = reg[7];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

float P18(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[0];
		float op1 = env[0];
		reg[4] = op0 * op1;
	}
	{
		float op0 = reg[4];
		float op1 = reg[5];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

float P19(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[1];
		float op1 = env[0];
		reg[3] = op0 - op1;
	}
	{
		float op0 = reg[3];
		float op1 = env[1];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

float P20(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[1];
		float op1 = env[1];
		reg[2] = op0 / op1;
	}
	{
		float op0 = env[1];
		float op1 = reg[2];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

float P21(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[1];
		float op1 = env[1];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

float P22(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[0];
		float op1 = env[1];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

float P23(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = reg[2];
		float op1 = reg[5];
		reg[7] = op0 * op1;
	}
	{
		float op0 = env[0];
		float op1 = reg[2];
		reg[2] = op0 - op1;
	}
	{
		float op0 = reg[2];
		float op1 = reg[7];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

float P24(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = reg[0];
		float op1 = env[0];
		reg[5] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		float op0 = reg[4];
		float op1 = reg[6];
		reg[2] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		float op0 = env[0];
		float op1 = reg[2];
		reg[2] = op0 - op1;
	}
	{
		float op0 = reg[2];
		float op1 = reg[5];
		reg[7] = op0 * op1;
	}
	{
		float op0 = reg[2];
		float op1 = reg[7];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

float P25(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = reg[1];
		float op1 = env[0];
		reg[7] = op0 * op1;
	}
	{
		float op0 = env[0];
		float op1 = reg[7];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

float P26(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[0];
		float op1 = env[1];
		reg[2] = op0 * op1;
	}
	{
		float op0 = env[1];
		float op1 = reg[2];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

float P27(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = reg[1];
		float op1 = env[0];
		reg[1] = op0 - op1;
	}
	{
		float op0 = env[1];
		float op1 = reg[1];
		reg[4] = op0 / op1;
	}
	{
		float op0 = reg[0];
		float op1 = env[0];
		reg[5] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		float op0 = reg[4];
		float op1 = reg[6];
		reg[2] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		float op0 = reg[2];
		float op1 = reg[5];
		reg[2] = op0 + op1;
	}
	{
		float op0 = env[0];
		float op1 = reg[2];
		reg[2] = op0 - op1;
	}
	{
		float op0 = reg[2];
		float op1 = reg[5];
		reg[7] = op0 * op1;
	}
	{
		float op0 = reg[2];
		float op1 = reg[7];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

float P28(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[0];
		float op1 = env[1];
		reg[2] = op0 + op1;
		
	}
	{
		float op0 = env[1];
		float op1 = reg[2];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

float P29(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[1];
		float op1 = env[0];
		reg[0] = ((op0) < (op1)) ? (op1) : (op0);
	}
	return reg[0];
}

float P30(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = reg[0];
		float op1 = env[0];
		reg[7] = op0 / op1;
	}
	{
		float op0 = env[1];
		float op1 = reg[7];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

float P31(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[1];
		float op1 = env[1];

		reg[6] = op0 / op1;
	}
	{
		float op0 = env[0];
		float op1 = env[0];
		reg[7] = op0 - op1;
	}
	{
		float op0 = env[0];
		float op1 = reg[6];
		reg[3] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		float op0 = env[0];
		float op1 = reg[7];
		reg[4] = op0 + op1;
	}
	{
		float op0 = reg[4];
		float op1 = reg[7];
		reg[2] = op0 - op1;
	}
	{
		float op0 = env[1];
		float op1 = reg[3];
		reg[3] = op0 - op1;
	}
	{
		float op0 = reg[3];
		float op1 = reg[2];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

float P32(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[0];
		float op1 = reg[5];
		reg[6] = op0 / op1;
	}
	{
		float op0 = env[1];
		float op1 = reg[6];
		reg[0] = ((op0) < (op1)) ? (op1) : (op0);
	}
	return reg[0];
}

float P33(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[0];
		float op1 = reg[6];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

float P34(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[1];
		float op1 = env[0];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

float P35(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = reg[3];
		float op1 = env[0];
		reg[3] = op0 * op1;
	}
	{
		float op0 = env[0];
		float op1 = reg[3];
		reg[0] = op0 / op1;
	}
	return reg[0];
}

float P36(){
	float reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		float op0 = env[1];
		float op1 = env[1];
		reg[5] = op0 / op1;
	}
	{
		float op0 = reg[5];
		float op1 = reg[2];
		reg[0] = op0 / op1;
	}
	return reg[0];
}
