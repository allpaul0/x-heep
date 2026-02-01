import os
from vivado_utilization_report_parser import Vivado_Utilization_Report_Parser as VURP
import matplotlib.pyplot as plt
from typing import Dict, List
import numpy as np
import re
from matplotlib.ticker import FuncFormatter
import pickle

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
    
    - X axis is sorted by family name (factorized)
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
    # 2) Family / variant splitter (variant will be the top line)
    # ------------------------------------------------------------
    def split_arch_name(arch_name: str):
        """
        Return (family, variant) where family is one of:
        - cv32e20
        - cv32e40
        Variant = everything after the family prefix.
        """

        name = arch_name.strip()

        if name.startswith("cv32e20"):
            family = "cv32e20"
            variant = name[len("cv32e20"):].lstrip("_")
        elif name.startswith("cv32e40"):
            family = "cv32e40"
            variant = name[len("cv32e40"):].lstrip("_")
        else:
            # fallback for unexpected names
            if "_" in name:
                family, variant = name.split("_", 1)
            else:
                family, variant = name, ""

        if not variant:
            variant = "-"

        return family, variant


    # ------------------------------------------------------------
    # 3) Sort architectures by custom family + variant order
    # ------------------------------------------------------------

    # Define the variant ordering per family
    variant_order = {
        "cv32e20": ["em0", "em1", "em2", "em3", "im0", "im1", "im2", "im3"],
        "cv32e40": ["x_em0", "x_em1", "x_em2", "x_im0", "x_im1", "x_im2",
                    "p", "p_pulp", "px", "px_pulp", "px_fpu", "px_pulp_fpu"]
    }

    def arch_sort_key(arch):
        family, variant = split_arch_name(arch)
        try:
            index = variant_order[family].index(variant)
        except (KeyError, ValueError):
            # If family or variant not listed, place at end
            index = len(variant_order.get(family, []))
        return (family, index)

    # Sort architectures according to family first, then variant order
    archis_sorted = sorted(all_archi_results.keys(), key=arch_sort_key)

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
    # 4) Plot with dual y-axis, all 3 metrics bars
    # ------------------------------------------------------------
    colors = {
        "LUT": "#FFBE0B",   # Amber gold
        "FF":  "#FB5607",   # Blaze orange
        "DSP": "#3A86FF",   # Azure blue
    }

    x = np.arange(len(archis_sorted))
    width = 0.25

    fig, ax1 = plt.subplots(figsize=(12, 6))

    # Define formatter function
    def kilo_formatter(x, pos):
        """Convert numbers like 2000 -> 2k"""
        return f"{int(x/1000)}k"

    # Apply k formatting to primary y-axis
    ax1.yaxis.set_major_formatter(FuncFormatter(kilo_formatter))

    # Primary axis bars (LUT and FF deltas)
    bar_lut = ax1.bar(x - width, delta_LUT, width, label="ΔLUT", color=colors["LUT"])
    bar_ff  = ax1.bar(x,          delta_FF,  width, label="ΔFF", color=colors["FF"])
 
    # ------------------------------------------------------------
    # 5) Custom two-level x-axis: rotated variants + centered families
    # ------------------------------------------------------------
    families = [split_arch_name(a)[0] for a in archis_sorted]
    variants = [split_arch_name(a)[1] for a in archis_sorted]

    # Hide default tick labels
    ax1.set_xticks(x)
    ax1.set_xticklabels([""] * len(x))

    # Define family colors
    family_colors = {
        "cv32e20": "#1f77b4",  # slightly blue
        "cv32e40": "#d62728"   # slightly red
    }  

    # ---- Draw rotated variant labels (top line) ----
    for xi, variant, fam in zip(x, variants, families):
        # Mark the baseline variant
        display_variant = variant
        if archis_sorted[xi] == baseline_archi:
            display_variant = f"baseline: {variant}"

        ax1.annotate(
            display_variant,
            xy=(xi, 0), xycoords=('data', 'axes fraction'),
            xytext=(0, -5), textcoords='offset points',
            rotation=45,
            ha="right", va="top",
            fontsize=9,
            color=family_colors.get(fam, "black")  # default black if unknown family
        )

    # ---- Compute centered family positions ----
    unique_fams = []
    for f in families:
        if not unique_fams or f != unique_fams[-1]:
            unique_fams.append(f)

    for fam in unique_fams:
        idxs = [i for i, f in enumerate(families) if f == fam]
        center_x = np.mean([x[i] for i in idxs])

         # Draw family label (bottom line, horizontal)
        ax1.annotate(
            fam,
            xy=(center_x, 0), xycoords=('data', 'axes fraction'),
            xytext=(0, -40), textcoords='offset points',
            rotation=0,
            ha="center", va="top",
            fontsize=10,
            fontweight="bold",
            color=family_colors.get(fam, "black")
        )

    # Adjust subplot bottom margin so labels fit
    plt.subplots_adjust(bottom=0.25)

    # Optional: set x-axis label
    ax1.set_xlabel("Microarchitecture", labelpad=35)
    ax1.set_ylabel("ΔLUT, ΔFF")
    ax1.set_title("Resource Utilization Deltas Compared to Baseline Microarchitecture")
    # ------------------------------------------------------------
    # 6) Add baseline vertical sticker
    # ------------------------------------------------------------
    # Identify baseline position
    x_baseline = x[archis_sorted.index(baseline_archi)]

    # Values to display as a single vertical line
    sticker_text = f"LUT: {round(baseline_LUT / 1000)}k\nFF: {round(baseline_FF / 1000)}k\nDSP: {round(baseline_DSP / 1000)} "

    # Add vertical text box above baseline bars
    ax1.text(
        x_baseline,                     # X position
        max(delta_LUT[x_baseline], delta_FF[x_baseline]) + 0.05*max(delta_LUT+delta_FF+delta_DSP),  # Y position, slightly above bars
        sticker_text,                   # Text
        ha="center", va="bottom",       # Centered horizontally
        fontsize=10,
        rotation=0,                    # Rotate text vertically
        bbox=dict(facecolor="white", edgecolor="black", boxstyle="round,pad=0.3")
    )

    # ------------------------------------------------------------
    # 7) Secondary axis bars (DSP deltas)
    # ------------------------------------------------------------
    ax2 = ax1.twinx()
    bar_dsp = ax2.bar(x + width, delta_DSP, width, label="ΔDSP", color=colors["DSP"])
    ax2.set_ylabel("ΔDSP")

    # Combined Legend
    ax1.legend(handles=[bar_lut, bar_ff, bar_dsp], labels=["ΔLUT", "ΔFF", "ΔDSP"], loc="upper left")

    plt.tight_layout()
    plt.show()

