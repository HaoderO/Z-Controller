vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_5
vlib modelsim_lib/msim/processing_system7_vip_v1_0_7
vlib modelsim_lib/msim/xil_defaultlib

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_5 modelsim_lib/msim/axi_vip_v1_1_5
vmap processing_system7_vip_v1_0_7 modelsim_lib/msim/processing_system7_vip_v1_0_7
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xilinx_vip -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L xilinx_vip "+incdir+D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/include" \
"D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr "+incdir+../../../../test1.srcs/sources_1/bd/sys_clk/ipshared/ec67/hdl" "+incdir+../../../../test1.srcs/sources_1/bd/sys_clk/ipshared/8c62/hdl" "+incdir+../../../../test1.srcs/sources_1/bd/sys_clk/ip/sys_clk_processing_system7_0_0" "+incdir+D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../test1.srcs/sources_1/bd/sys_clk/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_5 -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../test1.srcs/sources_1/bd/sys_clk/ipshared/ec67/hdl" "+incdir+../../../../test1.srcs/sources_1/bd/sys_clk/ipshared/8c62/hdl" "+incdir+../../../../test1.srcs/sources_1/bd/sys_clk/ip/sys_clk_processing_system7_0_0" "+incdir+D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../test1.srcs/sources_1/bd/sys_clk/ipshared/d4a8/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_7 -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../test1.srcs/sources_1/bd/sys_clk/ipshared/ec67/hdl" "+incdir+../../../../test1.srcs/sources_1/bd/sys_clk/ipshared/8c62/hdl" "+incdir+../../../../test1.srcs/sources_1/bd/sys_clk/ip/sys_clk_processing_system7_0_0" "+incdir+D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../test1.srcs/sources_1/bd/sys_clk/ipshared/8c62/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../test1.srcs/sources_1/bd/sys_clk/ipshared/ec67/hdl" "+incdir+../../../../test1.srcs/sources_1/bd/sys_clk/ipshared/8c62/hdl" "+incdir+../../../../test1.srcs/sources_1/bd/sys_clk/ip/sys_clk_processing_system7_0_0" "+incdir+D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/sys_clk/ip/sys_clk_processing_system7_0_0/sim/sys_clk_processing_system7_0_0.v" \
"../../../bd/sys_clk/sim/sys_clk.v" \

vlog -work xil_defaultlib \
"glbl.v"

