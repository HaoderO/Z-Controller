-makelib ies_lib/xilinx_vip -sv \
  "D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "D:/Software/Xilinx_Vivado/Vivado2019/Vivado/2019.1/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../test1.srcs/sources_1/bd/sys_clk/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_vip_v1_1_5 -sv \
  "../../../../test1.srcs/sources_1/bd/sys_clk/ipshared/d4a8/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib ies_lib/processing_system7_vip_v1_0_7 -sv \
  "../../../../test1.srcs/sources_1/bd/sys_clk/ipshared/8c62/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/sys_clk/ip/sys_clk_processing_system7_0_0/sim/sys_clk_processing_system7_0_0.v" \
  "../../../bd/sys_clk/sim/sys_clk.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

