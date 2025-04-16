primitive udp_example (out, in1, in2);
  output out;
  input in1, in2;
  table
    0 0 : 0;
    0 1 : 1;
    1 0 : 1;
    1 1 : 0;
  endtable
endprimitive


