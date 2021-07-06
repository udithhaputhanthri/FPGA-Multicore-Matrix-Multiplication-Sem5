module tb_mux_mem_data (
	input [15:0] in_1,
	input [15:0] in_2,
    input mem_data_select,

	output  [15:0] mux_out
);

assign mux_out = mem_data_select ? in_1 : in_2;
				  
endmodule	