//Not finished

module dmem_mux(
	input [15:0] in_core,
	input [15:0] in_d_write,
    input [15:0] in_d_read,
    input [1:0] addr_mux_select,

	output reg [15:0] mux_out
	);

    // initial reg_in = 16'd1;
	
	always @(in_core or in_d_write or in_d_read or addr_mux_select)
        begin
            case(addr_mux_select)  //first need to give select..after writing the data, this 
                                    //shoudl output the value of core output
            
                    0:mux_out    <=   in_core;
                    1:mux_out    <=   in_d_write;
                    2:mux_out    <=   in_d_read;
                default: mux_out <=   in_core;
                
            endcase
        end
				  
endmodule