def assign_simulator_nickname(simulator: str) -> str:
        """
        Produce a compact nickname from a simulator string.
        Patterns handled:
        cv32e20 -> e2 
        cv32e40 -> e4
        ! Attention à l'ordre des règles !+
        """
        
        simulator = simulator.replace("cv32e20", "e2") # simplifie
        simulator = simulator.replace("cv32e40", "e4") # simplifie
        simulator = simulator.replace("corev_pulp", "pulp") # simplifie
               
        # e4x_i-em0,1,2 -> renommage
        simulator = simulator.replace("e4x_im0", "e4x_im0d0") # pas de mult, pas de div
        simulator = simulator.replace("e4x_im1", "e4x_im4d2") # change mult -> basé ressources, ajoute div
        simulator = simulator.replace("e4x_im2", "e4x_im4d0") # change mult -> basé ressources, ajoute div

        simulator = simulator.replace("e4x_em0", "e4x_em0d0") # pas de mult, pas de div
        simulator = simulator.replace("e4x_em1", "e4x_em4d2") # change mult -> basé ressources, ajoute div
        simulator = simulator.replace("e4x_em2", "e4x_em4d0") # change mult -> basé ressources, ajoute div

        simulator = simulator.replace("e4px", "e4x_im5d2") # ajout mult -> basé ressources

        # e2_i-em0-3 -> add div
        simulator = simulator.replace("e2_im0", "e2_im0d1")
        simulator = simulator.replace("e2_im1", "e2_im1d1")
        simulator = simulator.replace("e2_im2", "e2_im2d1")
        simulator = simulator.replace("e2_im3", "e2_im3d1")

        simulator = simulator.replace("e2_em0", "e2_em0d1")
        simulator = simulator.replace("e2_em1", "e2_em1d1")
        simulator = simulator.replace("e2_em2", "e2_em2d1")
        simulator = simulator.replace("e2_em3", "e2_em3d1")

        simulator = simulator.replace("px", "") # rassemble px, x
        simulator = simulator.replace("x", "") # rassemble px, x

        return simulator

