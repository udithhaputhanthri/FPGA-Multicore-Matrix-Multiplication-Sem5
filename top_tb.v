`timescale 1 ns/10 ps 
module top_tb;
    reg clk;
    reg START;
    reg RESET;
    wire END;
	 wire [15:0] DMEMBUS;
	 wire [15:0] IMEMBUS;
	 wire [15:0] DBUSMEM;
	 wire [48:0] OPs;
     wire [15:0] IR;
     wire [15:0] DR;
     wire [15:0] BUS;
     wire [15:0] AR;
     wire CLK_CONTROlUNIT;
     wire [15:0] PC;
     wire INCPC;
     wire LDDR;

     wire [15:0] N;
     wire [15:0] C;
     wire [15:0] IC;
     wire [15:0] IE;
     wire [15:0] I;
     wire [15:0] J;
     wire [15:0] TP1;
     wire [15:0] TP2;
     wire [15:0] TP3;
     wire [15:0] COUNT;
     wire [15:0] AC;
     wire [15:0] TR;
     wire [15:0] ALU;
	  wire Z;
	  wire END_INC;
     

     wire DREAD;
     wire  DWRITE;
     wire IREAD;

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;   
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    top top_module(
        .clk(clk),
        .START(START),
        .RESET(RESET),
        .END(END),
		  .dmem_disp(DMEMBUS),
		  .imem_disp(IMEMBUS),
		  .dmem_out_disp(DBUSMEM),
		  .ops_disp(OPs),
          .d_read_status(DREAD),
          .d_write_status(DWRITE),
        .i_read_status(IREAD),
        .ir_out_disp(IR),
        .dr_out_disp(DR),
        .bus_disp(BUS),
        .ar_disp(AR),
        .corrected_clk_disp(CLK_CONTROlUNIT),
        .pc_disp(PC),
        .inc_pc_disp(INCPC),
        .lddr_disp(LDDR),
        .n_disp(N),
        .c_disp(C),
        .ic_disp(IC),
        .ie_disp(IE),
        .i_disp(I),
        .j_disp(J),
        .tp1_disp(TP1),
        .tp2_disp(TP2),
        .tp3_disp(TP3),
        .count_disp(COUNT),
        .ac_disp(AC),
        .tr_disp(TR),
        .alu_disp(ALU),
		  .z_disp(Z),
		  .endinc_disp(END_INC)
    );


    initial begin
        #10 START = 1; RESET = 0;
        #10 START = 0; RESET = 0;
        
    end
	 
	 always @(negedge DWRITE)
		$display(DBUSMEM);



endmodule