module time_comparison;  
  initial begin  
    $display("$time: %t", $time);  
    $display("$stime: %0d", $stime);  
    $display("$realtime: %0.3f", $realtime);  
  end  
endmodule  

module tb_time_comparison;  
  time_comparison uut();  
  initial #10 $finish;  
endmodule  