#!/bin/bash
set -e

# Folder containing specialized scripts
SCRIPT_DIR="$(dirname "$0")"

if [ $# -ne 1 ]; then
    echo "Usage: $0 <config>"
    echo
    echo "Available configs:"
    echo "  cv32e20_*"
    echo "  cv32e40x_*"
    echo "  cv32e40px, cv32e40px_fpu, cv32e40px_corev_pulp_fpu, cv32e40px_corev_pulp"
    echo "  cv32e40p, cv32e40p_corev_pulp"
    exit 1
fi

CONFIG="$1"

#########################################
# MATCH CONFIG GROUP
#########################################

# ---- cv32e20 (hjson-based configs) ----
if [[ "$CONFIG" =~ ^cv32e20_(em[0-3]|im[0-3])$ ]]; then
    exec "$SCRIPT_DIR/generate-mcu_cv32e20.sh" "$CONFIG"
fi

# ---- cv32e40x (sv.tpl-based configs) ----
if [[ "$CONFIG" =~ ^cv32e40x_(em[0-2]|im[0-2])$ ]]; then
    exec "$SCRIPT_DIR/generate-mcu_cv32e40x.sh" "$CONFIG"
fi

# ---- cv32e40px (4 predefined configs) ----
if [[ "$CONFIG" =~ ^cv32e40px(_fpu|_corev_pulp_fpu|_corev_pulp)?$ ]]; then
    exec "$SCRIPT_DIR/generate-mcu_cv32e40px.sh" "$CONFIG"
fi

# ---- cv32e40p (2 predefined configs) ----
if [[ "$CONFIG" =~ ^cv32e40p(_corev_pulp)?$ ]]; then
    exec "$SCRIPT_DIR/generate-mcu_cv32e40p.sh" "$CONFIG"
fi

#########################################
# NO MATCH → ERROR
#########################################

echo "Error: Unknown config '$CONFIG'"
echo
echo "Valid configs:"
echo "  cv32e20_{e/i}m{0-3}"
echo "  cv32e40x_{e/i}m{0-2}"
echo "  cv32e40p[_corev_pulp]"
echo "  cv32e40px[_corev_pulp][_fpu]"
exit 1
