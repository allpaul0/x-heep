import json
import math
import sys
import os

# ---------------------------------------------
# Argument parsing
# ---------------------------------------------
if len(sys.argv) != 5:
    print("Usage: python3 parse_simulation_output.py <SIMULATOR> <ISA> <ABI> <DTYPE>")
    sys.exit(1)

SIMULATOR = sys.argv[1]
ISA = sys.argv[2]
ABI = sys.argv[3]
DTYPE = sys.argv[4].lower()

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
records = []

with open(input_file, "r") as f:
    lines = f.read().strip().splitlines()

# Skip header line
for line in lines[1:]:
    cls, count, avg, stddev = line.split(",")
    avg = int(avg)
    stddev = int(stddev)
    error_pct = stddev / avg if avg != 0 else 0.0

    records.append({
        "Class": int(cls),
        "Count": int(count),
        "AvgCyclesPerClass": avg,
        "StddevCyclesPerClass": stddev,
        "ProfilingErrorPercentage": round(error_pct, 4)
    })

# ---------------------------------------------
# Compute statistics
# ---------------------------------------------
tpg_mean_latency = sum(r["AvgCyclesPerClass"] for r in records) / len(records)

mean = tpg_mean_latency
variance = sum((r["AvgCyclesPerClass"] - mean) ** 2 for r in records) / len(records)
tpg_stddev_latency = math.sqrt(variance)

tpg_mean_latency = int(tpg_mean_latency)
tpg_stddev_latency = int(tpg_stddev_latency)

# ---------------------------------------------
# Build output JSON content
# ---------------------------------------------
output = {
    "simulator": SIMULATOR,
    "isa": ISA,
    "abi": ABI,
    "dtype": DTYPE,
    "records": records,
    "tpg_mean_latency": tpg_mean_latency,
    "tpg_stddev_latency": tpg_stddev_latency
}

# ---------------------------------------------
# Write JSON file
# ---------------------------------------------
with open(output_file, "w") as f:
    json.dump(output, f, indent=4)

# ---------------------------------------------
# Console summary
# ---------------------------------------------
print("Parsed", len(records), "records.")
print("TPG mean latency:", tpg_mean_latency)
print("TPG stddev latency:", tpg_stddev_latency)
print("\nProfiling Error Percentage per class:")

for r in records:
    print(f"  Class {r['Class']}: {r['ProfilingErrorPercentage']:.4f}")

print("\nOutput written to:", output_file)
