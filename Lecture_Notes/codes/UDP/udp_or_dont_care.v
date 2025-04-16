primitive udp_or (out, a, b);
  output out;
  input a, b;

  table
  // a  b : out
     0  0 : 0;
     0  1 : 1;
     1  0 : 1;
     1  1 : 1;

     0  x : x;  // optional: or define 0 x : x;
     x  0 : x;
     1  x : 1;  // logic holds if one input is 1
     x  1 : 1;
     x  x : x;
  endtable
endprimitive

