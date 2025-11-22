#!/bin/bash

source env.sh

dir_hjson_config_MCUs=configs/mcu/hjson
output_dir=experimentations/microarchitectures/simulators

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

for config in "$dir_hjson_config_MCUs"/cv32e20*.hjson; do
    # Extract full path (already in $config)
    config_path="$config"
    # Extract filename without extension
    config_name=$(basename "$config" .hjson)

    echo "mcu-gen for config: $config_name"

    make mcu-gen X_HEEP_CFG="$config_path"

    echo "Verilating for config: $config_name"

    # build simulator
    make verilator-build

    # compile app to test if it fits on the mcu
    # make app

    # run test
    # make verilator-run

    echo "Finished config: $config_name"

    mv build/ "$output_dir/$config_name"
done
