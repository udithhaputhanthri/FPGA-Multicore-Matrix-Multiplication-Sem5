module logic_block(BT_in, mux2_out, signal_out);

    input BT_in;   
    input mux2_out;
	output [1:0] signal_out;
	
	
    assign signal_out[1] = BT_in;
	assign signal_out[0]= ~BT_in && mux2_out;//addr_sel2;

endmodule

//module logic_block(BT_in, mux2_out, s0, s1);
//
//    input BT_in;   
//    input mux2_out;
//	output s0;
//	output s1;
//	
//	
//    assign s1 = BT_in;
//	assign s0= ~BT_in && mux2_out;//addr_sel2;
//
//endmodule