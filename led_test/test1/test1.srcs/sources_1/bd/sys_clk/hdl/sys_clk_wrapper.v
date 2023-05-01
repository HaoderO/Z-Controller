//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Sun Mar 26 15:34:34 2023
//Host        : Derher running 64-bit major release  (build 9200)
//Command     : generate_target sys_clk_wrapper.bd
//Design      : sys_clk_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module sys_clk_wrapper
   (FCLK_CLK0_0,
    FCLK_RESET0_N_0,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb);
  output FCLK_CLK0_0;
  output FCLK_RESET0_N_0;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;

  wire FCLK_CLK0_0;
  wire FCLK_RESET0_N_0;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;

  sys_clk sys_clk_i
       (.FCLK_CLK0_0(FCLK_CLK0_0),
        .FCLK_RESET0_N_0(FCLK_RESET0_N_0),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb));
endmodule
