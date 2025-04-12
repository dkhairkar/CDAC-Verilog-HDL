`timescale 1ns / 1ps

module and_gate_tb;
    reg a, b;
    wire y;

    and_gate uut (.a(a), .b(b), .y(y));

    task apply_inputs(input reg ta, input reg tb);
        begin
            a = ta; b = tb;
            #10;
            $display("Time=%0t | a=%b, b=%b => y=%b", $time, a, b, y);
        end
    endtask

    initial begin
        apply_inputs(0, 0);
        apply_inputs(0, 1);
        apply_inputs(1, 0);
        apply_inputs(1, 1);
        $finish;
    end
endmodule
