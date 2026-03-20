## Development

Bind a dir to the apptainer.
```bash
apptainer shell --bind x-heep:/opt/x-heep containers/x-heep.sif  
cd /opt/x-heep
./scripts/compile_disassemble/compile_disassemble.sh tpg_inference_fixedpt_custom_TPG_inX_restrict_inline_progs_team_functions cv32e40px rv32imc_zicsr ilp32 FIXEDPT /opt/tools/riscv
```

tpg_inference_fixedpt_inX_restrict_inline_progs_team_functions cv32e40x_im0_zba_zbb rv32ic_zba_zbb_zicsr ilp32 FIXEDPT /opt/tools/riscv

## compile_disassemble
./scripts/compile_disassemble/compile_disassemble_all_opts.sh tpg_inference_instr_team_fixedpt_custom_TPG cv32e40x_im0_zba_zbb rv32ic_zba_zbb_zicsr ilp32 FIXEDPT /opt/tools/riscv

## simulation
./scripts/automatic-simulation/simulation_instrumentation.sh tpg_inference_instr_team_fixedpt_custom_TPG cv32e40x_im0_zba_zbb rv32ic_zba_zbb_zicsr ilp32 FIXEDPT /opt/tools/riscv