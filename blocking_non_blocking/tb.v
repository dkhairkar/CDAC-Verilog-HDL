module test_bench;
reg [3:0]a,b;
reg clk;
wire [3:0] c,d;

test dut(a,b,clk,c,d);
initial begin
  clk=0;
  a=3;
  b=2;
  forever #10 clk=~clk;
  end
initial #100 $finish;
endmodule
