`timescale 1 ns/10 ps 

module ops_decoder_tb;

    reg [48:0] OPs;
    reg START, RESET;
	wire DREAD,IREAD,DWRITE,BUSMEM,MEMBUSI;

    ops_decoder decoder(
        .uOPs(OPs), 
        .START(START), 
        .RESET(RESET), 
        .DREAD(DREAD), 
        .IREAD(IREAD), 
        .DWRITE(DWRITE), 
        .BUSMEM(BUSMEM), 
        .MEMBUSI(MEMBUSI) 
    );

    initial 
        begin
            #10 OPs <= 0;
            #10 OPs <= 1;
            #10 OPs <= 2;
            #10 OPs <= 2678;  
        end
	
endmodule