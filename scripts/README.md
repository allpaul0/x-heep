Paul Allaire

./scripts/automatic-generation_simulator/generate-mcu.sh cv32e40px
Command used to generate a simulator

./scripts/generate-mcu/generate-mcu.sh cv32e40px
Command used to refresh the context of X-HEEP when the simulator was built in the past

./scripts/automatic-simulation/simulation.sh tpg_inference_fixedpt cv32e40px rv32imc_zicsr ilp32 FIXEDPT /opt/tools/riscv/
Command used to launch an inference benchmark code  

./scripts/compile_disassemble/compile_disassemble.sh tpg_inference_fixedpt cv32e40px rv32imc_zicsr ilp32 FIXEDPT /opt/tools/riscv
Command used to compile and disassemble code 