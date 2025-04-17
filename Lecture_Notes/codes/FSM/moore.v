module moore (clk, in, rst, out);
input clk, in, rst;  
output out;

reg [1:0] cst, nxt;

parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

always @(in or cst)
begin
case (cst)
    S0: if (in == 0) nxt = S0;
        else nxt = S1;
    S1: if (in == 0) nxt = S0;
        else nxt = S2;
    S2: if (in == 0) nxt = S0;
        else nxt = S2;
    default: nxt = 2'bxx;
endcase
end

always @(posedge clk)
begin
    if (rst)
        cst <= S0;
    else
        cst <= nxt;
end

assign out = (cst == S2);
   
endmodule