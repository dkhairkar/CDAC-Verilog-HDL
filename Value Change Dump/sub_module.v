module sub_module;
   reg x, y;
endmodule

module top;
   reg clk;
   sub_module sm1();

   always #5 clk = ~clk;

   initial begin
      $dumpfile("one_level.vcd");
      $dumpvars(1, top); // Dump signals only in top, not in submodules
   end
endmodule

