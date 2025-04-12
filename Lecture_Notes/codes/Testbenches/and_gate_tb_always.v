`timescale 1ns / 1ps

module and_gate_tb;
    reg a, b;
    wire y;

    and_gate uut (.a(a), .b(b), .y(y));

    initial begin
        a = 0; b = 0;
    end

    always #5 a = ~a; // Toggle 'a' every 5 time units
    always #10 b = ~b; // Toggle 'b' every 10 time units

    initial begin
        #40; // Run simulation for 40 time units
        $finish;
    end
endmodule
