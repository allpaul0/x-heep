#!/bin/bash

source env.sh

make mcu-gen X_HEEP_CFG=configs/mcu/hjson/cv32e40px.hjson 

make verilator-build 

mv build/ experimentations/microarchitectures/simulators/cv32e40px


make mcu-gen X_HEEP_CFG=configs/mcu/hjson/cv32e40px.hjson 

make verilator-build FUSESOC_PARAM="--X_EXT=1 --FPU=1"

mv build/ experimentations/microarchitectures/simulators/cv32e40px_fpu


make mcu-gen X_HEEP_CFG=configs/mcu/hjson/cv32e40px.hjson 

make verilator-build FUSESOC_PARAM="--COREV_PULP=1 --X_EXT=1 --FPU=1"

mv build/ experimentations/microarchitectures/simulators/cv32e40px_corev_pulp_fpu


make mcu-gen X_HEEP_CFG=configs/mcu/hjson/cv32e40px.hjson 

make verilator-build FUSESOC_PARAM="--COREV_PULP=1"

mv build/ experimentations/microarchitectures/simulators/cv32e40px_corev_pulp