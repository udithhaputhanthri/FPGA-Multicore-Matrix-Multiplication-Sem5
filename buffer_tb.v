`timescale 1 ns/10 ps 

module buffer_tb;

    reg [15:0] data_in;
    reg select;
    wire [15:0] data_out;

    buffer tri_state_buffer(
        .data_in(data_in),
        .select(select),
        .data_out(data_out)
    );

    initial begin
        #10 data_in = 0; select = 0;
        #10 data_in = 1; select = 0;
        #10 data_in = 0; select = 1;
        #10 data_in = 1; select = 1;
    end

endmodule