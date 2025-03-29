# Value Change Dump (VCD)

**Value Change Dump (VCD)** captures signal transitions for waveform visualization.

## Example: Counter

This example creates a **4-bit counter** with a clock and reset. It dumps signals of the `counter_vcd` module to `counter.vcd`.  

- Uses `$dumpon` and `$dumpoff` to limit the dump duration.  
- Stops simulation after **150 time units**.

## Example: Submodule

- The **submodule** (`submodule`) contains two inputs (`a`, `b`) and computes the sum.
- The **top module** (`top`) instantiates `submodule` as `m1`.  
- `$dumpvars(2, top.m1);` dumps two levels below `top.m1`, capturing signals from the submodule.  
- Generates **hierarchy.vcd** for waveform analysis.

