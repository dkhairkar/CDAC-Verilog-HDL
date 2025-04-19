module race_example;
  reg clk;
  reg [3:0] counter;
  initial begin
    clk = 0;
    counter = 0;
  end
//-----------------------------------------------
  // Clock generator
  always #5 clk = ~clk;
//-----------------------------------------------
  // First always block
  always @(posedge clk) begin
    counter = counter + 1;
  end
//------------------------------------------------
  // Second always block (also updates counter)
  always @(posedge clk) begin
    counter = counter + 2;
  end
//------------------------------------------------
  // Monitor
  always @(posedge clk) begin
    $display("Time = %0t, Counter = %0d", $time, counter);
  end
endmodule

