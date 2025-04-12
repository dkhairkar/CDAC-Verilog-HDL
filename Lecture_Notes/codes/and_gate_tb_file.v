`timescale 1ns / 1ps
module and_gate_tb;
    reg a, b;
    wire y;
    integer file;

    and_gate uut (.a(a), .b(b), .y(y));

    initial begin
        file = $fopen("test_vectors.txt", "r"); // Open file
        if (file == 0) begin
            $display("Error opening file");
            $finish;
        end

        while (!$feof(file)) begin
            $fscanf(file, "%b %b\n", a, b);
            #10;
            $display("a=%b, b=%b => y=%b", a, b, y);
        end

        $fclose(file);
        $finish;
    end
endmodule
