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
OUTPUT_DIR="experimentations/microarchitectures/simulators"
TPL_DIR="configs/mcu/sv_tpl"
TPL_FILE="$TPL_DIR/${CONFIG}.sv.tpl"


# ---- Check config exists ----
if [ ! -f "$TPL_FILE" ]; then
    echo "Error: config '$CONFIG' not found."
    echo "Available configs:"
    ls "$TPL_DIR"/cv32e40x_*.sv.tpl | xargs -n1 basename | sed 's/.sv.tpl$//'
    exit 1
fi

# ---- Setup ----
mkdir -p "$OUTPUT_DIR"

DEST="$OUTPUT_DIR/$CONFIG"

echo "=== Building MCU for config:  $CONFIG ==="

# ---- Copy template into place ----
echo "Applying template: $TPL_FILE"
cp "$TPL_FILE" hw/core-v-mini-mcu/cpu_subsystem.sv.tpl

# ---- MCU generation ----
make mcu-gen X_HEEP_CFG=configs/mcu/hjson/cv32e40x.hjson

# ---- Check if simulator already exists ----
if [ -d "$DEST" ]; then
    echo "=== Simulator already exists for $CONFIG ==="
    echo "=== Skipping verilator-build ==="
    echo "Existing simulator located at: $DEST"
    exit 0
fi

echo "=== Verilating: $CONFIG ==="

# ---- Verilator build ----
make verilator-build

echo "=== Finished config: $CONFIG ==="

# ---- Move output ----
mv build/ "$DEST"

echo "=== Done. Output at: $DEST ==="