#!/bin/bash
set -e

# ---- Validate argument ----
if [ $# -ne 1 ]; then
    echo "Usage: $0 {cv32e40p|cv32e40p_corev_pulp}"
    exit 1
fi

CONFIG="$1"
OUTPUT_DIR="experimentations/microarchitectures/simulators"

# ---- Select parameters based on config ----
case "$CONFIG" in
    cv32e40p)
        PARAMS=""
        ;;
    cv32e40p_corev_pulp)
        PARAMS='FUSESOC_PARAM="--COREV_PULP=1"'
        ;;
    *)
        echo "Invalid config: $CONFIG"
        echo "Valid options: cv32e40p  cv32e40p_corev_pulp"
        exit 1
        ;;
esac

# ---- Setup ----
mkdir -p "$OUTPUT_DIR"

DEST="$OUTPUT_DIR/$CONFIG"

echo "=== Building MCU for config:  $CONFIG ==="

# ---- MCU generation ----
make mcu-gen X_HEEP_CFG=configs/mcu/hjson/cv32e40p.hjson

# ---- Check if simulator already exists ----
if [ -d "$DEST" ]; then
    echo "=== Simulator already exists for $CONFIG ==="
    echo "=== Skipping verilator-build ==="
    echo "Existing simulator located at: $DEST"
    exit 0
fi

echo "=== Verilating: $CONFIG ==="

# ---- Verilator build with or without parameters ----
if [ -z "$PARAMS" ]; then
    make verilator-build
else
    eval make verilator-build $PARAMS
fi

echo "=== Finished config: $CONFIG ==="

# ---- Move output ----
mv build/ "$DEST"

echo "=== Done. Output at: $DEST ==="
