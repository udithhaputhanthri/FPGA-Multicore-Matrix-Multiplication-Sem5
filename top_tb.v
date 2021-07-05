`timescale 1 ns/10 ps 
module top_tb;

    //For file reading and writing
	integer data_out; 
    integer data_file;
    integer scan_file;
    integer i;
    

    //regs used in reading file
    reg [15:0] captured_data;
    `define NULL 0 
    reg [15:0] mem_data;
	reg [15:0] current_addr = 16'd0;
    reg [15:0] dmem_size = 16'd1000;
    reg write_from_tb;

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

    wire [15:0] memory_in_addr;
     

     wire DREAD;
     wire  DWRITE;
     wire IREAD;
	  wire DWRITE_ALL;

    //Read Data mem to taking data
    reg [15:0] ar_out_start_addr;
    reg [15:0] end_addr = 16'd997;
    reg [1:0] addr_mux_select;

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

        .addr_mux_select(addr_mux_select),
        .ar_in(ar_out_start_addr),

        .current_addr(current_addr),
        .write_from_tb(write_from_tb),
        .mem_data(mem_data),

		  .dmem_disp(DBUSMEM),  
		  .imem_disp(IMEMBUS),
		  .dmem_out_disp(DMEMBUS),
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
		  .endinc_disp(END_INC),
          .memory_in_addr(memory_in_addr),
			 .d_write_status_all(DWRITE_ALL)
    );


    initial begin

       // Reading input data and storing in Data Memory
       data_file = $fopen("../../../io_txt_files/data_to_mem.txt", "r");

       if (data_file == `NULL) begin
           $display("data_file handle was NULL");
           $finish;
       end  
		  
       #10 addr_mux_select <= 1;

       for (current_addr = 0; current_addr < dmem_size+1; current_addr = current_addr+1 ) begin
           @(posedge clk) begin

           scan_file = $fscanf(data_file, "%d\n", captured_data); 
               
               if (!$feof(data_file)) begin
                   #10  mem_data <= captured_data; 
                   #5 write_from_tb <=1; 
                   #20 write_from_tb <= 0;// current_addr <= current_addr + 16'd1;
                   $display(mem_data);
                   //use captured_data as you would any other wire or reg value;
               end
           end
           
       end

       $fclose(data_file);

       

        write_from_tb = 0; addr_mux_select <= 0;


        //need to make write_from_tb = 0

        //Core operation
        #200000 START = 1; RESET = 0; addr_mux_select = 0;
        #10 START = 0; RESET = 0; addr_mux_select = 0;
		  
		  
		// Writing output matrix to text
        while (END!=1) #100;
        data_out = $fopen("../../../io_txt_files/results_from_mem.txt","w");
        #10 ar_out_start_addr=16'd0; 
        #10 addr_mux_select <= 2; 

        while(ar_out_start_addr < end_addr) 
            begin 
                #50 $fwrite(data_out,"%d\n",DMEMBUS);
                #50 ar_out_start_addr <= ar_out_start_addr + 16'd1;  //check AR
            end

        #20;
        $fclose(data_out);
        #20;
        $stop;
        
    end
	 
	always @(posedge DWRITE)
		$display(DR);



endmodule