def plot_normalised_resource_usage(all_archi_results: Dict[str, Dict[str, List[float]]],
                                   targets: List[str]):
    """
    Improved normalization plot:

      • LUT and FF are normalized so the baseline architecture = 1.0.
        → Units become "x baseline"
        → Example: norm_LUT = 1.25 means 125% of baseline LUT

      • DSP is shown as RAW values (no normalization) on the secondary axis.

      • Layout, sorting, baseline marking, variant/family labels
        remain consistent with the delta plot.
    """
    print("\nRenaming architectures for clarity...")
    for archi in all_archi_results.keys():
        print(archi)

     # rename microarchitectures: replace 'corev_pulp' with 'pulp'

    renamed_archis = {}
    for arch, key in all_archi_results.items():
        arch = assign_simulator_nickname(arch)
        renamed_archis[arch] = key
    all_archi_results = renamed_archis

    for arch in all_archi_results.keys():
        print(arch)

    # ------------------------------------------------------------
    # 1) Identify baseline architecture (smallest LUT absolute usage)
    # ------------------------------------------------------------
    lut_values = {a: all_archi_results[a]["Slice LUTs"][0] for a in all_archi_results}
    baseline_archi = min(lut_values, key=lut_values.get)

    baseline_LUT = all_archi_results[baseline_archi]["Slice LUTs"][0]
    baseline_FF  = all_archi_results[baseline_archi]["Slice Registers"][0]
    baseline_DSP = all_archi_results[baseline_archi]["DSPs"][0]

    print(f"\nBaseline architecture (lowest LUT): {baseline_archi}")
    print(f"Baseline LUT={baseline_LUT}, FF={baseline_FF}, DSP={baseline_DSP}")

    # ------------------------------------------------------------
    # 2) Family/variant splitting (same logic as before)
    # ------------------------------------------------------------
    def split_arch_name(arch_name: str):
        name = arch_name.strip()

        # if name.startswith("cv32e20"):
        #     fam = "cv32e20"
        #     var = name[len("cv32e20"):].lstrip("_")
        # elif name.startswith("cv32e40"):
        #     fam = "cv32e40"
        #     var = name[len("cv32e40"):].lstrip("_")
        # else:
        #     fam, _, var = name.partition("_")

        if name.startswith("e2"):
            fam = "e2"
            var = name[len("e2"):].lstrip("_")
        elif name.startswith("e4"):
            fam = "e4"
            var = name[len("e4"):].lstrip("_")
        else:
            fam, _, var = name.partition("_")

        return fam, var or "-"

    variant_order = {
        "e2": ["em0d1", "em1d1", "em2d1", "em3d1", "im0d1", "im1d1", "im2d1", "im3d1"],
        "e4": ["em0d0", "em4d0", "em4d2", "im0d0", "im4d0", "im4d2",
                     "im5d2", "im5d2_pulp", "im5d2_fpu", "im5d2_pulp_fpu"] #"p", "p_pulp",
    }


    def arch_sort_key(arch):
        fam, var = split_arch_name(arch)
        try:
            idx = variant_order[fam].index(var)
        except (KeyError, ValueError):
            idx = len(variant_order.get(fam, []))
        return (fam, idx)


    archis_sorted = sorted(all_archi_results.keys(), key=arch_sort_key)

    # ------------------------------------------------------------
    # Define a resource cost model (adjustable)
    # ------------------------------------------------------------
    alpha = 0.5   # LUT weight
    beta  = 0.5   # FF weight

    # DSP equivalent cost expressed in LUT/REG terms
    DSP_LUT_EQ = 700 #1500 # 750 LUTs, 150 FFs is the diff btw cv32e20_em1 and cv32e20_em0
    DSP_FF_EQ  = 150 #0

    # Gamma expressed consistently with alpha/beta
    gamma = alpha * DSP_LUT_EQ + beta * DSP_FF_EQ
    print("gamma:" +  str(gamma))

    # ------------------------------------------------------------
    # 3) Assign resource cost w.r.t resource cost model 
    # ------------------------------------------------------------
    norm_LUT = []
    norm_FF  = []
    raw_DSP  = []
    resource_cost = []

    for archi in archis_sorted:
        lut = all_archi_results[archi]["Slice LUTs"][0]
        ff  = all_archi_results[archi]["Slice Registers"][0]
        dsp = all_archi_results[archi]["DSPs"][0]

        norm_LUT.append(100 * lut / baseline_LUT)
        norm_FF.append(100 * ff  / baseline_FF)
        raw_DSP.append(dsp)
        
        # --------------------------------------------------------
        # Resource cost
        # Cost = α·LUT + β·FF + γ·DSP
        # --------------------------------------------------------
        cost = alpha * lut + beta * ff + gamma * dsp
        resource_cost.append(cost)
    
    for archi, cost in zip(archis_sorted, resource_cost):
        all_archi_results[archi]["Resource cost"] = [cost]

    # ------------------------------------------------------------
    # Normalize resource cost (baseline = baseline_archi)
    # ------------------------------------------------------------
    baseline_resource_cost = resource_cost[
        archis_sorted.index(baseline_archi)
    ]

    norm_RESOURCE = [
        100 * cost / baseline_resource_cost
        for cost in resource_cost
    ]

    # print cost per microarchitecture
    print("\nResource cost per microarchitecture:")
    for archi, cost in zip(archis_sorted, norm_RESOURCE):
        print(f"{archi}: {cost:.2f}%")

    # ------------------------------------------------------------
    # 3.5) Second cost model normalized by FPGA resources available 
    # ------------------------------------------------------------
    
    # A. assign available resources from reference architecture
    
    ref_arch = archis_sorted[0]

    LUT_avail = all_archi_results[ref_arch]["Slice LUTs"][1]
    FF_avail  = all_archi_results[ref_arch]["Slice Registers"][1]
    DSP_avail = all_archi_results[ref_arch]["DSPs"][1]

    print("Available LUTs:", LUT_avail)
    print("Available FFs :", FF_avail)
    print("Available DSPs:", DSP_avail)

    # B. define weights

    alpha_cap = 1.0
    beta_cap  = 1.0
    gamma_cap = 1.0

    # C. Compute second resource cost normalized by available resources 

    resource_cost_cap = []

    for archi in archis_sorted:
        lut = all_archi_results[archi]["Slice LUTs"][0]
        ff  = all_archi_results[archi]["Slice Registers"][0]
        dsp = all_archi_results[archi]["DSPs"][0]

        cost_cap = (
            alpha_cap * (lut / LUT_avail) +
            beta_cap  * (ff  / FF_avail)  +
            gamma_cap * (dsp / DSP_avail)
        )

        resource_cost_cap.append(cost_cap)
        all_archi_results[archi]["Resource cost (capacity)"] = [cost_cap]

    # D. Normalize second resource cost (baseline = baseline_archi)

    baseline_cap_cost = resource_cost_cap[
        archis_sorted.index(baseline_archi)
    ]

    norm_RESOURCE_CAP = [
        100 * cost / baseline_cap_cost
        for cost in resource_cost_cap
    ]

    # ------------------------------------------------------------
    # 4) Plot
    # ------------------------------------------------------------
    colors = {
        "LUT": "#FFBE0B",
        "FF":  "#FB5607",
        "DSP": "#3A86FF",
    }

    x = np.arange(len(archis_sorted))
    width = 0.18
    bar_sep = 0.5
    fig, ax1 = plt.subplots(figsize=(12, 6))

    bar_lut = ax1.bar(
        x - 0.5 * width,
        norm_LUT,
        width,
        color=colors["LUT"],
        label="LUT"
    )

    bar_ff = ax1.bar(
        x + 0.5 * width,
        norm_FF,
        width,
        color=colors["FF"],
        label="FF"
    )

    bar_resource = ax1.bar(
        x + 1.5 * width,
        norm_RESOURCE,
        width,
        color="#8338EC",  # purple
        label="Resource cost"
    )

    # bar_resource_cap = ax1.bar(
    #     x + 2.5 * width,
    #     norm_RESOURCE_CAP,
    #     width,
    #     color="#06D6A0",  # green
    #     label="Resource cost (capacity)"
    # )


    # Secondary axis (raw DSP)
    ax2 = ax1.twinx()
    bar_dsp = ax2.bar(x - 1.5 * width, raw_DSP, width, color=colors["DSP"], label="DSP")

    # ------------------------------------------------------------
    # 5) Variant + family labels
    # ------------------------------------------------------------
    families = [split_arch_name(a)[0] for a in archis_sorted]
    variants = [split_arch_name(a)[1] for a in archis_sorted]

    ax1.set_xticks(x)
    ax1.set_xticklabels([""] * len(x))

    fam_colors = {"cv32e20": "#1f77b4", "cv32e40": "#d62728"}

    # Variant labels
    for xi, (fam, var) in enumerate(zip(families, variants)):
        label = var
        if archis_sorted[xi] == baseline_archi:
            label = f"baseline: {var}"

        ax1.annotate(
            label,
            xy=(xi, 0), xycoords=("data", "axes fraction"),
            xytext=(0, -5), textcoords="offset points",
            rotation=45, ha="right", va="top",
            fontsize=9,
            color=fam_colors.get(fam, "black")
        )

    # Family labels centered
    unique_fams = []
    for f in families:
        if not unique_fams or f != unique_fams[-1]:
            unique_fams.append(f)

    for fam in unique_fams:
        idxs = [i for i, f in enumerate(families) if f == fam]
        cx = np.mean([x[i] for i in idxs])
        ax1.annotate(
            fam,
            xy=(cx, 0), xycoords=("data", "axes fraction"),
            xytext=(0, -40), textcoords="offset points",
            ha="center", va="top",
            fontsize=10, fontweight="bold",
            color=fam_colors.get(fam, "black")
        )

    plt.subplots_adjust(bottom=0.27)

    # Give headroom for stickers
    ymax1 = max(max(norm_LUT), max(norm_FF), max(norm_RESOURCE) * 1.15)

    ax1.set_ylim(0, ymax1)

    # ------------------------------------------------------------
    # 6) Baseline sticker
    # ------------------------------------------------------------
    x_base = x[archis_sorted.index(baseline_archi)]
    #sticker = f"LUT={baseline_LUT}\nFF={baseline_FF}\nDSP={baseline_DSP}"
    sticker_text = f"LUT: {round(baseline_LUT / 1000)}k\nFF: {round(baseline_FF / 1000)}k\nDSP: {round(baseline_DSP / 1000)} "

    ax1.text(
        x_base + 0.40 * width,
        max(norm_LUT[x_base], norm_FF[x_base]) + 2.50,
        sticker_text,
        ha="center", va="bottom",
        fontsize=10,
        bbox=dict(facecolor="white", edgecolor="black", boxstyle="round,pad=0.3")
    )

    # x_base_dsp = x[archis_sorted.index(baseline_archi_DSP)]
    # sticker_text_dsp = f"LUT: {round(baseline_archi_DSP_LUT / 1000)}k\nFF: {round(baseline_archi_DSP_FF / 1000)}k\nDSP: {int(baseline_archi_DSP_DSP)} "
    
    # # compute a vertical offset = 5% of axis height
    # y_offset = 0.01 * ax1.get_ylim()[1]

    # ax1.text(
    #     x_base_dsp,
    #     max(norm_LUT[x_base_dsp], norm_FF[x_base_dsp], norm_DSP[x_base_dsp]) + y_offset,
    #     sticker_text_dsp,
    #     ha="center", va="bottom",
    #     fontsize=10,
    #     bbox=dict(facecolor="white", edgecolor="black", boxstyle="round,pad=0.3")
    # )   


    # ------------------------------------------------------------
    # Draw dotted line between families
    # ------------------------------------------------------------
    families = [split_arch_name(a)[0] for a in archis_sorted]

    for i in range(1, len(families)):
        if families[i] != families[i - 1]:
            # vertical line between bars i-1 and i
            ax1.axvline(
                x=i - 2.25 * width,
                linestyle=":",
                linewidth=1.5,
                color="black",
                alpha=0.7
            )

    # ------------------------------------------------------------
    # 7) Labeling and legend
    # ------------------------------------------------------------
    ax1.set_ylabel("LUT, FF, Resource cost (% of baseline)")
    ax2.set_ylabel("DSP raw")

    #ax1.set_title("Normalized Resource Usage (baseline = 1.0)")
    ax1.set_xlabel("Microarchitecture", labelpad=35)

    ax1.legend(handles=[bar_dsp, bar_lut, bar_ff, bar_resource],
               labels=["DSP", "LUT", "FF", "Resource cost"],
               loc="upper left")

    plt.tight_layout()
    plt.savefig(
        "microarchitectures_normalized_resource_usage.svg",
        format="svg",
        bbox_inches="tight",  # removes extra white space
        transparent=False,    # set True if you want a transparent background
    )

    # compute relative difference for each microarchitecture between first and second cost model
    print("\nRelative difference between first and second cost model:")
    for archi, cost1, cost2 in zip(archis_sorted, norm_RESOURCE, norm_RESOURCE_CAP):
        rel_diff = 100 * abs(cost2 - cost1) / cost1
        print(f"{archi}: {rel_diff:.2f}%")

    # compute avg relative difference
    rel_diffs = [
        100 * abs(cost2 - cost1) / cost1
        for cost1, cost2 in zip(norm_RESOURCE, norm_RESOURCE_CAP)
    ]
    avg_rel_diff = sum(rel_diffs) / len(rel_diffs)
    
    import math

    # std
    mean = avg_rel_diff
    std_rel_diff = math.sqrt(
        sum((x - mean) ** 2 for x in rel_diffs) / len(rel_diffs)
    )

    print(f"Average relative difference: {avg_rel_diff:.2f}%")
    print(f"Std dev (sample): {std_rel_diff:.2f}%")

    # Export to PDF
    plt.tight_layout()
    plt.savefig("microarchitectures_resources.pdf", format="pdf")
    plt.show()

