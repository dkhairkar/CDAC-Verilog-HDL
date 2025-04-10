module add_example;
  reg [3:0] a, b;
  reg [4:0] sum;

  function [4:0] add;
    input [3:0] x, y;
    begin
      add = x + y;
    end
  endfunction

  initial begin
    a = 4'b1101; // 5
    b = 4'b0011; // 3
    
    sum = add(a, b); // sum = 8
    $display("Sum=%b",sum);
  end
endmodule