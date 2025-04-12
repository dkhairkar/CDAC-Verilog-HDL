module param_adder_tb;
    parameter WIDTH = 8;
    reg [WIDTH-1:0] a, b;
    wire [WIDTH-1:0] sum;

    param_adder #(WIDTH) dut (.a(a), .b(b), .sum(sum));

    initial begin
        a = 8'd10;
        b = 8'd25;
        #10;
        $display("a = %d, b = %d, sum = %d", a, b, sum);
        $finish;
    end
endmodule
