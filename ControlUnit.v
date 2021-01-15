module ControlUnit(
			clk,
			instruction_register,
			z,
			start,
			reg_select,
			memory_select,  //where to write or read
			alu_operation,
			read,
			write,
			inc_ac,  //to increment the registers
			inc_tp1,
			inc_tp2,
			reset_ac,
			tp1_buffer,  //to select the needed buffer
			tp2_buffer,
			ac_buffer

		);
		

	input clk,z, start;
	input instruction_register;
	output reg [3:0] reg_select; //size varies according to the no of registers we have
	output reg [3:0] memory_select; //need to look
	output reg [1:0] alu_operation;  //we only have 3 operations
	output read, write;
	output inc_ac,inc_tp1, inc_tp2;
	output reset_ac;
	output tp1_buffer, tp2_buffer, ac_buffer;
	
	reg [15:0] instruction;
	reg [21:0] micro_instruction_set [0:23]; //22 bit thamai micro instruction eke length eka.. a wage 24k tiyenaw.(ara loadac1. loadac2 , etc..)
	reg [4:0] current_state; //bit 5 k dala tiyenne states okkoma tiyenne 24k nisa, 5 bit walin 32k puluwan nis a24 represent karaganna athi
	reg [4:0] next_state;
	reg [4:0] micro_instruction; //micro instruction 24n keeweni ekkenada kiyala balaganna
	reg [3:0] decoded_instruction; //ena full instruction eke datath tiyenna puluwan, but apita one instruction eka withrak ganna.
	

	//defining instructions
	localparam SET_ALPHA = 8'd0;
	localparam LDAC_TP1 = 8'b001011;
	
	initial
		begin
	
		micro_instruction_set[0] = {22'd0};//instruction eka enna one wdh danna mekata table ekem(row ekak)
		
		end
	
	always @(instruction_register)
		instruction = instruction_register;
	
	always @(instruction)
		begin
			decoded_instruction = instruction[3:0];
		
			case(decoded_instruction)
		
				SET_ALPHA : micro_instruction <= 5'd0;
				LDAC_TP1 : micro_instruction <= 5'd12; //table eke me instruction eka patan ganna thanata adala row eke number eka danna tiyenne
			
			endcase
		end
		
	
	always @(posedge clk) //not sure pos or neg
		begin
			if(start) 
				begin
					current_state = next_state;
					
					//{reg_select,memory_select, alu_operation, read, write} = micro_instruction_set{current_state}; //micro instruction eke enable wenna one tika danna tiyenne(control signals)
					
					if (current_state ==  5'd3) next_state = micro_instruction;//fetch 2 eka api 3 weni thanata damme kiyala hithala and fetch 2 eken passe kelinma microinstrustion eka patan ganna eka mkkd kiyala balana nisa
					
					else if (current_state == 5'd21) reg_select = instruction[7:4]; //moveac wage, ac ge tiyena eka instruction eken dala ewana register ekata maru karanawa
					
					else
						next_state = next_state; //NOPE wage ekakdi meka use wenne
					
				end
		end
		


endmodule		
