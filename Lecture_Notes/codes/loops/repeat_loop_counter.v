module repeat_loop_counter;
  reg [3:0] count;  // 4-bit counter

  initial begin
    count = 4'b0000; // Initialize count to 0

    repeat (10) begin  // Repeat loop runs 10 times
      #5 count = count + 1; // Increment count every 5 time units
      $display("Time = %0t | Count = %b", $time, count); // Print count
    end
  end
endmodule


