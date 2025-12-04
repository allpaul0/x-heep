#!/bin/bash
set -e

# ---- Validate argument ----
if [ $# -ne 1 ]; then
    echo "Usage: $0 <config>"
    echo "Available configs:"
    ls configs/mcu/hjson/cv32e20_*.hjson | xargs -n1 basename | sed 's/.hjson$//'
    exit 1
fi

CONFIG="$1"
HJSON_DIR="configs/mcu/hjson"
HJSON_FILE="$HJSON_DIR/${CONFIG}.hjson"

OUTPUT_DIR="experimentations/microarchitectures/simulators"

# ---- Check config exists ----
if [ ! -f "$HJSON_FILE" ]; then
    echo "Error: config '$CONFIG' not found."
    echo "Available configs:"
    ls "$HJSON_DIR"/cv32e20_*.hjson | xargs -n1 basename | sed 's/.hjson$//'
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

echo "=== Building MCU for config: $CONFIG ==="

# ---- MCU generation ----
make mcu-gen X_HEEP_CFG="$HJSON_FILE"

echo "=== mcu-gen completed for: $CONFIG ==="