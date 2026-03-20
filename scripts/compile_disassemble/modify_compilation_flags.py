import re
import argparse
import sys


def replace_optimization_flag(file_path, new_opt_flag):
    """
    Replace the optimization flag inside the specific CMake block.
    """

    # Read file content
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Regex pattern to match the full CMake block
    pattern = re.compile(
        r'if\(NOT\s+\$\{PROJECT\}\s+MATCHES\s+"coremark"\).*?set\(COMPILER_LINKER_FLAGS\s+".*?"\s*\)',
        re.DOTALL
    )

    match = pattern.search(content)
    if not match:
        print("Pattern not found in file.")
        return False

    block = match.group(0)

    # Replace any -O flag (-O0, -O1, -O2, -O3, etc.)
    updated_block = re.sub(r'-O\S*', new_opt_flag, block)

    # Replace old block with updated block
    updated_content = content.replace(block, updated_block)

    # Write back to file
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(updated_content)

    print(f"Optimization flag replaced with {new_opt_flag}")
    return True


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Replace optimization flag in CMake COMPILER_LINKER_FLAGS block."
    )
    parser.add_argument("opt", help="Optimization flag (e.g., -O0, -O1, -O2, -O3, -Os, etc.)")

    args = parser.parse_args()

    if not args.opt.startswith("-O"):
        print("Warning: Optimization flag should typically start with '-'")

    success = replace_optimization_flag("sw/CMakeLists.txt", args.opt)

    if not success:
        sys.exit(1)