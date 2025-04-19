`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 11:04:00 AM
// Design Name: 
// Module Name: rom_4x4_sync
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


module rom_4x4_sync(
    output reg [3:0] data_out,
    input [1:0] address,
    input clk
    );
    
    reg [3:0]ROM[0:3];
    
    initial begin
        ROM[0] = 4'b1110;
        ROM[1] = 4'b0010;
        ROM[2] = 4'b1111;
        ROM[3] = 4'b0100;
    end
    
    always@(posedge clk)
        data_out = ROM[address];
        
endmodule
