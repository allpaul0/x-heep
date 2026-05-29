import json
import math
import sys
import os

# ---------------------------------------------
# Argument parsing
# ---------------------------------------------
if len(sys.argv) != 6:
    print("Usage: python3 parse_simulation_output.py <SIMULATOR> <ISA> <ABI> <DTYPE> <INSTR>")
    sys.exit(1)

SIMULATOR = sys.argv[1]
ISA = sys.argv[2]
ABI = sys.argv[3]
DTYPE = sys.argv[4].lower()
INSTR = sys.argv[5].lower() in ["true"]

# ---------------------------------------------
# Input and Output Paths
# ---------------------------------------------
input_file = "build/openhwgroup.org_systems_core-v-mini-mcu_0.3.0/sim-verilator/uart0.log"

output_dir = "experimentations/simulations"
os.makedirs(output_dir, exist_ok=True)

output_file = f"{output_dir}/{SIMULATOR}_{ISA}_{ABI}_{DTYPE}.json"

# ---------------------------------------------
# Parsing uart0.log
# ---------------------------------------------
class_records = []
team_records = []

with open(input_file, "r") as f:
    lines = f.read().strip().splitlines()

mode = "class"

for line in lines:
    line = line.strip()
    if not line:
        continue

    if line.startswith("Class,"):
        mode = "class"
        continue
    if line.startswith("Team,"):
        mode = "team"
        continue

    parts = line.split(",")

    if mode == "class":
        cls, count, avg, stddev = parts
        avg = int(avg)
        stddev = int(stddev)

        coeff_var = (stddev / avg * 100) if avg != 0 else 0.0

        class_records.append({
            "Class": int(cls),
            "Count": int(count),
            "AvgCyclesPerClass": avg,
            "StddevCyclesPerClass": stddev,
            "CoefficientVariation": round(coeff_var, 4)
        })

    elif mode == "team":
        team, count, avg, stddev = parts
        avg = int(avg)
        stddev = int(stddev)

        coeff_var = (stddev / avg * 100) if avg != 0 else 0.0

        team_records.append({
            "Team": int(team),
            "Count": int(count),
            "AvgCyclesPerTeam": avg,
            "StddevCyclesPerTeam": stddev,
            "CoefficientVariation": round(coeff_var, 4)
        })

# ---------------------------------------------
# Compute class statistics
# ---------------------------------------------
def compute_latency_stats(records, key):
    mean = sum(r[key] for r in records) / len(records)
    var = sum((r[key] - mean) ** 2 for r in records) / len(records)
    std = math.sqrt(var)
    return int(mean), int(std)

tpg_mean_lat, tpg_stddev_lat = compute_latency_stats(class_records, "AvgCyclesPerClass")

# ---------------------------------------------
# Build base structure
# ---------------------------------------------
base_output = {
    "simulator": SIMULATOR,
    "isa": ISA,
    "abi": ABI,
    "dtype": DTYPE,

    "instrTPG": {
        "Classes": class_records,
        "tpg_mean_lat": tpg_mean_lat,
        "tpg_stddev_lat": tpg_stddev_lat
    }
}

# ---------------------------------------------
# Write / Merge JSON
# ---------------------------------------------
if not INSTR:
    output = base_output

    with open(output_file, "w") as f:
        json.dump(output, f, indent=4)

    print("Parsed", len(class_records), "class records.")
    print("TPG mean latency:", tpg_mean_lat)
    print("TPG stddev latency:", tpg_stddev_lat)

    print("\nCoefficient of Variation per class:")
    for r in class_records:
        print(f"  Class {r['Class']}: {r['CoefficientVariation']:.2f}%")

    print("\nOutput written to:", output_file)

else:
    if not os.path.exists(output_file):
        print("Error: previous JSON not found:", output_file)
        sys.exit(1)

    with open(output_file, "r") as f:
        existing_json = json.load(f)

    existing_json["instrTeams_instrTPG"] = {
        "Classes": class_records,
        "tpg_mean_lat": tpg_mean_lat,
        "tpg_stddev_lat": tpg_stddev_lat,
        "Teams": team_records
    }

    with open(output_file, "w") as f:
        json.dump(existing_json, f, indent=4)

    print("Instrumentation merge complete.")
    print("Added instrTeams_instrTPG with:")
    print("  Class records:", len(class_records))
    print("  Team records:", len(team_records))
    print("Updated file:", output_file)