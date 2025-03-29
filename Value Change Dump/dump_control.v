module dump_control;
   reg clk, enable;

   always #5 clk = ~clk;

   initial begin
      clk = 0; enable = 1;
      #20 enable = 0;
      #50 enable = 1;
      #200 $finish;
   end

   initial begin
      $dumpfile("dump_on_off.vcd");
      $dumpvars(0, dump_control);
      #50 $dumpoff;  // Stop dumping at time = 50
      #100 $dumpon;  // Resume dumping at time = 100
   end
endmodule
