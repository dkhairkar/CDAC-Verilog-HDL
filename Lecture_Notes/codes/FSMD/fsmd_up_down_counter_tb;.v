module fsmd_up_down_counter_tb;
  reg clk, rst, up;
  wire [3:0] count;

  fsmd_up_down_counter uut (.clk(clk), .rst(rst), .up(up), .count(count));

  always #5 clk = ~clk;

  initial begin
    clk = 0; rst = 1; up = 1;
    #10 rst = 0;

    // Count Up
    repeat(5) begin
      #10 up = 1;
    end

    // Count Down
    repeat(5) begin
      #10 up = 0;
    end

    #20 $finish;
  end

  initial begin
    $monitor("Time: %0t | Up: %b | Count: %d", $time, up, count);
  end
endmodule
