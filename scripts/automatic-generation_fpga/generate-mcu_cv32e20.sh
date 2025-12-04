#!/bin/bash

dir_py_config_MCUs=configs/mcu/python
output_dir=experimentations/microarchitectures/fpga_implementations/

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

for config in "$dir_py_config_MCUs"/*.py; do
    # Extract full path (already in $config)
    config_path="$config"
    # Extract filename without extension
    config_name=$(basename "$config" .py)

    echo "mcu-gen for config: $config_name"

    make mcu-gen BUS=onetoM MEM_BANKS=2 PYTHON_X_HEEP_CFG="$config_path"

    echo "Vivado build for config: $config_name"

    # synth,impl,bitstream
    make vivado-fpga FPGA_BOARD=pynq-z2

    echo "Finished config: $config_name"

    mv build/ "$output_dir/$config_name"
done
