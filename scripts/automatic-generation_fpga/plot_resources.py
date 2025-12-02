import os
from vivado_utilization_report_parser import Vivado_Utilization_Report_Parser as VURP
import matplotlib.pyplot as plt
from typing import Dict, List
import numpy as np

def list_files(folder: str):
    """List immediate subfolders or files under folder."""
    return [entry for entry in os.listdir(folder) if os.path.isdir(os.path.join(folder, entry))]

def read_file(path: str) -> str:
    """Read file content safely."""
    try:
        with open(path, "r", encoding="utf-8") as f:
            return f.read()
    except FileNotFoundError:
        raise FileNotFoundError(f"Report file not found: {path}")
    except Exception as e:
        raise RuntimeError(f"Error reading {path}: {e}")

def plot_resource_utilization(all_archi_results: Dict[str, Dict[str, List[float]]], targets: List[str]):
    
    """Plot the 3rd element (percentage) of each resource for each architecture."""
    archis = sorted(all_archi_results.keys())
    n_archis = len(archis)
    n_targets = len(targets)

    # Collect data
    data = np.zeros((n_targets, n_archis))
    for j, archi in enumerate(archis):
        for i, target in enumerate(targets):
            try:
                data[i, j] = all_archi_results[archi][target][2]  # 3rd value = utilization %
            except (KeyError, IndexError):
                data[i, j] = 0.0

    x = np.arange(n_archis)
    width = 0.15
    plt.figure(figsize=(10, 6))

    for i, target in enumerate(targets):
        plt.bar(x + i * width, data[i], width, label=target)

    plt.xlabel("Microarchitecture")
    plt.ylabel("Utilization (%)")
    plt.title("Resource Utilization per Architecture")
    plt.xticks(x + width * (n_targets - 1) / 2, archis, rotation=45, ha="right")
    plt.legend()
    plt.tight_layout()
    plt.show()

