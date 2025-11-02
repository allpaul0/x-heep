/**
 * File generated with GEGELATI v1.3.1
 * On the 2024-06-07 10:10:23
 * With the CodeGen::ProgramGenerationEngine.
 */

#include "TPGPrograms.h"
#include "externHeader.h"
extern int* env;

int P0(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[0];
		reg[0] = f_div(op0, op1);
	}
	return reg[0];
}

int P1(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[0];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P2(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = reg[2];
		int op1 = reg[2];
		reg[4] = f_div(op0, op1);
	}
	{
		int op0 = reg[4];
		int op1 = env[0];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P3(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = reg[6];
		reg[0] = ((op0) < (op1)) ? (op1) : (op0);
	}
	return reg[0];
}

int P4(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[1];
		reg[0] = f_div(op0, op1);
	}
	return reg[0];
}

int P5(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[0];
		reg[0] = ((op0) < (op1)) ? (op1) : (op0);
	}
	return reg[0];
}

int P6(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = reg[7];
		int op1 = env[0];
		reg[2] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[2];
		int op1 = env[1];
		reg[0] = f_div(op0, op1);
	}
	return reg[0];
}

int P7(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = env[0];
		reg[0] = ((op0) < (op1)) ? (op1) : (op0);
	}
	return reg[0];
}

