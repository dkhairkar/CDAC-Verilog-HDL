module delay_measure;  
  reg signal;  
  real start_time, end_time, delay;  
  initial begin  
    signal = 0;  
    #7 signal = 1;  
    start_time = $realtime;  
    #12 signal = 0;  
    end_time = $realtime;  
    delay = end_time - start_time;  
    $display("Measured delay: %0.3f ns", delay);  
  end  
endmodule  

module tb_delay_measure;  
  delay_measure uut();  
  initial #30 $finish;  
endmodule  




