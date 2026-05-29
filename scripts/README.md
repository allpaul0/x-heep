Paul Allaire

## Command use to enter the X-HEEP apptainer
apptainer shell --bind .:/opt/x-heep ../containers/x-heep.sif  

## Command used to generate a simulator
./scripts/automatic-generation_simulator/generate-mcu.sh cv32e40x_im2_zba_zbb

## Command used to refresh the context of X-HEEP when the simulator was built in the past
./scripts/generate-mcu/generate-mcu.sh cv32e40x_im2_zba_zbb

## Command used to compile and disassemble code 
./scripts/compile_disassemble/compile_disassemble.sh tpg_modelization/tpg_inference_instrTeams_instrTPG cv32e40x_im2_zba_zbb rv32ic_zicsr_zmmul_zba_zbb ilp32 FIXEDPT /opt/tools/riscv

## Command used to launch an inference benchmark code (default TPG inf)
./scripts/automatic-simulation/simulation.sh tpg_modelization/tpg_inference_instrTPG_dev cv32e40x_im2_zba_zbb rv32ic_zicsr_zmmul_zba_zbb ilp32 FIXEDPT /opt/tools/riscv/ False

## Command used to launch an inference benchmark code (TPG inf instrumented)
./scripts/automatic-simulation/simulation.sh tpg_modelization/tpg_inference_instrTeams_instrTPG_dev cv32e40x_im2_zba_zbb rv32ic_zicsr_zmmul_zba_zbb ilp32 FIXEDPT /opt/tools/riscv/ True