#!/bin/bash

source env.sh

make mcu-gen X_HEEP_CFG=configs/mcu/hjson/cv32e40p.hjson 

make verilator-build 

mv build/ experimentations/microarchitectures/simulators/cv32e40p


make mcu-gen X_HEEP_CFG=configs/mcu/hjson/cv32e40p.hjson

make verilator-build FUSESOC_PARAM="--COREV_PULP=1"

mv build/ experimentations/microarchitectures/simulators/cv32e40p_corev_pulp