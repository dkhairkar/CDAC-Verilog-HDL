module task_example;

  reg [3:0] a, b;
  reg [4:0] result;

  // Task Definition
  task add_4bit;
    input [3:0] x, y;
    output [4:0] sum;
    begin
      sum = x + y;
    end
  endtask

  initial begin
    a = 4'b0110;   // 6
    b = 4'b0011;   // 3
    add_4bit(a, b, result); // Call the task
    $display("a = %d, b = %d, sum = %d", a, b, result);
  end

endmodule

