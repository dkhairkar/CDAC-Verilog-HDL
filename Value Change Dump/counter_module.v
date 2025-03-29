module counter_module;
   reg clk, reset;
   reg [3:0] count;

   always #10 clk = ~clk;

   always @(posedge clk or posedge reset) begin
      if (reset)
         count <= 0;
      else
         count <= count + 1;
   end

   initial begin
      clk = 0; reset = 1;
      #5 reset = 0;
      #200 $finish;
   end

   initial begin
      $dumpfile("control_dump.vcd");
      $dumpvars(0, counter_module);
      #50 $dumpoff;  // Stop dumping at time = 50
      #100 $dumpon;  // Resume dumping at time = 150
   end
endmodule


