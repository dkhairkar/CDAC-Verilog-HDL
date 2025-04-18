`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 11:16:53 AM
// Design Name: 
// Module Name: test_rw_async
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


module test_rw_async;
wire [3:0]data_out;
reg [1:0]address;
reg WE;
reg [3:0]data_in;
integer i;

rw_4x4_async dut(data_out, address, WE, data_in);

initial begin
    WE = 1;
    for(i=0; i<4; i=i+1) begin
        address = i;
        data_in = $random;
        #10;
    end
    WE = 0;
    for(i=0; i<4; i=i+1) begin
        address = i;
        #10;
    end
    #10 $finish;
end

endmodule
