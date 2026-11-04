#!/usr/bin/env bash
if [[ -d xsim.dir ]]; then
    rm -rf xsim.dir
fi
xvlog -sv rtl/nand5.sv sim/tb_nand5.sv
xelab --debug typical tb_nand5 --snapshot top_sim
xsim -t xsim_run.tcl top_sim



