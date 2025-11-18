#!/bin/bash

source env.sh

make mcu-gen CPU=cv32e40px BUS=onetoM MEM_BANKS=2 

make vivado-fpga FPGA_BOARD=pynq-z2 

mv build/ experimentations/microarchitectures/cv32e40px


make mcu-gen CPU=cv32e40px BUS=onetoM MEM_BANKS=2 

make vivado-fpga FPGA_BOARD=pynq-z2 FUSESOC_PARAM="--X_EXT=1 --FPU=1"

mv build/ experimentations/microarchitectures/cv32e40px_fpu


make mcu-gen CPU=cv32e40px BUS=onetoM MEM_BANKS=2 

make vivado-fpga FPGA_BOARD=pynq-z2 FUSESOC_PARAM="--COREV_PULP=1 --X_EXT=1 --FPU=1"

mv build/ experimentations/microarchitectures/cv32e40px_corev_pulp_fpu


make mcu-gen CPU=cv32e40px BUS=onetoM MEM_BANKS=2 

make vivado-fpga FPGA_BOARD=pynq-z2 FUSESOC_PARAM="--COREV_PULP=1"

mv build/ experimentations/microarchitectures/cv32e40px_corev_pulp