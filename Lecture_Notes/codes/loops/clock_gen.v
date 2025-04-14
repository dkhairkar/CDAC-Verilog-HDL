module clock_gen(
  output reg clk  // Clock output
);

  // Initialize clock and toggle indefinitely using a forever loop
  initial begin
    clk = 0;         // Start clock at 0
    forever begin
      #5 clk = ~clk; // Toggle clock every 5 time units (10 time units period)
    end
  end

endmodule