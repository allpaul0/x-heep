import re
from dataclasses import dataclass
from typing import List, Optional

## Instruction Data Structure
@dataclass
class Instruction:
    mnemonic: str
    operands: List[str]
    immediate: Optional[int] = None
    raw: str = ""

    def __repr__(self):
        return f"Instruction(mnemonic={self.mnemonic}, operands={self.operands}, immediate={self.immediate})"

## Default Latency for RV32I integer instructions
INTEGER_LATENCY = 1

## Latency Table for CV32E40X (based on doc pipeline details)
INSTRUCTION_LATENCY = {

    # Memory operations
    "lw": 1,
    "lh": 1,
    "lb": 1,
    "lhu": 1,
    "lbu": 1,

    "sw": 1,
    "sh": 1,
    "sb": 1,

    # Jumps
    "jal": 2,
    "jalr": 2,

    # Branches
    "beq": 1,
    "bne": 1,
    "blt": 1,
    "bge": 1,
    "bltu": 1,
    "bgeu": 1,

    # Multiply
    "mul": 1,
    "mulh": 4,
    "mulhu": 4,
    "mulhsu": 4,

    # Division
    "div": 35,
    "divu": 35,
    "rem": 35,
    "remu": 35,

    # CSR
    "csrrw": 1,
    "csrrs": 1,
    "csrrc": 1,
    "csrrwi": 1,
    "csrrsi": 1,
    "csrrci": 1,

    # System
    "mret": 2,

    # Fence
    "fence": 5,
    "fence.i": 5,

    # Bit manipulation extensions (Zba/Zbb/Zbc/Zbs)
    "clz": 1,
    "ctz": 1,
    "pcnt": 1,
    "max": 1,
    "min": 1,
}

## Instruction Latency Function
def get_instruction_latency(instr: Instruction) -> int:
    """
    Return latency (cycles) for a single instruction.
    """

    mnemonic = instr.mnemonic.lower()

    if mnemonic in INSTRUCTION_LATENCY:
        return INSTRUCTION_LATENCY[mnemonic]

    print(f"Warning: Unknown instruction '{mnemonic}', using default latency {INTEGER_LATENCY}")

    # Default RV32I integer instruction
    return INTEGER_LATENCY

## Parser for RISC-V assembly single instruction
def parse_instruction(asm: str) -> Instruction:
    """
    Parse a single RISC-V instruction string like:
        'sw a5,-172(s0)'
        'addi a5,a5,4'
        'li a5,0'
    """

    asm = asm.strip()
    parts = asm.split(None, 1)

    mnemonic = parts[0]
    operands_part = parts[1] if len(parts) > 1 else ""

    # Split operands by comma (handling whitespace)
    operands = [op.strip() for op in operands_part.split(",") if op.strip()]

    immediate = None

    # Detect immediate values (simple detection: standalone number or offset)
    for op in operands:
        # Match immediate like -172 or 4
        if re.fullmatch(r"-?\d+", op):
            immediate = int(op)

        # Match offset(base) like -172(s0)
        match = re.fullmatch(r"(-?\d+)\((\w+)\)", op)
        if match:
            immediate = int(match.group(1))

    return Instruction(
        mnemonic=mnemonic,
        operands=operands,
        immediate=immediate,
        raw=asm
    )

## Function to extract instructions from a RISC-V disassembly file
def extract_instructions_from_file(path: str) -> List[Instruction]:
    """
    Reads a RISC-V disassembly file and returns
    an ordered list of parsed Instruction objects.
    """

    instructions = []

    # Regex to capture the final assembly instruction
    # Format: address: machinecode <whitespace> instruction
    line_regex = re.compile(
        r"^\s*[0-9a-f]+:\s+[0-9a-f]+\s+(.+)$"
    )

    with open(path, "r") as f:
        for line in f:
            match = line_regex.search(line)
            if match:
                asm = match.group(1).strip()
                instr = parse_instruction(asm)
                instructions.append(instr)

    return instructions

## Basic Block Latency Estimator
def estimate_basic_block_latency(block: List[Instruction]) -> int:
    """
    Estimate the cost of a basic block by summing the
    latencies of its instructions.
    """

    total_cycles = 0

    for instr in block:
        total_cycles += get_instruction_latency(instr)

    return total_cycles

basic_block = extract_instructions_from_file("sw/applications/tpg_inference_instr_team_fixedpt_custom_TPG/dump.txt")
print(estimate_basic_block_latency(basic_block))

# for instr in basic_block:
#     print(instr)