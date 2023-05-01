`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/13 09:54:23
// Design Name: 
// Module Name: led_ctrl_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module led_ctrl_tb;

// Parameters
localparam  CNT_DIV_MAX = 10000000;

// Ports
reg  rst_n = 0;
wire  pwm_0;
wire  pwm_1;

led_ctrl 
#(
  .CNT_DIV_MAX (CNT_DIV_MAX )
)
led_ctrl_dut (
  .rst_n (rst_n ),
  .pwm_0 (pwm_0 ),
  .pwm_1  ( pwm_1)
);

initial begin
    begin
        #100 rst_n = 1;
    end
end


endmodule
