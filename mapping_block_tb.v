`timescale 1 ns/10 ps 

module mapping_block_tb;

    reg [15:0] IR;
    wire [15:0] map_addr;

    mapping_block map_function(
        .IR(IR),
        .map_addr(map_addr)
    );

    initial begin
        #10 IR = 0;
        #10 IR = 1;
        #10 IR = 2;
        #10 IR = 3;
        #10 IR = 4;
        #10 IR = 5;
        #10 IR = 6;
        #10 IR = 7;
        #10 IR = 8;
        #10 IR = 9;
        #10 IR = 10;
        #10 IR = 11;
        #10 IR = 12;
        #10 IR = 13;
        #10 IR = 14;
        #10 IR = 15;
        #10 IR = 16;
        #10 IR = 17;
        #10 IR = 18;
        #10 IR = 19;
        #10 IR = 20;
        #10 IR = 21;
        #10 IR = 22;
        #10 IR = 23;
        #10 IR = 24;
        #10 IR = 25;
        #10 IR = 26;
        #10 IR = 27;
        #10 IR = 28;
    end

endmodule