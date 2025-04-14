module time_test;  
  initial begin  
    $timeformat(-9, 2, " ns", 10);  
    #5 $display("Current Simulation Time: %t", $time);  
    #10 $display("Current Simulation Time: %t", $time);  
  end  
endmodule  

module tb_time_test;  
  time_test uut();  
  initial #20 $finish;  
endmodule  




