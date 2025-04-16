// Define an edge-sensitive sequential UDP (D Flip-Flop with asynchronous clear)
primitive edge_dff(q, d, clock, clear);

// Declarations
output q;
reg q; // Must be reg to store state
input d, clock, clear;

// Initialization
initial
    q = 0;

// State table
// Format: d clock clear : q : q+ ;
table
    ?  ?     1 : ? : 0 ;   // Asynchronous clear
    ?  ?  (10): ? : - ;   // Ignore negative edge of clear
    1 (10)   0 : ? : 1 ;   // Capture data=1 on rising edge of clock
    0 (10)   0 : ? : 0 ;   // Capture data=0 on rising edge of clock
    ? (1x)   0 : ? : - ;   // Hold output if clock becomes unknown after 1
    ? (0?)   0 : ? : - ;   // Ignore positive transitions
    ? (x1)   0 : ? : - ;   // Ignore positive transitions
    (??)     ? : ? : - ;   // Ignore changes in 'd' when clock is steady

endtable
endprimitive
