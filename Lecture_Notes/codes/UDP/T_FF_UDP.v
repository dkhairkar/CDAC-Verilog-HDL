// Edge-triggered T-flipflop using UDP
primitive T_FF(q, clk, clear);

// Output and input declarations
output q;
reg q;
input clk, clear;

// No initialization needed; TFF is initialized using clear signal

table
// clk   clear : q : q+ ;
   ?       1   : ? : 0 ;     // Asynchronous clear
 (10)     0    : 1 : 0 ;     // Toggle q on rising edge if q is 1 -> becomes 0
 (10)     0    : 0 : 1 ;     // Toggle q on rising edge if q is 0 -> becomes 1
 (0?)     0    : ? : - ;     // Ignore positive transitions
endtable

endprimitive


