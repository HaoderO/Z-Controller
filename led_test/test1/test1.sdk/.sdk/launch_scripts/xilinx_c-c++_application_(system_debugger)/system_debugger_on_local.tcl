connect -url tcp:127.0.0.1:3121
source D:/HaoGuojun/MyProject/FPGAProject/Xilinx_Vivado/ZYNQ_Prj/test1/test1/test1.sdk/led_ctrl_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-SMT2 210251A08870"} -index 0
loadhw -hw D:/HaoGuojun/MyProject/FPGAProject/Xilinx_Vivado/ZYNQ_Prj/test1/test1/test1.sdk/led_ctrl_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-SMT2 210251A08870"} -index 0
stop
ps7_init
ps7_post_config
configparams force-mem-access 0
