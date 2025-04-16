`timescale 1ns / 1ps

module tb_counter;
  reg clk, clr;
  wire [3:0] Q;

  // Instantiate the counter
  counter uut(Q, clk, clr);

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
    // 10ns clock period  
  end

  // Stimulus
  initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0, tb_counter);

    clr = 1; #10;
    clr = 0; #200;

    $finish;
  end
endmodule
