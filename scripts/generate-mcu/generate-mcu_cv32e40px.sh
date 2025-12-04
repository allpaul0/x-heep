#!/bin/bash
set -e

if [ $# -ne 1 ]; then
    echo "Usage: $0 {cv32e40px|cv32e40px_fpu|cv32e40px_corev_pulp_fpu|cv32e40px_corev_pulp}"
    exit 1
fi

CONFIG="$1"

case "$CONFIG" in
    cv32e40px)
        PARAMS=""
        DEST="cv32e40px"
        ;;

    cv32e40px_fpu)
        PARAMS='FUSESOC_PARAM="--X_EXT=1 --FPU=1"'
        DEST="cv32e40px_fpu"
        ;;

    cv32e40px_corev_pulp_fpu)
        PARAMS='FUSESOC_PARAM="--COREV_PULP=1 --X_EXT=1 --FPU=1"'
        DEST="cv32e40px_corev_pulp_fpu"
        ;;

    cv32e40px_corev_pulp)
        PARAMS='FUSESOC_PARAM="--COREV_PULP=1"'
        DEST="cv32e40px_corev_pulp"
        ;;

    *)
        echo "Invalid argument: $CONFIG"
        echo "Valid options: cv32e40px cv32e40px_fpu cv32e40px_corev_pulp_fpu cv32e40px_corev_pulp"
        exit 1
        ;;
esac


echo "=== Building config: $CONFIG ==="
make mcu-gen X_HEEP_CFG=configs/mcu/hjson/cv32e40px.hjson

echo "=== mcu-gen completed for: $CONFIG ==="
