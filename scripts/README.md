Paul Allaire

0. Command used to generate a simulator
./scripts/automatic-generation_simulator/generate-mcu.sh cv32e40x_im2_zba_zbb

1. Command used to refresh the context of X-HEEP when the simulator was built in the past
./scripts/generate-mcu/generate-mcu.sh cv32e40x_im2_zba_zbb

2. Command used to compile and disassemble code 
./scripts/compile_disassemble/compile_disassemble.sh tpg_modelization/tpg_inference_instr_team_fixedpt_custom_TPG cv32e40x_im2_zba_zbb rv32imc_zicsr_zba_zbb ilp32 FIXEDPT /opt/tools/riscv

3. Command used to launch an inference benchmark code
./scripts/automatic-simulation/simulation.sh tpg_modelization/tpg_inference_instr_team_fixedpt_custom_TPG cv32e40x_im2_zba_zbb rv32imc_zicsr_zba_zbb ilp32 FIXEDPT /opt/tools/riscv/