def plot_delta_resource_usage(all_archi_results: Dict[str, Dict[str, List[float]]],
                                    targets: List[str]):
    """
    Plot delta LUT, delta FF (primary y-axis), and delta DSP (secondary y-axis)
    using the microarchitecture with the smallest LUT count as baseline.
    
    - X axis is sorted by LUT usage (ascending)
    - Delta = value - baseline_value
    """

    # ------------------------------------------------------------
    # 1) Identify baseline architecture (smallest LUT absolute usage)
    # ------------------------------------------------------------
    lut_values = {
        archi: all_archi_results[archi]["Slice LUTs"][0]   # ABS LUT count
        for archi in all_archi_results
    }
    baseline_archi = min(lut_values, key=lut_values.get)

    baseline_LUT = all_archi_results[baseline_archi]["Slice LUTs"][0]
    baseline_FF  = all_archi_results[baseline_archi]["Slice Registers"][0]
    baseline_DSP = all_archi_results[baseline_archi]["DSPs"][0]

    print(f"\nBaseline architecture (lowest LUT): {baseline_archi}")
    print(f"LUT baseline: {baseline_LUT}, FF baseline: {baseline_FF}, DSP baseline: {baseline_DSP}")

    # ------------------------------------------------------------
    # 2) Sort architectures by LUT usage ASC (for x-axis ranking)
    # ------------------------------------------------------------
    archis_sorted = sorted(lut_values, key=lut_values.get)

    # Prepare delta arrays
    delta_LUT = []
    delta_FF  = []
    delta_DSP = []

    for archi in archis_sorted:
        lut = all_archi_results[archi]["Slice LUTs"][0]
        ff  = all_archi_results[archi]["Slice Registers"][0]
        dsp = all_archi_results[archi]["DSPs"][0]

        delta_LUT.append(lut - baseline_LUT)
        delta_FF.append(ff - baseline_FF)
        delta_DSP.append(dsp - baseline_DSP)

    # ------------------------------------------------------------
    # 3) Plot with dual y-axis, all 3 metrics bars
    # ------------------------------------------------------------
    colors = {
        "LUT": "#FFBE0B",   # Amber gold
        "FF":  "#FB5607",   # Blaze orange
        "DSP": "#3A86FF",   # Azure blue
    }

    x = np.arange(len(archis_sorted))
    width = 0.25

    fig, ax1 = plt.subplots(figsize=(12, 6))

    # Primary axis bars (LUT and FF deltas)
    bar_lut = ax1.bar(x - width, delta_LUT, width, label="ΔLUT", color=colors["LUT"])
    bar_ff  = ax1.bar(x,          delta_FF,  width, label="ΔFF", color=colors["FF"])

    # Set x-axis labels
    x_labels = archis_sorted.copy()
    # Append "(baseline: <name>)" to the first microarchitecture
    x_labels[0] = f"baseline: {baseline_archi}"

    ax1.set_xlabel("Microarchitecture (ranked by LUT usage)")
    ax1.set_ylabel("ΔLUT, ΔFF")
    ax1.set_title("Resource Utilization Deltas Compared to Baseline Microarchitecture")
    ax1.set_xticks(x)
    ax1.set_xticklabels(x_labels, rotation=45, ha="right")

    # ------------------------------------------------------------
    # Add baseline sticker
    # ------------------------------------------------------------
    # Identify baseline position
    x_baseline = x[archis_sorted.index(baseline_archi)]

    # Values to display as a single vertical line
    sticker_text = f"LUT: {int(baseline_LUT)} | FF: {int(baseline_FF)} | DSP: {int(baseline_DSP)}"

    # Add vertical text box above baseline bars
    ax1.text(
        x_baseline,                     # X position
        max(delta_LUT[x_baseline], delta_FF[x_baseline]) + 0.05*max(delta_LUT+delta_FF+delta_DSP),  # Y position, slightly above bars
        sticker_text,                   # Text
        ha="center", va="bottom",       # Centered horizontally
        fontsize=10,
        rotation=90,                    # Rotate text vertically
        bbox=dict(facecolor="white", edgecolor="black", boxstyle="round,pad=0.3")
    )
    # ------------------------------------------------------------

    # Secondary axis bars (DSP deltas)
    ax2 = ax1.twinx()
    bar_dsp = ax2.bar(x + width, delta_DSP, width, label="ΔDSP", color=colors["DSP"])
    ax2.set_ylabel("ΔDSP")

    # Combined Legend
    ax1.legend(handles=[bar_lut, bar_ff, bar_dsp], labels=["ΔLUT", "ΔFF", "ΔDSP"], loc="upper left")

    plt.tight_layout()
    plt.show()


def main():
    # Instantiate parser
    vurp = VURP()

    # Define targets
    #targets = ["Slice LUTs", "Slice Registers", "Slice", "DSPs", "Block RAM Tile"]
    targets = ["Slice LUTs", "Slice Registers", "DSPs"]

    # Base folder
    folder_archis = "experimentations/microarchitectures/fpga_implementations"
    archis = list_files(folder_archis)

    all_archi_results = {}

    for archi in archis:
        # Construct expected report path
        path_utilization_rpt = os.path.join(
            folder_archis,
            archi,
            "openhwgroup.org_systems_core-v-mini-mcu_0.3.0/pynq-z2-vivado/openhwgroup.org_systems_core-v-mini-mcu_0.3.0.runs/impl_1/xilinx_core_v_mini_mcu_wrapper_utilization_placed.rpt"
        )

        # Read report
        report_text = read_file(path_utilization_rpt)
        
        # Parse
        archi_resources = vurp.parse(report_text, targets)
        all_archi_results[archi] = archi_resources

        print(f"\n=== {archi} ===")
        for name, values in archi_resources.items():
            print(f"{name}: {values}")

    plot_resource_utilization(all_archi_results, targets)
    plot_delta_resource_usage(all_archi_results, targets)

if __name__ == "__main__":
    main()
