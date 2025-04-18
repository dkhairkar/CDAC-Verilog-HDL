module fsmd_gray_converter_tb;
  reg clk, rst, start;
  reg [3:0] binary_in;
  wire [3:0] gray_out;
  wire done;

  fsmd_gray_converter uut (
    .clk(clk), .rst(rst), .binary_in(binary_in),
    .start(start), .gray_out(gray_out), .done(done)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0; rst = 1; binary_in = 4'b0000; start = 0;
    #10 rst = 0;

    binary_in = 4'b1010; start = 1;
    #10 start = 0;

    #30;

    binary_in = 4'b1101; start = 1;
    #10 start = 0;

    #30 $finish;
  end

  initial begin
    $monitor("Time=%0t | Bin=%b | Gray=%b | Done=%b", $time, binary_in, gray_out, done);
  end
endmodule
