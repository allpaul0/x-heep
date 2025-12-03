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
        DEST="cv32e40p"
        ;;
    cv32e40p_corev_pulp)
        PARAMS='FUSESOC_PARAM="--COREV_PULP=1"'
        DEST="cv32e40p_corev_pulp"
        ;;
    *)
        echo "Invalid config: $CONFIG"
        echo "Valid options: cv32e40p  cv32e40p_corev_pulp"
        exit 1
        ;;
esac

# ---- Setup ----
mkdir -p "$OUTPUT_DIR"

echo "=== Building: $CONFIG ==="

# ---- MCU generation ----
make mcu-gen X_HEEP_CFG=configs/mcu/hjson/cv32e40p.hjson

echo "=== mcu-gen completed for: $CONFIG ==="