module test(
    input [3:0]a,b,
    input clk,
    output reg [3:0]c,d
    );
    always@(posedge clk)
    begin
    c<=a+b;
    d<=c+4;
    end
endmodule