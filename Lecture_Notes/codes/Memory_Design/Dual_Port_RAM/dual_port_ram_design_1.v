`timescale 1ns/1ps
//Dual port RAM module design.

module dual_port(
    input [7:0] data_a, data_b, //data inputs a & b
    input [5:0] addr_a, addr_b, //address inputs
    input we_a, we_b, // input wire enables for a and b
    input clk, // input clock
    output reg [7:0] q_a, q_b
);

reg [7:0] ram [63:0]; // 8 X 64 bit RAM

always @(posedge clk)
begin
    if(we_a)
        ram[addr_a] <= data_a;
    else
	q_a <= ram[addr_a];
end

always @(posedge clk)
begin
    if(we_b)
	ram[addr_b]<= data_b;
    else
	q_b <= ram[addr_b];
end
endmodule

//Dual Post RAM Testbench.

module dual_port_tb;
    reg [7:0] data_a, data_b;
    reg [5:0] addr_a, addr_b;
    reg we_a, we_b;
    reg clk;
    wire [7:0] q_a, q_b;

    dual_port uut (data_a, data_b, addr_a, addr_b, we_a, we_b, clk, q_a, q_b);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1, dual_port_tb);
        clk = 1'b1;
        forever #5 clk = ~clk;
    end

    initial begin

        addr_a = 6'd01;
        addr_b = 6'd02;
        we_a = 1'b1;
        we_b = 1'b1;

        data_a = 8'h10;
        data_b = 8'h20;
        #10; // Clock edge at time 10: Writes occur

        addr_a = 6'd03;
        addr_b = 6'd04;

        data_a = 8'h30;
        data_b = 8'h40;
        #10; // Clock edge at time 20: Writes occur

        we_a = 1'b0;
        addr_a = 6'd01;
        #10; // Clock edge at time 30: Read to q_a should occur
         // Small delay to observe q_a after the edge
        $display("Time = %0t, q_a = %h", $time, q_a);

        we_b = 1'b0;
        addr_b = 6'd02;
        #10; // Clock edge at time 40: Read to q_b should occur
          // Small delay to observe q_b after the edge
        $display("Time = %0t, q_b = %h", $time, q_b);

    end

    initial begin
        #100 $finish;
    end

endmodule