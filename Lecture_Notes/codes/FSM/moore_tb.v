`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2025 02:08:04 PM
// Design Name: 
// Module Name: moore_tb
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


module moore_tb;
reg clk, in, rst ; 
wire out ;

moore dut(clk, in,rst, out);

initial begin
clk=0;
rst=1;
in = 0;
#10 rst=0;
#5 in = 1;
#30 in = 0;
#10 in = 1;
#75 in = 0;

#10 $finish;
end

always #5 clk = ~clk;

endmodule
