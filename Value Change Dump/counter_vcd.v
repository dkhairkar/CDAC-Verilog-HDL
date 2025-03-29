module counter_vcd;
   reg clk, reset;
   reg [3:0] count;

   initial begin
      $dumpfile("counter.vcd");  // Specify VCD file name
      $dumpvars(1, counter_vcd); // Dump signals at 1 level of hierarchy
      
      clk = 0; reset = 1;
      #5 reset = 0;  // Release reset after 5 time units
   end

   always #10 clk = ~clk; // Toggle clock every 10 time units

   always @(posedge clk or posedge reset) begin
      if (reset)
         count <= 0;
      else
         count <= count + 1;
   end

   initial begin
      $dumpon;      // Start dumping signals
      #100 $dumpoff; // Stop dumping after 100 time units
      #50 $finish;   // End simulation
   end
endmodule
