#!/bin/bash
set -e

# --------------------------------------------------
# Validate arguments (same as compile_disassemble.sh)
# --------------------------------------------------
if [ $# -ne 6 ]; then
    echo "Usage: $0 <APP> <SIMULATOR> <ISA> <ABI> <DTYPE> <COMPILER>"
    exit 1
fi

APP="$1"
SIMULATOR="$2"
ISA="$3"
ABI="$4"
DTYPE="$5"
COMPILER="$6"

OPT_LEVELS=("-O0" "-O1" "-O2" "-O3")

for OPT in "${OPT_LEVELS[@]}"; do
    echo "======================================="
    echo " Building with optimization $OPT"
    echo "======================================="

    # Modify optimization flag
    python3 scripts/compile_disassemble/modify_compilation_flags.py -- "$OPT"

    # Call your original script
    ./scripts/compile_disassemble/compile_disassemble.sh \
        "$APP" "$SIMULATOR" "$ISA" "$ABI" "$DTYPE" "$COMPILER"

    # Create result directory per optimization level
    OUTDIR="sw/applications/${APP}/${OPT}"
    mkdir -p "$OUTDIR"

    # Copy results
    cp sw/applications/"$APP"/main.elf "$OUTDIR"/main.elf
    cp sw/applications/"$APP"/main.S "$OUTDIR"/main.S
    cp sw/applications/"$APP"/disassembly.txt "$OUTDIR"/disassembly.txt

done

echo "======================================="
echo " All optimization levels built successfully."
echo "======================================="