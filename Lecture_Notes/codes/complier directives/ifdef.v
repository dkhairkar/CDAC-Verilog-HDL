`define DEBUG

module conditional_example;
  initial begin
    `ifdef DEBUG
      $display("Debug Mode Active");
    `else
      $display("Normal Mode");
    `endif
  end
endmodule
