module sub;
   reg x, y;
endmodule

module mid;
   sub sm();
endmodule

module top;
   mid m();
   
   initial begin
      $dumpfile("two_levels.vcd");
      $dumpvars(2, top); // Dump signals in top and mid, but not in sub
   end
endmodule


