`timescale 1 ns/10 ps 

module logic_block_tb;

    reg BT_in;   
    reg mux2_out;
	wire [1:0] signal_out;

    logic_block logic(.BT_in(BT_in), .mux2_out(mux2_out), .signal_out(signal_out));

    initial 
        begin
            #10 BT_in <= 0 ; mux2_out <= 0; 
            #10 BT_in <= 0 ; mux2_out <= 1;   
            #10 BT_in <= 1 ; mux2_out <= 0;  
        end
	
endmodule