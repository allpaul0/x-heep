#!/bin/bash

make mcu-gen CPU=cv32e40p BUS=onetoM MEMORY_BANKS=4
make app PROJECT=tpg_float_base COMPILER_PREFIX=riscv32-corev- ARCH=rv32imfc_zicsr_zifencei
#_xcvhwlp_xcvmem_xcvmac_xcvbi_xcvalu_xcvsimd_xcvbitmanip
#disassemble to see FP primitives used
/home/user/tools/corev-openhw-gcc/bin/riscv32-corev-elf-objdump -d sw/build/main.elf > disassembly.txt
make verilator-sim
# make verilator-sim FUSESOC_PARAM="--COREV_PULP=1 --FPU=1"
cd ./build/openhwgroup.org_systems_core-v-mini-mcu_0/sim-verilator
./Vtestharness +firmware=../../../sw/build/main.hex
cat uart0.log
cd -