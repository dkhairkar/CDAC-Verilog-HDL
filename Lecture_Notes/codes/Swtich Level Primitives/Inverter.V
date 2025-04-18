//Define an inverter using MOS switches
module my_not(out, in);

output out;
input in;

//define power and ground
supply1 pwr;
supply0 gnd;

//instantiate nmos and pmos switches
pmos  (out, pwr, in);
nmos  (out, gnd, in);

endmodule


		
		
