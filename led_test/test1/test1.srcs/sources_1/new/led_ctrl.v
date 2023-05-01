`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/12 18:14:19
// Design Name: 
// Module Name: led_ctrl
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

module led_ctrl
#(
    parameter   CNT_DIV_MAX = 10000000
)
(
    input   wire    rst_n       ,

    output  wire    pwm_0       ,      
    output  wire    pwm_1          
);

    wire             clk        ;//50M
    reg     [23:0]   cnt_div    ;
    reg              flag       ;

sys_clk_wrapper system_clk
(
    .FCLK_CLK0_0      (clk)
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) 
        cnt_div <= 24'd0;
    else if (cnt_div == CNT_DIV_MAX) 
        cnt_div <= 24'd0;        
    else
        cnt_div <= cnt_div + 1'b1;                
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        flag <= 1'b0;        
    else if (cnt_div == CNT_DIV_MAX) 
        flag <= ~flag;                
    else
        flag <= flag;                
end

assign pwm_0 =  flag;
assign pwm_1 = ~flag;

endmodule