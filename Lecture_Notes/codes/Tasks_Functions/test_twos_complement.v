function [3:0] twos_complement;
    input [3:0] a;
    begin
        twos_complement = ~a + 1;
    end
endfunction

module test_twos_complement;
    initial begin
      $display("2's Complement of 4'b1010: %b", twos_complement(4'b1010));
    end
endmodule