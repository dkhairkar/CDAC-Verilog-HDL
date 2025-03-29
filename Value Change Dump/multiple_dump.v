module sub_module;
   reg x, y;
endmodule

module top;
   reg clk;
   sub_module sm1();

   always #10 clk = ~clk;

   initial begin
      $dumpfile("top_level.vcd");
      $dumpvars(0, top);
   end

   initial begin
      $dumpfile("sub_level.vcd");
      $dumpvars(0, top.sm1); // Dump signals only from sub_module
   end
endmodule
