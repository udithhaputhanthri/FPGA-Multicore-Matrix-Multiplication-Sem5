module tb_mux (
	input in_1,
	input in_2,

	output mux_out
);

assign mux_out = in_1 ? in_1 : in_2;
				  
endmodule	