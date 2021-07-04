module data_memory_2_port
(
	input [15:0] data_in_a, data_in_b,
	input [15:0] addr_a, addr_b,
	input we_a, we_b, clk,
	output [15:0] data_out_a, data_out_b
);
	// Declare the RAM variable
	reg [15:0] ram[0:999];
	
	assign data_out_a = ram[addr_a];
	assign data_out_b = ram[addr_b];

	// Port A
	always @ (posedge clk)
	begin
		if (we_a) ram[addr_a] <= data_in_a;
	end
	
	// Port B
	always @ (posedge clk)
	begin
		if (we_b) ram[addr_b] <= data_in_b;
	end
	
endmodule
