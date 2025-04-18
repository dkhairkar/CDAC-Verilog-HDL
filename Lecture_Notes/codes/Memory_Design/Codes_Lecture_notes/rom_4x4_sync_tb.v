`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 11:16:53 AM
// Design Name: 
// Module Name: test_rom_sync
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


module test_rom_sync;
wire [3:0] data_out;
reg [1:0] address;
reg clk;
integer i;
rom_4x4_sync dut(data_out, address, clk);

initial begin
    clk = 0;
    for(i=0; i<4; i=i+1)begin
        address = i;
        #10;
        $display("Time: %t | Address: %b | Output Data: %b", $time, address, data_out);
        end
        #10 $finish;
end
always #5 clk = ~ clk;
endmodule
