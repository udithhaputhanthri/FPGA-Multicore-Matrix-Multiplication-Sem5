module data_memory_multi_port
(
	input [15:0] data_in_1, data_in_2, data_in_3, data_in_4, data_in_5, data_in_6, data_in_7, data_in_8, data_in_9, data_in_10,
	input [15:0] addr_1, addr_2, addr_3, addr_4, addr_5, addr_6, addr_7, addr_8, addr_9, addr_10, 
	input we_1, we_2, we_3, we_4, we_5, we_6, we_7, we_8, we_9, we_10, clk,
	output [15:0] data_out_1, data_out_2, data_out_3, data_out_4, data_out_5, data_out_6, data_out_7, data_out_8, data_out_9, data_out_10
);
	
// Declare the RAM variable
reg [15:0] ram[0:999];

assign data_out_1 = ram[addr_1];
assign data_out_2 = ram[addr_2];
assign data_out_3 = ram[addr_3];
assign data_out_4 = ram[addr_4];
assign data_out_5 = ram[addr_5];
assign data_out_6 = ram[addr_6];
assign data_out_7 = ram[addr_7];
assign data_out_8 = ram[addr_8];
assign data_out_9 = ram[addr_9];
assign data_out_10 = ram[addr_10];


always @ (posedge clk)
	begin
		if (we_1) ram[addr_1] <= data_in_1;
		if (we_2) ram[addr_2] <= data_in_2;
		if (we_3) ram[addr_3] <= data_in_3;
		if (we_4) ram[addr_4] <= data_in_4;
		if (we_5) ram[addr_5] <= data_in_5;
		if (we_6) ram[addr_6] <= data_in_6;
		if (we_7) ram[addr_7] <= data_in_7;
		if (we_8) ram[addr_8] <= data_in_8;
		if (we_9) ram[addr_9] <= data_in_9;
		if (we_10) ram[addr_10] <= data_in_10;
		
	end
	
endmodule
