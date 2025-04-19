module simple_if_generate #(
    parameter USE_AND = 1  // Set to 1 for AND, 0 for OR
)(
    input wire a,
    input wire b,
    output wire y
);

// Conditional logic using if-generate
generate
    if (USE_AND) begin : and_block
        assign y = a & b;
    end else begin : or_block
        assign y = a | b;
    end
endgenerate

endmodule
