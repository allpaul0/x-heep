#!/bin/bash
set -e

# ---- Validate argument ----
if [ $# -ne 1 ]; then
    echo "Usage: $0 <config>"
    echo "Valid configs:"
    ls configs/mcu/sv_tpl/cv32e40x_*.sv.tpl | xargs -n1 basename | sed 's/.sv.tpl$//'
    exit 1
fi

CONFIG="$1"
TPL_DIR="configs/mcu/sv_tpl"
TPL_FILE="$TPL_DIR/${CONFIG}.sv.tpl"

OUTPUT_DIR="experimentations/microarchitectures/simulators"

# ---- Check config exists ----
if [ ! -f "$TPL_FILE" ]; then
    echo "Error: config '$CONFIG' not found."
    echo "Available configs:"
    ls "$TPL_DIR"/cv32e40x_*.sv.tpl | xargs -n1 basename | sed 's/.sv.tpl$//'
    exit 1
fi

# ---- Setup environment ----
mkdir -p "$OUTPUT_DIR"

echo "=== Building CV32E40X config: $CONFIG ==="

# ---- Copy template into place ----
echo "Applying template: $TPL_FILE"
cp "$TPL_FILE" hw/core-v-mini-mcu/cpu_subsystem.sv.tpl

# ---- MCU generation ----
make mcu-gen X_HEEP_CFG=configs/mcu/hjson/cv32e40x.hjson

echo "=== mcu-gen completed for: $CONFIG ==="