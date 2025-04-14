module for_loop_counter;
  reg [3:0] count;  // 4-bit counter
  integer i;        // Loop variable

  initial begin
    count = 4'b0000; // Initialize count to 0

    for (i = 0; i < 10; i = i + 1) begin  // Loop from 0 to 9
      #5 count = count + 1; // Increment count every 5 time units
      $display("Time = %0t | Count = %b", $time, count); // Print count
    end
  end
endmodule
