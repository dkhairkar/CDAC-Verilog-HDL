// Define level-sensitive latch using a sequential UDP
primitive latch(q, d, clock, clear);
// Output declaration
output q;
reg q; // 'q' must be reg for sequential UDP
// Input declaration
input d, clock, clear;
// Initialize output
initial
    q = 0; // Set initial value of q
// State table definition
// Format: d clock clear : current_state : next_state ;
table
    // Clear active (asynchronous clear)
    ?  ?   1 :   ?   : 0 ; // Clear overrides everything
    // Latch behavior when clock is high and clear is low
    1  1   0 :   ?   : 1 ; // Latch data = 1
    0  1   0 :   ?   : 0 ; // Latch data = 0
    // Retain value when clock is low and clear is inactive
    ?  0   0 :   ?   : - ; // Hold previous state
endtable
endprimitive
