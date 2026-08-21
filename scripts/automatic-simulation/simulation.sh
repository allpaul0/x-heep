#!/bin/bash
set -e

# -------------------------------
# Validate arguments
# -------------------------------
if [ $# -ne 7 ]; then
    echo "Usage: $0 <APP> <SIMULATOR> <ISA> <ABI> <DTYPE> <COMPILER> <INSTR>"
    echo "INSTR; instrumentation level (0/1/2)"
    echo "  0 -> instrTPG"
    echo "  1 -> instrTeams_instrTPG"
    echo "  2 -> instrDispatch_instrTeams_instrTPG"
    echo
    echo "Example:"
    echo "  $0 tpg_inference_fixedpt cv32e40p rv32imc_zicsr ilp32 FIXEDPT /opt/tools/riscv 0"
    echo
    echo "SIMULATOR: directory under experimentations/microarchitectures/simulators/"
    exit 1
fi

APP="$1"
SIMULATOR="$2"
ISA="$3"
ABI="$4"
DTYPE="$5"
COMPILER="$6"
INSTR="$7"

 
# Check INSTR is a valid instrumentation level
if [[ ! "$INSTR" =~ ^[0-2]$ ]]; then
    echo "Error: INSTR must be 0, 1 or 2 (got '$INSTR')"
    echo "  0 -> instrTPG"
    echo "  1 -> instrTeams_instrTPG"
    echo "  2 -> instrDispatch_instrTeams_instrTPG"
    exit 1
fi
 
case "$INSTR" in
    0) INSTR_LABEL="instrTPG" ;;
    1) INSTR_LABEL="instrTeams_instrTPG" ;;
    2) INSTR_LABEL="instrDispatch_instrTeams_instrTPG" ;;
esac
echo "=== Instrumentation level $INSTR ($INSTR_LABEL) ==="
 

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

# Set RISCV_XHEEP to use the appropriate compiler
export RISCV_XHEEP=$COMPILER

# Determine compiler prefix based on COMPILER path/name
if [[ "$COMPILER" == *"riscv"* ]]; then
    COMPILER_PREFIX="riscv32-unknown-"
elif [[ "$COMPILER" == *"corev"* ]]; then
    COMPILER_PREFIX="riscv32-corev-"
else
    COMPILER_PREFIX=""
fi
echo "Using compiler prefix: $COMPILER_PREFIX"

# Build application
echo "make app PROJECT="$APP" ARCH="$ISA" ABI="$ABI" COMPILER_PREFIX=$COMPILER_PREFIX COMPILER_FLAGS=\"-DUSE_$DTYPE\" VERBOSE=1"

make app PROJECT="$APP" ARCH="$ISA" ABI="$ABI" COMPILER_PREFIX=$COMPILER_PREFIX COMPILER_FLAGS="-DUSE_$DTYPE" VERBOSE=1

# Run simulation
echo "=== Running simulation ==="
# in case of VCD dump MAX_SIM_TIME=200000
make verilator-run 

# parse simulation ouptput 
python3 scripts/automatic-simulation/parse_simulation_output.py ${SIMULATOR} ${ISA} ${ABI} ${DTYPE} ${INSTR}