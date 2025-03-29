module test_module;
   reg clk, reset, enable;
   wire out;

   assign out = clk & enable;

   initial begin
      clk = 0; reset = 1; enable = 0;
      #5 reset = 0; enable = 1;
      #10 enable = 0;
      #50 $finish;
   end

   always #5 clk = ~clk;

   initial begin
      $dumpfile("selective.vcd");
      $dumpvars(0, test_module.clk, test_module.reset); // Dump only clk and reset
   end
endmodule
