module logic_block(
    input BT_in,   
    input mux2_out,
	output [1:0] signal_out
);

    
	
	
    assign signal_out[1] = BT_in;
	assign signal_out[0]= ~BT_in && mux2_out;

endmodule

