module sub_block;
   reg data;
endmodule

module main_block;
   sub_block s1();
   reg clk;

   always #10 clk = ~clk;

   initial begin
      $dumpfile("checkpoint.vcd");
      $dumpvars(2, main_block);
      #75 $dumpall; // Create a checkpoint at time = 75
   end
endmodule
