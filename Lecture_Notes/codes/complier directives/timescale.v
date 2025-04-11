`timescale 1ns / 1ps

module timescale_example;
  initial begin
    #5 $display("5 ns delay");
    #10 $display("15 ns total delay");
  end
endmodule
