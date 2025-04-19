module generate_case_example #(
    parameter MODE = 0  // Selects the operation: 0 = AND, 1 = OR, 2 = XOR
)(
    input wire a,
    input wire b,
    output wire y
);

generate
    case (MODE)
        0: begin : and_block
            assign y = a & b;
        end
        1: begin : or_block
            assign y = a | b;
        end
        2: begin : xor_block
            assign y = a ^ b;
        end
        default: begin : default_block
            assign y = 1'b0; // Default output
        end
    endcase
endgenerate

endmodule
