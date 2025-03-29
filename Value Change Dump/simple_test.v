module simple_test;
   reg a, b;
   wire sum;

   assign sum = a ^ b;

   initial begin
      a = 0; b = 1;
      #10 a = 1; b = 0;
      #10 a = 1; b = 1;
      #10 a = 0; b = 0;
      #100 $finish;
   end

   initial begin
      $dumpfile("simple.vcd"); // Set VCD filename
      $dumpvars; // Dump all signals in the design
   end
endmodule



