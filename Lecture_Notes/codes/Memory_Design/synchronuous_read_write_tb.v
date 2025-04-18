`timescale 1ns / 1ps
module ram_tb; reg clk = 0; reg wr_en = 0; reg [7:0] wr_data = 0; reg [3:0] wr_addr = 0; reg [3:0] rd_addr = 0; wire [7:0] rd_data;
ram uut (clk,wr_en,wr_data,rd_data,wr_addr,rd_addr); 

always #5 clk = ~clk;  // 100MHz clock

initial begin

  #10;  // Initial delay

    // Test 1: Write then read
    wr_en = 1;
    wr_addr = 4'hA;
    wr_data = 8'h55;
    #10;
    
    wr_en = 0;
    rd_addr = 4'hA;
    #10;
    $display("Test 1: %s", (rd_data === 8'h55) ? "PASS" : "FAIL");



    // Test 2: Simultaneous read/write different addresses
    wr_en = 1;
    wr_addr = 4'h3;
    wr_data = 8'hAA;
    rd_addr = 4'hA;  // Should still read 55
    #10;
    $display("Test 2: %s", (rd_data === 8'h55) ? "PASS" : "FAIL");

    // Test 3: Read same address being written
    wr_addr = 4'h5;
    wr_data = 8'h33;
    rd_addr = 4'h5;
    #10;
    $display("Test 3: %s", (rd_data === 8'h33) ? "PASS" : "FAIL");

    // Final check
    wr_en = 0;
    rd_addr = 4'h3;
    #10;
    $display("Final check: %s", (rd_data === 8'hAA) ? "PASS" : "FAIL");

    $finish;
end
 
endmodule
