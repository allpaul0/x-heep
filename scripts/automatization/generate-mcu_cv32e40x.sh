#!/bin/bash

source env.sh

dir_sv_tpl_config_MCUs=configs/mcu/sv_tpl
output_dir=experimentations/microarchitectures

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

for config in "$dir_sv_tpl_config_MCUs"/*.sv.tpl; do
    # Extract full path (already in $config)
    config_path="$config"
    # Extract filename without extension
    config_name=$(basename "$config" .sv.tpl)

    echo "mcu-gen for config: $config_name"

    # replace cpu_subsystem with the choosen config
    cp $config_path hw/core-v-mini-mcu/cpu_subsystem.sv.tpl 

    # apply the config
    make mcu-gen CPU=cv32e40x BUS=onetoM MEM_BANKS=2

    echo "Vivado build for config: $config_name"

    make vivado-fpga FPGA_BOARD=pynq-z2

    echo "Finished config: $config_name"

    mv build/ "$output_dir/$config_name"
done