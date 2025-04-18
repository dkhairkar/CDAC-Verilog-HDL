module fsmd_counter(
    input clk,
    input rst,
    output reg [3:0] count
);
    reg [1:0] state;
    parameter S0 = 2'b00, S1 = 2'b01;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S0;
            count <= 4'b0000;
        end else begin
            case (state)
                S0: if (count < 4'b1111) begin count <= count + 1; state <= S1; end
                S1: state <= S0;
            endcase
        end
    end
endmodule


module fsmd_counter_tb;
    reg clk, rst;
    wire [3:0] count;
    
    fsmd_counter uut (.clk(clk), .rst(rst), .count(count));
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        rst = 1;
        #10 rst = 0;
        #100 $finish;
    end
    
    initial begin
        $monitor("Time=%0d, Count=%b", $time, count);
    end
endmodule