int P8(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = env[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

int P9(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = env[1];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

int P10(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = reg[3];
		int op1 = env[0];
		reg[0] = ((op0) < (op1)) ? (op1) : (op0);
	}
	return reg[0];
}

int P11(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = reg[3];
		reg[0] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = env[0];
		int op1 = reg[0];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P12(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = reg[4];
		reg[1] = op0 + op1;
	}
	{
		int op0 = env[1];
		int op1 = reg[1];
		reg[0] = op0 + op1;
	}
	{
		int op0 = reg[0];
		int op1 = reg[0];
		reg[2] = op0 * op1;
	}
	{
		int op0 = reg[2];
		int op1 = env[1];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

int P13(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = env[1];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P14(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = reg[4];
		reg[1] = op0 + op1;
	}
	{
		int op0 = env[1];
		int op1 = reg[1];
		reg[0] = op0 + op1;
	}
	{
		int op0 = reg[0];
		int op1 = reg[0];
		reg[0] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[0];
		int op1 = reg[0];
		reg[2] = op0 * op1;
	}
	{
		int op0 = reg[2];
		int op1 = env[1];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

int P15(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = reg[1];
		int op1 = reg[7];
		reg[2] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[4];
		int op1 = reg[2];
		reg[6] = f_div(op0, op1);
	}
	{
		int op0 = reg[6];
		int op1 = env[1];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P16(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[1];
		reg[4] = op0 * op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[4];
		reg[0] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = env[1];
		int op1 = reg[0];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

int P17(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[1];
		reg[4] = op0 * op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[4];
		reg[0] = ((op0) < (op1)) ? (op1) : (op0);
	}
	return reg[0];
}

int P18(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = reg[0];
		reg[1] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[1];
		int op1 = reg[4];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

int P19(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = env[1];
		reg[0] = op0 - op1;
	}
	{
		int op0 = env[1];
		int op1 = reg[0];
		reg[0] = ((op0) < (op1)) ? (op1) : (op0);
	}
	return reg[0];
}

int P20(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = env[1];
		reg[1] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[1];
		int op1 = env[0];
		reg[0] = op0 * op1;
	}
	{
		int op0 = reg[1];
		int op1 = reg[0];
		reg[5] = f_div(op0, op1);
	}
	{
		int op0 = reg[3];
		int op1 = env[0];
		reg[1] = op0 - op1;
	}
	{
		int op0 = reg[0];
		int op1 = reg[5];
		reg[7] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[1];
		int op1 = reg[7];
		reg[2] = op0 + op1;
	}
	{
		int op0 = reg[2];
		int op1 = reg[0];
		reg[2] = op0 + op1;
	}
	{
		int op0 = reg[2];
		int op1 = env[1];
		reg[3] = op0 + op1;
	}
	{
		int op0 = env[1];
		int op1 = reg[3];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

int P21(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = reg[3];
		int op1 = env[1];
		reg[4] = f_div(op0, op1);
	}
	{
		int op0 = reg[4];
		int op1 = env[0];
		reg[6] = op0 + op1;
	}
	{
		int op0 = env[1];
		int op1 = env[1];
		reg[4] = op0 * op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[4];
		reg[4] = op0 + op1;
	}
	{
		int op0 = reg[6];
		int op1 = reg[4];
		reg[0] = ((op0) < (op1)) ? (op1) : (op0);
	}
	return reg[0];
}

int P22(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = env[1];
		reg[3] = f_div(op0, op1);
	}
	{
		int op0 = reg[3];
		int op1 = env[0];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

int P23(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = env[1];
		reg[3] = f_div(op0, op1);
	}
	{
		int op0 = reg[3];
		int op1 = env[1];
		reg[4] = f_div(op0, op1);
	}
	{
		int op0 = env[0];
		int op1 = reg[4];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P24(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = reg[3];
		int op1 = env[0];
		reg[5] = op0 * op1;
	}
	{
		int op0 = env[1];
		int op1 = reg[5];
		reg[5] = op0 * op1;
	}
	{
		int op0 = env[1];
		int op1 = reg[5];
		reg[1] = op0 + op1;
	}
	{
		int op0 = env[1];
		int op1 = env[1];
		reg[4] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[1];
		int op1 = reg[4];
		reg[0] = f_div(op0, op1);
	}
	return reg[0];
}

int P25(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = reg[7];
		int op1 = env[1];
		reg[4] = f_div(op0, op1);
	}
	{
		int op0 = env[0];
		int op1 = env[0];
		reg[1] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[1];
		int op1 = reg[4];
		reg[5] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[5];
		int op1 = env[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

int P26(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = env[0];
		reg[6] = op0 * op1;
	}
	{
		int op0 = reg[6];
		int op1 = env[0];
		reg[1] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[1];
		int op1 = env[1];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P27(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = env[1];
		reg[3] = f_div(op0, op1);
	}
	{
		int op0 = env[0];
		int op1 = reg[3];
		reg[1] = op0 - op1;
	}
	{
		int op0 = env[1];
		int op1 = reg[1];
		reg[4] = op0 * op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[4];
		reg[0] = ((op0) < (op1)) ? (op1) : (op0);
	}
	return reg[0];
}

int P28(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = env[1];
		reg[4] = op0 + op1;
	}
	{
		int op0 = reg[4];
		int op1 = env[0];
		reg[3] = op0 + op1;
	}
	{
		int op0 = reg[3];
		int op1 = env[0];
		reg[2] = op0 - op1;
	}
	{
		int op0 = reg[2];
		int op1 = env[1];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

int P29(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = reg[2];
		int op1 = env[0];
		reg[0] = f_div(op0, op1);
	}
	{
		int op0 = env[1];
		int op1 = reg[0];
		reg[0] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[0];
		int op1 = env[1];
		reg[7] = op0 * op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[7];
		reg[0] = ((op0) < (op1)) ? (op1) : (op0);
	}
	return reg[0];
}

int P30(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[0];
		reg[0] = op0 + op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[0];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P31(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = reg[2];
		int op1 = env[1];
		reg[5] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = env[0];
		int op1 = reg[5];
		reg[1] = op0 * op1;
	}
	{
		int op0 = reg[5];
		int op1 = reg[1];
		reg[2] = f_div(op0, op1);
	}
	{
		int op0 = reg[1];
		int op1 = reg[2];
		reg[7] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = env[1];
		int op1 = env[0];
		reg[3] = op0 + op1;
	}
	{
		int op0 = reg[3];
		int op1 = reg[7];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P32(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = env[1];
		reg[3] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = env[1];
		int op1 = reg[3];
		reg[5] = op0 * op1;
	}
	{
		int op0 = reg[5];
		int op1 = env[0];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

int P33(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = env[0];
		reg[5] = op0 - op1;
	}
	{
		int op0 = reg[5];
		int op1 = env[1];
		reg[2] = f_div(op0, op1);
	}
	{
		int op0 = env[0];
		int op1 = env[1];
		reg[0] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[0];
		int op1 = reg[2];
		reg[4] = op0 + op1;
	}
	{
		int op0 = reg[4];
		int op1 = env[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

int P34(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = reg[4];
		int op1 = env[1];
		reg[5] = op0 - op1;
	}
	{
		int op0 = env[1];
		int op1 = env[0];
		reg[3] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[3];
		int op1 = reg[1];
		reg[1] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[1];
		int op1 = reg[5];
		reg[1] = op0 - op1;
	}
	{
		int op0 = env[1];
		int op1 = reg[1];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

int P35(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[0];
		reg[6] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = env[1];
		int op1 = reg[6];
		reg[3] = op0 * op1;
	}
	{
		int op0 = env[0];
		int op1 = env[0];
		reg[1] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[1];
		int op1 = reg[3];
		reg[6] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[6];
		int op1 = env[0];
		reg[0] = f_div(op0, op1);
	}
	return reg[0];
}

int P36(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[0];
		reg[4] = f_div(op0, op1);
	}
	{
		int op0 = env[0];
		int op1 = reg[4];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P37(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[0];
		reg[4] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[4];
		int op1 = env[0];
		reg[1] = op0 * op1;
	}
	{
		int op0 = reg[1];
		int op1 = reg[1];
		reg[6] = op0 * op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[6];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P38(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[1];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

int P39(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = env[1];
		reg[5] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = env[1];
		int op1 = reg[5];
		reg[0] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = env[0];
		int op1 = reg[0];
		reg[1] = op0 * op1;
	}
	{
		int op0 = reg[1];
		int op1 = reg[1];
		reg[6] = op0 * op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[6];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P40(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[1];
		reg[1] = op0 - op1;
	}
	{
		int op0 = reg[7];
		int op1 = reg[7];
		reg[7] = op0 + op1;
	}
	{
		int op0 = reg[7];
		int op1 = env[0];
		reg[2] = op0 - op1;
	}
	{
		int op0 = reg[2];
		int op1 = reg[1];
		reg[5] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[5];
		int op1 = env[1];
		reg[2] = op0 - op1;
	}
	{
		int op0 = reg[2];
		int op1 = env[0];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

int P41(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = reg[7];
		reg[6] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[6];
		int op1 = env[1];
		reg[1] = op0 + op1;
	}
	{
		int op0 = reg[1];
		int op1 = env[0];
		reg[0] = ((op0) < (op1)) ? (op1) : (op0);
	}
	return reg[0];
}

int P42(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[0];
		reg[4] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[4];
		int op1 = env[0];
		reg[1] = op0 * op1;
	}
	{
		int op0 = reg[1];
		int op1 = reg[1];
		reg[6] = op0 * op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[6];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P43(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[1];
		reg[4] = op0 + op1;
	}
	{
		int op0 = reg[4];
		int op1 = env[1];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

int P44(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[1];
		reg[3] = op0 * op1;
	}
	{
		int op0 = env[1];
		int op1 = reg[3];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P45(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[1];
		reg[6] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[6];
		int op1 = env[1];
		reg[2] = f_div(op0, op1);
	}
	{
		int op0 = env[1];
		int op1 = env[0];
		reg[3] = op0 - op1;
	}
	{
		int op0 = reg[3];
		int op1 = reg[2];
		reg[0] = f_div(op0, op1);
	}
	return reg[0];
}

int P46(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = env[1];
		reg[3] = f_div(op0, op1);
	}
	{
		int op0 = reg[3];
		int op1 = env[1];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

int P47(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = reg[1];
		int op1 = reg[6];
		reg[6] = f_div(op0, op1);
	}
	{
		int op0 = reg[6];
		int op1 = env[0];
		reg[3] = op0 + op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[3];
		reg[5] = op0 + op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[5];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

int P48(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = reg[0];
		reg[7] = op0 + op1;
	}
	{
		int op0 = env[1];
		int op1 = reg[7];
		reg[4] = op0 * op1;
	}
	{
		int op0 = reg[1];
		int op1 = reg[4];
		reg[7] = f_div(op0, op1);
	}
	{
		int op0 = reg[7];
		int op1 = reg[4];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

int P49(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = reg[0];
		reg[1] = op0 - op1;
	}
	{
		int op0 = reg[1];
		int op1 = reg[1];
		reg[6] = op0 * op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[6];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P50(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[0];
		reg[7] = op0 * op1;
	}
	{
		int op0 = reg[7];
		int op1 = reg[6];
		reg[5] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[2];
		int op1 = reg[2];
		reg[0] = op0 + op1;
	}
	{
		int op0 = reg[0];
		int op1 = reg[5];
		reg[2] = op0 - op1;
	}
	{
		int op0 = reg[2];
		int op1 = reg[7];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P51(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = env[1];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P52(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = reg[6];
		reg[0] = f_div(op0, op1);
	}
	{
		int op0 = reg[0];
		int op1 = env[1];
		reg[0] = op0 - op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[0];
		reg[1] = op0 - op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[1];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

int P53(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[0];
		reg[5] = op0 * op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[5];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P54(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = env[0];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

int P55(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[0];
		reg[0] = f_div(op0, op1);
	}
	{
		int op0 = reg[0];
		int op1 = env[1];
		reg[3] = op0 + op1;
	}
	{
		int op0 = reg[3];
		int op1 = env[0];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

int P56(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[1];
		reg[1] = op0 * op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[1];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

int P57(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = reg[2];
		int op1 = env[1];
		reg[6] = op0 + op1;
	}
	{
		int op0 = env[0];
		int op1 = env[1];
		reg[3] = op0 + op1;
	}
	{
		int op0 = reg[3];
		int op1 = reg[6];
		reg[0] = f_div(op0, op1);
	}
	return reg[0];
}

int P58(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = env[0];
		reg[3] = f_div(op0, op1);
	}
	{
		int op0 = reg[3];
		int op1 = env[0];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

int P59(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[0];
		reg[6] = op0 - op1;
	}
	{
		int op0 = reg[6];
		int op1 = env[1];
		reg[0] = f_div(op0, op1);
	}
	return reg[0];
}

int P60(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = reg[3];
		int op1 = env[0];
		reg[0] = op0 + op1;
	}
	{
		int op0 = env[1];
		int op1 = reg[0];
		reg[1] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = env[0];
		int op1 = env[0];
		reg[4] = op0 * op1;
	}
	{
		int op0 = reg[4];
		int op1 = reg[1];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P61(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = reg[0];
		reg[2] = op0 + op1;
	}
	{
		int op0 = reg[2];
		int op1 = env[0];
		reg[1] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[1];
		int op1 = reg[6];
		reg[7] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[7];
		int op1 = reg[6];
		reg[4] = op0 * op1;
	}
	{
		int op0 = env[0];
		int op1 = env[0];
		reg[5] = f_div(op0, op1);
	}
	{
		int op0 = reg[5];
		int op1 = env[1];
		reg[3] = op0 + op1;
	}
	{
		int op0 = reg[3];
		int op1 = reg[4];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

int P62(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[1];
		reg[1] = op0 * op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[1];
		reg[0] = op0 * op1;
	}
	{
		int op0 = reg[0];
		int op1 = env[1];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P63(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = reg[3];
		int op1 = env[0];
		reg[0] = op0 + op1;
	}
	{
		int op0 = env[1];
		int op1 = env[1];
		reg[1] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[0];
		int op1 = env[1];
		reg[2] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = env[0];
		int op1 = env[0];
		reg[4] = op0 * op1;
	}
	{
		int op0 = reg[2];
		int op1 = reg[4];
		reg[6] = op0 + op1;
	}
	{
		int op0 = reg[6];
		int op1 = reg[1];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P64(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = env[0];
		reg[4] = op0 * op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[4];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

int P65(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = reg[4];
		int op1 = env[0];
		reg[3] = op0 - op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[0];
		reg[5] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = env[0];
		int op1 = reg[5];
		reg[1] = op0 + op1;
	}
	{
		int op0 = reg[1];
		int op1 = reg[3];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

int P66(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = env[1];
		reg[7] = op0 + op1;
	}
	{
		int op0 = reg[7];
		int op1 = env[1];
		reg[3] = op0 + op1;
	}
	{
		int op0 = reg[3];
		int op1 = reg[7];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

int P67(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = reg[6];
		int op1 = env[1];
		reg[1] = op0 + op1;
	}
	{
		int op0 = env[1];
		int op1 = reg[1];
		reg[7] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = env[0];
		int op1 = reg[2];
		reg[1] = op0 - op1;
	}
	{
		int op0 = reg[1];
		int op1 = reg[7];
		reg[4] = op0 + op1;
	}
	{
		int op0 = reg[4];
		int op1 = reg[4];
		reg[3] = op0 * op1;
	}
	{
		int op0 = reg[3];
		int op1 = env[0];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

int P68(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = reg[0];
		int op1 = env[0];
		reg[3] = f_div(op0, op1);
	}
	{
		int op0 = reg[4];
		int op1 = env[0];
		reg[5] = op0 * op1;
	}
	{
		int op0 = reg[3];
		int op1 = env[0];
		reg[2] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[3];
		int op1 = reg[5];
		reg[6] = op0 - op1;
	}
	{
		int op0 = env[1];
		int op1 = reg[2];
		reg[3] = op0 + op1;
	}
	{
		int op0 = reg[3];
		int op1 = reg[6];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P69(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[1];
		int op1 = reg[5];
		reg[2] = op0 + op1;
	}
	{
		int op0 = reg[2];
		int op1 = env[1];
		reg[0] = op0 * op1;
	}
	return reg[0];
}

int P70(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = env[0];
		int op1 = env[0];
		reg[1] = f_div(op0, op1);
	}
	{
		int op0 = reg[1];
		int op1 = env[1];
		reg[2] = op0 + op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[2];
		reg[0] = op0 - op1;
	}
	return reg[0];
}

int P71(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = reg[1];
		int op1 = env[0];
		reg[1] = op0 - op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[1];
		reg[4] = op0 * op1;
	}
	{
		int op0 = reg[6];
		int op1 = reg[4];
		reg[0] = op0 + op1;
	}
	return reg[0];
}

int P72(){
	int reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		int op0 = reg[3];
		int op1 = env[0];
		reg[0] = op0 + op1;
	}
	{
		int op0 = reg[1];
		int op1 = reg[0];
		reg[3] = op0 - op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[6];
		reg[2] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[3];
		int op1 = reg[1];
		reg[1] = ((op0) < (op1)) ? (op1) : (op0);
	}
	{
		int op0 = reg[2];
		int op1 = reg[1];
		reg[5] = op0 + op1;
	}
	{
		int op0 = env[0];
		int op1 = reg[5];
		reg[0] = op0 + op1;
	}
	return reg[0];
}
