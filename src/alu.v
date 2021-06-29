module alu(
			input [15:0] in_bus,
			input [15:0] in_AC,
			input [2:0] operation,
			output reg [15:0] data_out
);
			
		

		//Defining symbols to identify logical opeartors

		localparam pass = 0;
		localparam mul = 1;
		localparam add = 2;
		localparam sub = 3;
		localparam int_div = 4;
		localparam is_mod = 5;
	
	
		
		always @(in_bus or in_AC or operation)
		begin
	
			case(operation)
				pass:data_out = in_bus;
				mul: data_out = in_AC * in_bus;
				add: data_out = in_AC + in_bus;
				sub: data_out = in_AC - in_bus;
				int_div: data_out= (in_AC - in_AC % in_bus)/in_bus;
				is_mod: data_out= in_AC % in_bus; //correct this- udith
				
				default : data_out = in_bus;
			endcase
	
		end
	
endmodule