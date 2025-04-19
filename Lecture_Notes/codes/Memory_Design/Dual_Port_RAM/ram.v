`timescale 1ns / 1ps


module ram(  input clk, input wr_en , input [7:0] wr_data , output reg  [7:0] rd_data, input [3:0] wr_addr, input [3:0] rd_addr); 

reg [7:0] mem [15:0];

// writing logic//
always @(posedge clk)
begin
           if (wr_en)
           begin
                       mem[wr_addr] <= wr_data;
           end
       
end

// read logic //

always @ (posedge clk)
begin
            rd_data <= mem[rd_addr];
            
end

endmodule
