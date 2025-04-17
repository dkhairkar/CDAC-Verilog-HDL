`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2025 12:28:04 PM
// Design Name: 
// Module Name: mealy_tb
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


module mealy_tb;
reg clk, in, rst ; 
wire out ;

mealy dut(clk, in,rst, out);

initial begin
clk=0;
rst=1;
in = 0;
#5 rst=0;
#5 in = 1;
#10 in = 0;
#40 in = 1;
#10 in = 0;
#5 in = 1;
#5 in = 0;

#10 $finish;
end

always #5 clk = ~clk;

endmodule