def find_cost_one_dsp(all_archi_results: Dict[str, Dict[str, List[float]]]):
    """
    Estimate the cost of one DSP by comparing e2_em1d1 and e2_em2d1
    e2_em1d1 uses 1 HW emulated multiplier (no DSP)
    whereas e2_em2d1 uses 1 DSP for the multiplier.
    The difference in LUT/FF usage gives an estimate of the cost of one DSP.
    """
    # e2_em1d1
    archi1 = "cv32e20_em1"
    # e2_em2d1
    archi2 = "cv32e20_em2"

    lut1 = all_archi_results[archi1]["Slice LUTs"][0]
    ff1  = all_archi_results[archi1]["Slice Registers"][0]
    dsp1 = all_archi_results[archi1]["DSPs"][0]

    lut2 = all_archi_results[archi2]["Slice LUTs"][0]
    ff2  = all_archi_results[archi2]["Slice Registers"][0]
    dsp2 = all_archi_results[archi2]["DSPs"][0]

    delta_lut = lut2 - lut1
    delta_ff  = ff2 - ff1
    delta_dsp = dsp2 - dsp1  # should be 1

    print(f"Diff ressources (cv32e20_em2 - cv32e20_em1)")
    print(f"  LUT: {delta_lut}")
    print(f"  FF:  {delta_ff}")
    print(f"  DSP: {delta_dsp}")

    # compute delta between cv32e20_em1 and cv32e20_em0 to see the cost of having a hw emulated multiplier
    archi0 = "cv32e20_em0"
    lut0 = all_archi_results[archi0]["Slice LUTs"][0]
    ff0  = all_archi_results[archi0]["Slice Registers"][0]
    dsp0 = all_archi_results[archi0]["DSPs"][0]

    delta_lut_emul = lut1 - lut0
    delta_ff_emul  = ff1 - ff0
    delta_dsp_emul = dsp1 - dsp0  # should be 0

    print(f"compute delta between cv32e20_em1 and cv32e20_em0 to see the cost of having a hw emulated multiplier")
    print(f"  LUT: {delta_lut_emul}")
    print(f"  FF:  {delta_ff_emul}")
    print(f"  DSP: {delta_dsp_emul}")

    # compute the diff between cv32e20_em0 sw emulated and cv32e20_em2 dsp to see the total cost of having 
    # a hw multiplier with dsp as well as the cost of the data path to use the dsp
    delta_lut_total = lut2 - lut0
    delta_ff_total  = ff2 - ff0
    delta_dsp_total = dsp2 - dsp0  # should be 1
    
    print(f"compute the diff between cv32e20_em0 sw emulated and cv32e20_em2 dsp to see the total cost of having \
         a hw multiplier with dsp as well as the cost of the data path to use the dsp")
    print(f"  LUT: {delta_lut_total}")
    print(f"  FF:  {delta_ff_total}")
    print(f"  DSP: {delta_dsp_total}")


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


    # rename microarchitectures: replace 'corev_pulp' with 'pulp'
    renamed_archis = {}
    for arch, data in all_archi_results.items():
        new_arch = arch.replace("corev_pulp", "pulp")
        renamed_archis[new_arch] = data
    all_archi_results = renamed_archis

    # remove microarchitectures p and p_pulp
    filtered_archis = {}
    for arch, data in all_archi_results.items():
        if arch == "cv32e40p" or arch == "cv32e40p_pulp":
            continue
        filtered_archis[arch] = data
    all_archi_results = filtered_archis

    print(all_archi_results)

    with open("uarchs_ressources.pkl", "wb") as f:
        pickle.dump(all_archi_results, f)

    find_cost_one_dsp(all_archi_results)

    #plot_resource_utilization(all_archi_results, targets)
    #plot_delta_resource_usage(all_archi_results, targets)
    plot_normalised_resource_usage(all_archi_results, targets)
    print("available LUTs: " + str(all_archi_results["cv32e20_em1"]["Slice LUTs"][1]))

if __name__ == "__main__":
    main()
