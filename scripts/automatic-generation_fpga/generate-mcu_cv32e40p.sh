#!/bin/bash

make mcu-gen CPU=cv32e40p BUS=onetoM MEM_BANKS=2

make vivado-fpga FPGA_BOARD=pynq-z2 

mv build/ experimentations/microarchitectures/fpga_implementations/cv32e40p


make mcu-gen CPU=cv32e40p BUS=onetoM MEM_BANKS=2

make vivado-fpga FPGA_BOARD=pynq-z2 FUSESOC_PARAM="--COREV_PULP=1"

mv build/ experimentations/microarchitectures/fpga_implementations/cv32e40p_corev_pulp