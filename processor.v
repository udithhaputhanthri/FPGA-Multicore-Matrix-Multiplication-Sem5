module processor(
			clk,
			data,
			reset,
			instruction,//ram modules walin input ganna
			start,  //processor action start karanan denne meken
			read,
			write,  //memory eken read karanna or memory ekata write karanna dena ekak
			data_out,//data iput to data_memory
			data_memory_address,
			instruction_memory_address,//addresses of data and instruction memories
			endprogram
			);	
			
	input clk;
	input [15:0] data;
	input [15:0] instruction;
	input start;
	input reset;
	output read;
	output write;
	output [15:0] data_out;
	output [15:0] data_memory_address;
	output [15:0] instruction_memory_address;
	output endprogram;
	
	
	wire [15:0] A;           //common bus
	wire [15:0] alu_out;     //input to AC
	wire [3:0] select;
	wire [3:0] reg_select;
	wire [15:0] tp1_out, tp2_out, ac_out;
	wire [15:0] load_tp1, load_tp2, load_ac;
	wire z;
	wire [2:0] operation;
	wire inc_ac, inc_tp1, inc_tp2;
	wire reset_ac;
	wire tp1_select, tp2_select, ac_select; //controll signals to select buffer
	
	//TP registers
	increment_register_16bit TP1(.clk(clk), .load_enable(load_tp1), .inc(inc_tp1), .reset(reset), .data_in(A), .data_out(tp1_out));
	increment_register_16bit TP2(.clk(clk), .load_enable(load_tp2), .inc(inc_tp2), .reset(reset), .data_in(A), .data_out(tp2_out));
	
	//me inc_tp1, tp2 wage a wa active karawanne controller unit eken, a ka gahanna one api
	
	//AC register
	increment_register_16bit AC(.clk(clk), .load_enable(load_ac), .inc(inc_ac), .reset(reset_ac), .data_in(alu_out), .data_out(ac_out));
	
	//Buffers
	buffer TP1_buffer(.data_in(tp1_out), .select(tp1_select), .data_out(A));
	buffer TP2_buffer(.data_in(tp2_out), .select(tp2_select), .data_out(A));
	buffer AC_buffer(.data_in(ac_out), .select(ac_select), .data_out(A));
	
	
	//ALU
	ALU alu(.clk(clk), .in_1(ac_out), .in_2(A), .z(z), .operation(operation), .data_out(alu_out));  //alu eke inputs wenne B bus eka and ac_out eka
	
	//MUX
	//Mux mux(.select(select), .data_out(B), .tp1(tp1_out), .tp2(tp2_out));  //danata mux ekata input dekai dala tiyenne, registers gana anuwa wadi karaganna
	write_to_reg decoder(.reg_select(reg_select), .tp1(load_tp1), .tp2(load_tp2), .ac(load_ac));	
			
	//Implement Control unit and decoder (decoder eken thamai mona register ekatada alu operation eken passe liyanna one kiyala kiyanne)
	
	
endmodule