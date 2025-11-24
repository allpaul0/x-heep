#!/bin/bash
set -e

# -------------------------------
# Validate arguments
# -------------------------------
if [ $# -ne 4 ]; then
    echo "Usage: $0 <SIMULATOR> <ISA> <ABI> <DTYPE>"
    echo
    echo "Example:"
    echo "  $0 cv32e40p rv32imc ilp32 FIXEDPT"
    echo
    echo "SIMULATOR: directory under experimentations/microarchitectures/simulators/"
    exit 1
fi

SIMULATOR="$1"
ISA="$2"
ABI="$3"
DTYPE="$4"

# Check simulator directory exists
SIM_PATH="experimentations/microarchitectures/simulators/$SIMULATOR/openhwgroup.org_systems_core-v-mini-mcu_0.3.0"

if [ ! -d "$SIM_PATH" ]; then
    echo "Error: simulator '$SIMULATOR' not found at:"
    echo "  $SIM_PATH"
    echo
    echo "Available simulators:"
    ls experimentations/microarchitectures/simulators/
    exit 1
fi

# Clean and prepare build/
rm -rf build/ && mkdir build

# Copy selected MCU
echo "=== Copying simulator: $SIMULATOR ==="
cp -r "$SIM_PATH" build/

# Build application
echo "=== Building app with ISA=$ISA ABI=$ABI DTYPE=$DTYPE ==="
make app PROJECT=tpg_inference_fixedpt ARCH="$ISA" ABI="$ABI" COMPILER_FLAGS="-DUSE_$DTYPE"

# Run simulation
echo "=== Running simulation ==="
make verilator-run

# parse simulation ouptput 
python3 scripts/automatic-simulation/parse_simulation_output.py ${SIMULATOR} ${ISA} ${ABI} ${DTYPE}
