import json
import math

input_file = "build/openhwgroup.org_systems_core-v-mini-mcu_0.3.0/sim-verilator/uart0.log"
output_file = "inference_latency.json"

records = []

with open(input_file, "r") as f:
    lines = f.read().strip().splitlines()

# Skip header
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

# Compute mean of AvgCyclesPerClass
tpg_mean_latency = sum(r["AvgCyclesPerClass"] for r in records) / len(records)

# Compute stddev across AvgCyclesPerClass
mean = tpg_mean_latency
variance = sum((r["AvgCyclesPerClass"] - mean) ** 2 for r in records) / len(records)
tpg_stddev_latency = math.sqrt(variance)

tpg_mean_latency = int(tpg_mean_latency)
tpg_stddev_latency = int(tpg_stddev_latency)

# Build output JSON
output = {
    "records": records,
    "tpg_mean_latency": tpg_mean_latency,
    "tpg_stddev_latency": tpg_stddev_latency
}

# Write JSON
with open(output_file, "w") as f:
    json.dump(output, f, indent=4)

# Console output
print("Parsed", len(records), "records.")
print("TPG mean latency (avg across classes):", tpg_mean_latency)
print("TPG stddev across AvgCyclesPerClass:", tpg_stddev_latency)

print("Profiling Error Percentage per class:")
for r in records:
    print(f"  Class {r['Class']}: {r['ProfilingErrorPercentage']:.4f}")

print("\nOutput written to", output_file)
