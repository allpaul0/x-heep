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

def main():
    # Instantiate parser
    vurp = VURP()

    # Define targets
    #targets = ["Slice LUTs", "Slice Registers", "Slice", "DSPs", "Block RAM Tile"]
    targets = ["Slice LUTs", "Slice Registers", "DSPs"]

    # Base folder
    folder_archis = "experimentations/microarchitectures/"
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

if __name__ == "__main__":
    main()
