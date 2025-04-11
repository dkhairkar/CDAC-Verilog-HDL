`define WIDTH 8

module define_example;
  reg [`WIDTH-1:0] a = 8'b10101010;

  initial $display("a = %b", a);
endmodule

`undef WIDTH
