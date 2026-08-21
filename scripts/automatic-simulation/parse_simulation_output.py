import json
import math
import sys
import os

# ---------------------------------------------
# Argument parsing
# ---------------------------------------------
USAGE = (" Usage: python3 parse_simulation_output.py <SIMULATOR> <ISA> <ABI> <DTYPE> <INSTR>\n"
    "  INSTR: 0 = instrTPG\n" 
    "         1 = instrTeams_instrTPG\n"
    "         2 = instrDispatch_instrTeams_instrTPG"
)

if len(sys.argv) != 6:
    print(USAGE)
    sys.exit(1)

SIMULATOR = sys.argv[1]
ISA = sys.argv[2]
ABI = sys.argv[3]
DTYPE = sys.argv[4].lower()

try:
    INSTR = int(sys.argv[5])
except ValueError:
    print(f"Error: INSTR must be an integer, got '{sys.argv[5]}'")
    sys.exit(1)

# Instrumentation level -> JSON key holding that run's results
INSTR_KEYS = {
    0: "instrTPG",
    1: "instrTeams_instrTPG",
    2: "instrDispatch_instrTeams_instrTPG",
}

if INSTR not in INSTR_KEYS:
    print(f"Error: INSTR must be one of {sorted(INSTR_KEYS)}, got {INSTR}")
    print(USAGE)
    sys.exit(1)
 
INSTR_KEY = INSTR_KEYS[INSTR]
 

# ---------------------------------------------
# Input and Output Paths
# ---------------------------------------------
input_file = "build/openhwgroup.org_systems_core-v-mini-mcu_0.3.0/sim-verilator/uart0.log"

output_dir = "experimentations/simulations"
os.makedirs(output_dir, exist_ok=True)

output_file = f"{output_dir}/{SIMULATOR}_{ISA}_{ABI}_{DTYPE}.json"

# ---------------------------------------------
# Section descriptors
#   header token -> (id field, JSON list name, avg field, stddev field)
# ---------------------------------------------
SECTION_SPECS = {
    "Class":        ("Class",        "Classes",    "AvgCyclesPerClass",    "StddevCyclesPerClass"),
    "Team":         ("Team",         "Teams",      "AvgCyclesPerTeam",     "StddevCyclesPerTeam"),
    "DispatchSize": ("DispatchSize", "Dispatches", "AvgCyclesPerDispatch", "StddevCyclesPerDispatch"),
}

# Sections each instrumentation level is expected to produce
EXPECTED_SECTIONS = {
    0: ["Class"],
    1: ["Class", "Team"],
    2: ["Class", "Team", "DispatchSize"],
}
 
# ---------------------------------------------
# Parsing uart0.log
# ---------------------------------------------
if not os.path.exists(input_file):
    print("Error: simulation output not found:", input_file)
    sys.exit(1)
 

with open(input_file, "r") as f:
    lines = f.read().strip().splitlines()

sections = {name: [] for name in SECTION_SPECS}
mode = None

for lineno, line in enumerate(lines, start=1):
    line = line.strip()
    if not line:
        continue

    parts = [p.strip() for p in line.split(",")]

    # A header line switches the current section
    if parts[0] in SECTION_SPECS:
        mode = parts[0]
        continue

    if mode is None:
        # Anything printed before the first header (banners, boot messages...)
        continue

    if len(parts) != 4:
        print(f"Warning: skipping malformed line {lineno}: {line}")
        continue

    id_field, _, avg_field, std_field = SECTION_SPECS[mode]

    try:
        ident, count, avg, stddev = (int(p) for p in parts)
    except ValueError:
        print(f"Warning: skipping non-numeric line {lineno}: {line}")
        continue

    coeff_var = (stddev / avg * 100) if avg != 0 else 0.0

    sections[mode].append({
        id_field: ident,
        "Count": count,
        avg_field: avg,
        std_field: stddev,
        "CoefficientVariation": round(coeff_var, 4),
    })


# ---------------------------------------------
# Sanity check against the announced instrumentation level
# ---------------------------------------------
for name in EXPECTED_SECTIONS[INSTR]:
    if not sections[name]:
        print(f"Warning: INSTR={INSTR} ({INSTR_KEY}) expects a '{name}' section, "
              f"but none was found in {input_file}")
 
for name, records in sections.items():
    if records and name not in EXPECTED_SECTIONS[INSTR]:
        print(f"Warning: found unexpected '{name}' section for INSTR={INSTR} "
              f"({INSTR_KEY}); it will still be stored.")
 
if not sections["Class"]:
    print("Error: no Class records parsed, refusing to write output.")
    sys.exit(1)


# ---------------------------------------------
# Compute class statistics
# ---------------------------------------------
def compute_latency_stats(records, key):
    if not records:
        return 0, 0
        
    mean = sum(r[key] for r in records) / len(records)
    var = sum((r[key] - mean) ** 2 for r in records) / len(records)
    std = math.sqrt(var)
    return int(mean), int(std)

tpg_mean_lat, tpg_stddev_lat = compute_latency_stats(sections["Class"], "AvgCyclesPerClass")

# ---------------------------------------------
# Build this run's entry
# ---------------------------------------------
entry = {
    "Classes": sections["Class"],
    "tpg_mean_lat": tpg_mean_lat,
    "tpg_stddev_lat": tpg_stddev_lat,
}
 
if sections["Team"]:
    entry["Teams"] = sections["Team"]
 
if sections["DispatchSize"]:
    entry["Dispatches"] = sections["DispatchSize"]
 
# ---------------------------------------------
# Write / Merge JSON (order-independent)
# ---------------------------------------------
if os.path.exists(output_file):
    with open(output_file, "r") as f:
        output = json.load(f)
    print("Merging into existing file:", output_file)
else:
    output = {}
    print("Creating new file:", output_file)
 
# Always refresh the run metadata
output["simulator"] = SIMULATOR
output["isa"] = ISA
output["abi"] = ABI
output["dtype"] = DTYPE
 
if INSTR_KEY in output:
    print(f"Note: overwriting previous '{INSTR_KEY}' results.")
 
output[INSTR_KEY] = entry

# Keep a stable key order: metadata first, then runs 0 -> 1 -> 2
ordered = {k: output[k] for k in ("simulator", "isa", "abi", "dtype")}
for key in INSTR_KEYS.values():
    if key in output:
        ordered[key] = output[key]
for k, v in output.items():
    if k not in ordered:
        ordered[k] = v
 
with open(output_file, "w") as f:
    json.dump(ordered, f, indent=4)


# ---------------------------------------------
# Report
# ---------------------------------------------
print(f"\nInstrumentation level {INSTR} -> {INSTR_KEY}")
print("  Class records:   ", len(sections["Class"]))
if sections["Team"]:
    print("  Team records:    ", len(sections["Team"]))
if sections["DispatchSize"]:
    print("  Dispatch records:", len(sections["DispatchSize"]))
 
print("  TPG mean latency:  ", tpg_mean_lat)
print("  TPG stddev latency:", tpg_stddev_lat)
 
print("\nCoefficient of Variation per class:")
for r in sections["Class"]:
    print(f"  Class {r['Class']}: {r['CoefficientVariation']:.2f}%")
 
print("\nRuns currently stored in this file:",
      ", ".join(k for k in INSTR_KEYS.values() if k in ordered))
print("Output written to:", output_file)
 