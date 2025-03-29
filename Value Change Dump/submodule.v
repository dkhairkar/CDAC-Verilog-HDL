module submodule;
   reg a, b;
   wire sum;

   assign sum = a ^ b;

   initial begin
      a = 0; b = 1;
      #10 a = 1; b = 0;
      #10 a = 1; b = 1;
   end
endmodule

module top;
   reg clk;
   submodule m1(); // Instantiate submodule

   initial begin
      $dumpfile("hierarchy.vcd");  // Specify VCD file
      $dumpvars(2, top.m1); // Dump 2 levels below top.m1
   end

   always #5 clk = ~clk;
endmodule

