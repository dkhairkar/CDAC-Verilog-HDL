`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 11:16:53 AM
// Design Name: 
// Module Name: test_rom_async
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


module test_rom_async;
wire [3:0] data_out;
reg [1:0] address;
integer i;
rom_4x4_async dut(data_out, address);

initial begin
    for(i=0; i<4; i=i+1)begin
        address = i;
        #10;
        $display("Time: %t | Address: %b | Output Data: %b", $time, address, data_out);
        end
        $finish;
end

endmodule
