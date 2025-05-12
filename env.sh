export VERILATOR_VERSION=4.210
export VERIBLE_VERSION=v0.0-1824-ga3b5bedf

export RISCV=/home/$USER/tools/riscv
export PATH=/home/$USER/tools/verilator/$VERILATOR_VERSION/bin:$PATH
export PATH=/tools/verible/$VERIBLE_VERSION/bin:$PATH

source .venv/bin/activate
source /tools/Xilinx/Vivado/2023.1/settings64.sh
export PATH=/home/$USER/tools/openocd/bin:$PATH
