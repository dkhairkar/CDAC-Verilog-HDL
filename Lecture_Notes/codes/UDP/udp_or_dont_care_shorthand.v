primitive udp_or (out, a, b);
  output out;
  input a, b;

  table
  // a  b : out
     0  0 : 0;
     ?  1 : 1;
     1  ? : 1;
     x  0 : x;
     0  x : x;
     x  x : x;
  endtable
endprimitive
