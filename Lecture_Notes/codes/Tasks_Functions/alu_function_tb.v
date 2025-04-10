// Contributor : Sarvesh Mane
`timescale 1ns / 1ps

module alu_function_tb;

    
    reg [3:0] a;
    reg [3:0] b;
    reg [2:0] select;
    
   
    wire [4:0] result;
    
    
    alu_function uut (
        .a(a),
        .b(b),
        .select(select),
        .result(result)
    );
    
    initial begin
       
        a = 0;
        b = 0;
        select = 0;    
        
        #100;
         
        select = 3'b000; a = 4'b0101; b = 4'b0010; #10;
            
        select = 3'b001; a = 4'b0101; b = 4'b0011; #10;
         
        select = 3'b010; a = 4'b1000; b = 4'b0011; #10;
        
        select = 3'b011; a = 4'b1100; b = 4'b0011; #10;
          
        // Test case 5: Modulo 1 (select = 100)
        select = 3'b100; a = 4'b1010; b = 4'b0011; #10;
        
        // Test case 6: Left shift (select = 101)
        select = 3'b101; a = 4'b0101; b = 4'b0010; #10;
      
        // Test case 7: Right shift (select = 110)
        select = 3'b110; a = 4'b1010; b = 4'b0010; #10;
        
        // Test case 8: Comparison (select = 111)
        select = 3'b111; a = 4'b1010; b = 4'b0101; #10;
        
        // Additional test cases with different values
        select = 3'b001; a = 4'b1111; b = 4'b0001; #10;
        select = 3'b010; a = 4'b0001; b = 4'b0001; #10;
        select = 3'b011; a = 4'b1111; b = 4'b1111; #10;
        select = 3'b111; a = 4'b0001; b = 4'b1111; #10;
        $finish;
    end
    
endmodule