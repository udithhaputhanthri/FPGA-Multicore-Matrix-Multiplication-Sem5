module ALU(
			in_bus,
			in_AC,
			operation,
			data_out
			);
			
		input [15:0] in_bus;
		input [15:0] in_AC;
		input [2:0] operation;
		output data_out;

		//Defining symbols to identify logical opeartors

		localparam pass = 3'd0;
		localparam mul = 3'd1;
		localparam add = 3'd2;
		localparam sub = 3'd3;
		localparam int_div = 3'd4;
		localparam is_mod = 3'd5;
	
		reg [15:0] data;
		assign data_out = data;
		
		always @(in_bus or in_AC or operation)
		begin
	
			case(operation)
				pass:data = in_bus;
				mul: data = in_AC * in_bus;
				add: data = in_AC + in_bus;
				sub: data = in_AC - in_bus;
				int_div: data= (in_AC - in_AC % in_bus)/in_bus;
				is_mod: data= in_AC % in_bus;
				
				default : data = in_bus;
			endcase
	
		end
	
endmodule
	
	
	