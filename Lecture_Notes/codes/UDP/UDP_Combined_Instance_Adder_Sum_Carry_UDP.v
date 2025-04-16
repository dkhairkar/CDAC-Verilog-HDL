// ----------------------------------------------------------------
// Full Adder Implementation by Instantiating UDPs
// SUM = a ^ b ^ c
// COUT = (a & b) | (b & c) | (a & c)
// ----------------------------------------------------------------

module full_adder (sum, cout, a, b, c);
  input a, b, c;
  output sum, cout;

  // Instantiate UDP for sum
  udp_sum  SUM   (sum, a, b, c);

  // Instantiate UDP for carry
  udp_cy   CARRY (cout, a, b, c);
endmodule
