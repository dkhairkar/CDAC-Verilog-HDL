module tb_bitwise_xor;

reg  [7:0] a, b;
wire [7:0] y;

bitwise_xor #(8) uut (
    .a(a),
    .b(b),
    .y(y)
);

initial begin
    a = 8'b10101010;
    b = 8'b11001100;
    #10;
    $display("a = %b", a);
    $display("b = %b", b);
    $display("y = %b", y); // Expect 01100110
end

endmodule
