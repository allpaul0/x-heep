#!/bin/bash

source env.sh
make mcu-gen CPU=cv32e40x BUS=NtoM MEMORY_BANKS=4
make app PROJECT=tpg_float_base
make verilator-sim
cd ./build/openhwgroup.org_systems_core-v-mini-mcu_0/sim-verilator
./Vtestharness +firmware=../../../sw/build/main.hex
cat uart0.log
cd -