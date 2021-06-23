module buffer(data_in, select, data_out);

   input [15:0] data_in;   
	input select;
	output [15:0] data_out;
	
	

   assign data_out = select ? data_in : 1'bz;

endmodule