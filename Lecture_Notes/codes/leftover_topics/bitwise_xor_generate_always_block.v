module bitwise_xor #(parameter N = 8) (
    input  wire [N-1:0] a,
    input  wire [N-1:0] b,
    output reg  [N-1:0] y
);

genvar i;
generate
    for (i = 0; i < N; i = i + 1) begin : xor_gen
        always @(*) begin
            y[i] = a[i] ^ b[i];
        end
    end
endgenerate

endmodule
