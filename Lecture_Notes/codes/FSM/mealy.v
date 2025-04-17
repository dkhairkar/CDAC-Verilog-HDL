module mealy (clk, in,rst, out);
input clk, in, rst ; 
output out ;

reg out;
reg cst, nxt;

parameter S0 = 0, S1 = 1;

always @(in or cst)
case (cst)
    S0: if (in == 0)
       begin
            nxt = S0;
            out = 0;
        end
        else
        begin
            nxt = S1;
            out = 0;
        end
    S1: if (in == 0)
    begin
        nxt = S0;
        out = 0;
    end
    else
    begin
        nxt = S1;
        out = 1;
    end
endcase

always @(posedge clk)
if (rst == 1)
    cst <= S0;
else
    cst <= nxt;

endmodule