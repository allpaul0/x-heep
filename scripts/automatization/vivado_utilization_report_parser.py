# Parsing Vivado utilization report robustly and demonstrating on the user's report sample.
import re
from typing import Dict, Optional

report_text = r"""
Copyright 1986-2022 Xilinx, Inc. All Rights Reserved. Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
---------------------------------------------------------------------------------------------------------------------------------------------------------
| Tool Version : Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
| Date         : Thu Nov 13 13:15:59 2025
| Host         : user-VirtualBox running 64-bit Ubuntu 20.04.6 LTS
| Command      : report_utilization -file xilinx_core_v_mini_mcu_wrapper_utilization_placed.rpt -pb xilinx_core_v_mini_mcu_wrapper_utilization_placed.pb
| Design       : xilinx_core_v_mini_mcu_wrapper
| Device       : xc7z020clg400-1
| Speed File   : -1
| Design State : Fully Placed
---------------------------------------------------------------------------------------------------------------------------------------------------------

Utilization Design Information

Table of Contents
-----------------
1. Slice Logic
1.1 Summary of Registers by Type
2. Slice Logic Distribution
3. Memory
4. DSP
5. IO and GT Specific
6. Clocking
7. Specific Feature
8. Primitives
9. Black Boxes
10. Instantiated Netlists

1. Slice Logic
--------------

+-------------------------+-------+-------+------------+-----------+-------+
|        Site Type        |  Used | Fixed | Prohibited | Available | Util% |
+-------------------------+-------+-------+------------+-----------+-------+
| Slice LUTs              | 26935 |     0 |          0 |     53200 | 50.63 |
|   LUT as Logic          | 26935 |     0 |          0 |     53200 | 50.63 |
|   LUT as Memory         |     0 |     0 |          0 |     17400 |  0.00 |
| Slice Registers         | 31538 |     0 |          0 |    106400 | 29.64 |
|   Register as Flip Flop | 31538 |     0 |          0 |    106400 | 29.64 |
|   Register as Latch     |     0 |     0 |          0 |    106400 |  0.00 |
| F7 Muxes                |  2143 |     0 |          0 |     26600 |  8.06 |
| F8 Muxes                |   986 |     0 |          0 |     13300 |  7.41 |
+-------------------------+-------+-------+------------+-----------+-------+
* Warning! LUT value is adjusted to account for LUT combining.


1.1 Summary of Registers by Type
--------------------------------

+-------+--------------+-------------+--------------+
| Total | Clock Enable | Synchronous | Asynchronous |
+-------+--------------+-------------+--------------+
| 0     |            _ |           - |            - |
| 0     |            _ |           - |          Set |
| 0     |            _ |           - |        Reset |
| 0     |            _ |         Set |            - |
| 0     |            _ |       Reset |            - |
| 0     |          Yes |           - |            - |
| 465   |          Yes |           - |          Set |
| 13237 |          Yes |           - |        Reset |
| 0     |          Yes |         Set |            - |
| 17836 |          Yes |       Reset |            - |
+-------+--------------+-------------+--------------+


2. Slice Logic Distribution
---------------------------

+--------------------------------------------+-------+-------+------------+-----------+-------+
|                  Site Type                 |  Used | Fixed | Prohibited | Available | Util% |
+--------------------------------------------+-------+-------+------------+-----------+-------+
| Slice                                      | 11689 |     0 |          0 |     13300 | 87.89 |
|   SLICEL                                   |  7930 |     0 |            |           |       |
|   SLICEM                                   |  3759 |     0 |            |           |       |
| LUT as Logic                               | 26935 |     0 |          0 |     53200 | 50.63 |
|   using O5 output only                     |     0 |       |            |           |       |
|   using O6 output only                     | 22549 |       |            |           |       |
|   using O5 and O6                          |  4386 |       |            |           |       |
| LUT as Memory                              |     0 |     0 |          0 |     17400 |  0.00 |
|   LUT as Distributed RAM                   |     0 |     0 |            |           |       |
|   LUT as Shift Register                    |     0 |     0 |            |           |       |
| Slice Registers                            | 31538 |     0 |          0 |    106400 | 29.64 |
|   Register driven from within the Slice    |  6750 |       |            |           |       |
|   Register driven from outside the Slice   | 24788 |       |            |           |       |
|     LUT in front of the register is unused | 16033 |       |            |           |       |
|     LUT in front of the register is used   |  8755 |       |            |           |       |
| Unique Control Sets                        |  1195 |       |          0 |     13300 |  8.98 |
+--------------------------------------------+-------+-------+------------+-----------+-------+
* * Note: Available Control Sets calculated as Slice * 1, Review the Control Sets Report for more information regarding control sets.


3. Memory
---------

+-------------------+------+-------+------------+-----------+-------+
|     Site Type     | Used | Fixed | Prohibited | Available | Util% |
+-------------------+------+-------+------------+-----------+-------+
| Block RAM Tile    |   16 |     0 |          0 |       140 | 11.43 |
|   RAMB36/FIFO*    |   16 |     0 |          0 |       140 | 11.43 |
|     RAMB36E1 only |   16 |       |            |           |       |
|   RAMB18          |    0 |     0 |          0 |       280 |  0.00 |
+-------------------+------+-------+------------+-----------+-------+
* Note: Each Block RAM Tile only has one FIFO logic available and therefore can accommodate only one FIFO36E1 or one FIFO18E1. However, if a FIFO18E1 occupies a Block RAM Tile, that tile can still accommodate a RAMB18E1


4. DSP
------

+----------------+------+-------+------------+-----------+-------+
|    Site Type   | Used | Fixed | Prohibited | Available | Util% |
+----------------+------+-------+------------+-----------+-------+
| DSPs           |    3 |     0 |          0 |       220 |  1.36 |
|   DSP48E1 only |    3 |       |            |           |       |
+----------------+------+-------+------------+-----------+-------+


5. IO and GT Specific
---------------------

+-----------------------------+------+-------+------------+-----------+-------+
|          Site Type          | Used | Fixed | Prohibited | Available | Util% |
+-----------------------------+------+-------+------------+-----------+-------+
| Bonded IOB                  |   59 |    59 |          0 |       125 | 47.20 |
|   IOB Master Pads           |   31 |       |            |           |       |
|   IOB Slave Pads            |   27 |       |            |           |       |
| Bonded IPADs                |    0 |     0 |          0 |         2 |  0.00 |
| Bonded IOPADs               |    0 |     0 |          0 |       130 |  0.00 |
| PHY_CONTROL                 |    0 |     0 |          0 |         4 |  0.00 |
| PHASER_REF                  |    0 |     0 |          0 |         4 |  0.00 |
| OUT_FIFO                    |    0 |     0 |          0 |        16 |  0.00 |
| IN_FIFO                     |    0 |     0 |          0 |        16 |  0.00 |
| IDELAYCTRL                  |    0 |     0 |          0 |         4 |  0.00 |
| IBUFDS                      |    0 |     0 |          0 |       121 |  0.00 |
| PHASER_OUT/PHASER_OUT_PHY   |    0 |     0 |          0 |        16 |  0.00 |
| PHASER_IN/PHASER_IN_PHY     |    0 |     0 |          0 |        16 |  0.00 |
| IDELAYE2/IDELAYE2_FINEDELAY |    0 |     0 |          0 |       200 |  0.00 |
| ILOGIC                      |    0 |     0 |          0 |       125 |  0.00 |
| OLOGIC                      |    0 |     0 |          0 |       125 |  0.00 |
+-----------------------------+------+-------+------------+-----------+-------+


6. Clocking
-----------

+------------+------+-------+------------+-----------+-------+
|  Site Type | Used | Fixed | Prohibited | Available | Util% |
+------------+------+-------+------------+-----------+-------+
| BUFGCTRL   |   13 |     0 |          0 |        32 | 40.63 |
| BUFIO      |    0 |     0 |          0 |        16 |  0.00 |
| MMCME2_ADV |    1 |     0 |          0 |         4 | 25.00 |
| PLLE2_ADV  |    0 |     0 |          0 |         4 |  0.00 |
| BUFMRCE    |    0 |     0 |          0 |         8 |  0.00 |
| BUFHCE     |    0 |     0 |          0 |        72 |  0.00 |
| BUFR       |    0 |     0 |          0 |        16 |  0.00 |
+------------+------+-------+------------+-----------+-------+


7. Specific Feature
-------------------

+-------------+------+-------+------------+-----------+-------+
|  Site Type  | Used | Fixed | Prohibited | Available | Util% |
+-------------+------+-------+------------+-----------+-------+
| BSCANE2     |    0 |     0 |          0 |         4 |  0.00 |
| CAPTUREE2   |    0 |     0 |          0 |         1 |  0.00 |
| DNA_PORT    |    0 |     0 |          0 |         1 |  0.00 |
| EFUSE_USR   |    0 |     0 |          0 |         1 |  0.00 |
| FRAME_ECCE2 |    0 |     0 |          0 |         1 |  0.00 |
| ICAPE2      |    0 |     0 |          0 |         2 |  0.00 |
| STARTUPE2   |    0 |     0 |          0 |         1 |  0.00 |
| XADC        |    0 |     0 |          0 |         1 |  0.00 |
+-------------+------+-------+------------+-----------+-------+


8. Primitives
-------------

+------------+-------+---------------------+
|  Ref Name  |  Used | Functional Category |
+------------+-------+---------------------+
| FDRE       | 17836 |        Flop & Latch |
| LUT6       | 14958 |                 LUT |
| FDCE       | 13237 |        Flop & Latch |
| LUT5       |  5611 |                 LUT |
| LUT4       |  3788 |                 LUT |
| LUT3       |  3355 |                 LUT |
| LUT2       |  2772 |                 LUT |
| MUXF7      |  2143 |               MuxFx |
| CARRY4     |  1273 |          CarryLogic |
| MUXF8      |   986 |               MuxFx |
| LUT1       |   837 |                 LUT |
| FDPE       |   465 |        Flop & Latch |
| IBUF       |    53 |                  IO |
| OBUFT      |    44 |                  IO |
| RAMB36E1   |    16 |        Block Memory |
| BUFG       |     7 |               Clock |
| OBUF       |     6 |                  IO |
| BUFGCTRL   |     6 |               Clock |
| DSP48E1    |     3 |    Block Arithmetic |
| MMCME2_ADV |     1 |               Clock |
+------------+-------+---------------------+


9. Black Boxes
--------------

+----------+------+
| Ref Name | Used |
+----------+------+


10. Instantiated Netlists
-------------------------

+-------------------------------+------+
|            Ref Name           | Used |
+-------------------------------+------+
| xilinx_mem_gen_8192           |    2 |
| xilinx_clk_wizard_clk_wiz_0_0 |    1 |
+-------------------------------+------+




"""

