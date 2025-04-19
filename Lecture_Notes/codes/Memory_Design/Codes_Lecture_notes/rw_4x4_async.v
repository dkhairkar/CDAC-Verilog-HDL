`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 11:14:43 AM
// Design Name: 
// Module Name: rw_4x4_async
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


module rw_4x4_async(
    output reg [3:0]data_out,
    input [1:0]address,
    input WE,
    input [3:0]data_in
    );

    reg [3:0]RW[0:3];
    
    always@(data_in or WE or address) begin
        if(WE == 1)
            RW[address] = data_in;
        else 
            data_out = RW[address];
    end
endmodule
