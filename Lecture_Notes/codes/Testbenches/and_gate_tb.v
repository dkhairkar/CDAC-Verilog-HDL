`timescale 1ns / 1ps

module and_gate_tb;

    // Declare testbench variables
    reg a, b;
    wire y;

    // Instantiate the AND gate
    and_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    // Test sequence
    initial begin
        $dumpfile("and_gate_tb.vcd"); // For waveform generation
        $dumpvars(0, and_gate_tb);

        // Apply test vectors
        a = 0; b = 0; #10; // Expect y = 0
        a = 0; b = 1; #10; // Expect y = 0
        a = 1; b = 0; #10; // Expect y = 0
        a = 1; b = 1; #10; // Expect y = 1

        // End simulation
        $display("Test completed.");
        $finish;
    end

endmodule