class Vivado_Utilization_Report_Parser:
 
    # Robust parser that uses splitting on '|' rather than a single regex for the whole line.
    def parse(self, report: str, targets: list) -> Dict[str, list]:
        results = {}
        # Prepare normalized target keys for matching (lowercase, collapse spaces)
        norm_targets = {re.sub(r'\s+', ' ', t.strip().lower()): t for t in targets}
        
        for raw_line in report.splitlines():
            line = raw_line.rstrip()
            if '|' not in line:
                continue
            # split by '|' and strip entries; ignore empty columns produced by leading/trailing pipes
            cols = [c.strip() for c in line.split('|') if c.strip() != '']
            if not cols:
                continue
            # first column is the field name
            name = cols[0].lower()
            # removes leading and trailing whitespace + replaces any sequ of one or more whitespace chars w/ a single space.
            name_norm = re.sub(r'\s+', ' ', name.strip())
            # check if any target is a prefix or exact match of the name (to handle indent/leading spaces)
            matched_key = None
            for nt in norm_targets:
                # match if exact or name startswith target (handles "Slice" vs "Slice LUTs" etc.)
                if name_norm == nt:
                    matched_key = norm_targets[nt]
                    break
            # we move to the next raw_line if there is no match
            if not matched_key:
                continue
            # already in dic
            if matched_key in results:
                continue
            
            # collect numeric tokens from the rest of columns 
            numeric_values = []
            num_re = re.compile(r'^[+-]?\d{1,3}(?:,\d{3})*(?:\.\d+)?$|^[+-]?\d+(?:\.\d+)?$')
            for c in cols[1:]:
                c_clean = c.replace(',', '')  # remove thousands separators if any
                if num_re.match(c.strip()):
                    try:
                        numeric_values.append(float(c_clean))
                    except ValueError:
                        pass

            # Heuristic to pick Used, Available, Util%:
            # - If there are 5 numeric columns (typical full table), take the last number.
            util_value = None
            if len(numeric_values) == 5:
                used_value = numeric_values[0]
                available_value = numeric_values[3]
                util_value = numeric_values[4]
                results[matched_key] = [used_value, available_value, util_value]
            else:
                print("Error there shoudld be 5 numeric values for the line ")
                print(name)
                results[matched_key] = []
        return results

# # Targets requested by the user
# targets = ["Slice LUTs", "Slice Registers", "Slice", "DSPs", "Block RAM Tile"]

# vurp = Vivado_Utilization_Report_Parser()
# extracted = vurp.parse(report_text, targets)

# print("Extracted utilization percentages:")
# for k, v in extracted.items():
#     print(k, v)
