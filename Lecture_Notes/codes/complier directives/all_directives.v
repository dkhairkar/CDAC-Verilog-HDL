// Verilog Example with All Major Compiler Directives Demonstrated

`timescale 1ns / 1ps         // Time unit is 1ns, time precision is 1ps
`define WIDTH 8              // Macro for bit width
`define OPERATION "ADDER"    // Choose operation ("ADDER", "SUB", "MUL")

`include "params.v"          // Includes external parameter file (assume params.v has useful constants)

module arithmetic_unit (
  input  [`WIDTH-1:0] a, b,
  output [`WIDTH-1:0] result
);

  reg [`WIDTH-1:0] r;
  assign result = r;

  always @(*) begin
    `ifdef DEBUG
      $display("Performing %s", `OPERATION);
    `endif

    `ifdef ADDER
      r = a + b;
    `elsif SUB
      r = a - b;
    `elsif MUL
      r = a * b;
    `else
      r = 0;
    `endif
  end

endmodule

// Define cell for ASIC flow demo
`celldefine
module inverter(input a, output y);
  assign y = ~a;
endmodule
`endcelldefine

`undef OPERATION             // Undefining macro
`resetall                   // Reset all directives to default

// Testbench
module tb;
  reg  [`WIDTH-1:0] a, b;
  wire [`WIDTH-1:0] result;

  arithmetic_unit uut (
    .a(a),
    .b(b),
    .result(result)
  );

  initial begin
    a = 8'd10; b = 8'd5;
    #5;
    $display("Result = %d", result);
  end
endmodule
