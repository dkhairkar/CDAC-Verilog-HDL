module while_loop_counter;
  reg [3:0] count;  // 4-bit counter
  integer i;        // Loop variable

  initial begin
    count = 4'b0000; // Initialize count to 0
    i = 0;

    while (i < 10) begin  // Loop until i reaches 10
      #5 count = count + 1; // Increment count every 5 time units
      $display("Time = %0t | Count = %b", $time, count); // Print count
      i = i + 1; // Increment loop variable
    end
  end
endmodule

