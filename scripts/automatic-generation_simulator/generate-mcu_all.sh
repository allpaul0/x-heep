#!/bin/bash
set -e

SCRIPT_DIR="$(dirname "$0")"
SIM_DIR="$SCRIPT_DIR/experimentations/microarchitectures/simulators"

# Function to call generate-mcu.sh with a config
generate() {
    local CONFIG="$1"
    echo "Generating simulator for $CONFIG..."
    "$SCRIPT_DIR/generate-mcu.sh" "$CONFIG"
}

# Build a single list of all valid configs
ALL_CONFIGS=(
    # cv32e20
    cv32e20_em0 cv32e20_em1 cv32e20_em2 cv32e20_em3
    cv32e20_im0 cv32e20_im1 cv32e20_im2 cv32e20_im3

    # cv32e40x
    cv32e40x_em0 cv32e40x_em1 cv32e40x_em2
    cv32e40x_im0 cv32e40x_im1 cv32e40x_im2

    # cv32e40px
    cv32e40px cv32e40px_fpu cv32e40px_corev_pulp_fpu cv32e40px_corev_pulp

    # cv32e40p
    cv32e40p cv32e40p_corev_pulp
)

# Get existing simulators in the directory
EXISTING_CONFIGS=()
if [[ -d "$SIM_DIR" ]]; then
    for f in "$SIM_DIR"/*; do
        [[ -e "$f" ]] || continue
        EXISTING_CONFIGS+=("$(basename "$f")")
    done
fi

# Generate only missing simulators
for CONFIG in "${ALL_CONFIGS[@]}"; do
    skip=false
    for EXIST in "${EXISTING_CONFIGS[@]}"; do
        if [[ "$CONFIG" == "$EXIST" ]]; then
            skip=true
            break
        fi
    done

    if ! $skip; then
        generate "$CONFIG"
    else
        echo "Skipping $CONFIG (already exists)"
    fi
done

echo "All missing simulators generated successfully."
