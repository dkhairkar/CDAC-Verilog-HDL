// Contributor: Sarvesh Mane

`timescale 1ns / 1ps

module alu_function( input [3:0] a , input [3:0] b , input [2:0] select , output reg  [4:0] result);

always @(select)
begin
     result = alu( a , b,select);
end

function [4:0] alu ;
input [3:0] A;
input [3:0] B;
input [2:0] Select;

begin
       case(Select)
       
       3'b000 :  alu = A;
       3'b001 :  alu = A + B;
       3'b010 :  alu = A - B;
       3'b011 :  alu = A / B;
       3'b100 :  alu = A % 1;
       3'b101 :  alu = A << 1;
       3'b110 :  alu = A >> 1;
       3'b111 :  alu = A > B;
       endcase  
end
endfunction

endmodule
