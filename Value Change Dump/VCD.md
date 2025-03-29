Value Change Dump (VCD): Captures signal transitions for waveform visualization
1. Example Counter
   Creates a 4-bit counter with a clock and reset.
   Dumps signals of counter_vcd module to counter.vcd.
   Uses $dumpon and $dumpoff to limit dump duration.
   Stops simulation after 150 time units.  
2. Example Submodule 
   Module submodule contains two inputs (a, b) and computes sum.
   Module top instantiates submodule as m1.
   $dumpvars(2, top.m1); dumps two levels below top.m1, capturing signals from submodule.
   Generates hierarchy.vcd for waveform analysis.
