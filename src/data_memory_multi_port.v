module data_memory_multi_port
(
	input [15:0] data_in_1, data_in_2, data_in_3, data_in_4,
	input [15:0] addr_1, addr_2, addr_3, addr_4,
	input we_1, we_2, we_3, we_4, clk,
	output [15:0] data_out_1, data_out_2, data_out_3, data_out_4
);
	
// Declare the RAM variable
reg [15:0] ram[0:999];

assign data_out_1 = ram[addr_1];
assign data_out_2 = ram[addr_2];
assign data_out_3 = ram[addr_3];
assign data_out_4 = ram[addr_4];

always @ (posedge clk)
	begin
		if (we_1) ram[addr_1] <= data_in_1;
		if (we_2) ram[addr_2] <= data_in_2;
		if (we_3) ram[addr_3] <= data_in_3;
		if (we_4) ram[addr_4] <= data_in_4;
	end
	
endmodule
