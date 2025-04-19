module fork_join_demo;

  initial begin
    $display("Simulation starts at time = %0t", $time);
    
    fork
      begin
        #5 $display(">> Task A completed at time = %0t", $time);
      end
      
      begin
        #10 $display(">> Task B completed at time = %0t", $time);
      end
      
      begin
        #3 $display(">> Task C completed at time = %0t", $time);
      end
    join

    $display("All parallel tasks done. Resuming after fork-join at time = %0t", $time);
  end

endmodule
