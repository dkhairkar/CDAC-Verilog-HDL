module full_adder (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);

wire axorb, aandb, aandcin, bandcin;

// sum = a ^ b ^ cin
xor (axorb, a, b);
xor (sum, axorb, cin);

// cout = (a & b) | (a & cin) | (b & cin)
and (aandb, a, b);
and (aandcin, a, cin);
and (bandcin, b, cin);
or  (cout, aandb, aandcin, bandcin);

endmodule
