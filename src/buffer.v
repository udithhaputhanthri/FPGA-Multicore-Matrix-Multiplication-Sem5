module buffer(
   input [15:0] data_in,
	input select,
	output [15:0] data_out
   );

assign data_out = select ? data_in : 16'bz;
// buffer - combinational
// if select then data_in
// else 16 bit binary z (high impdence)
  
endmodule