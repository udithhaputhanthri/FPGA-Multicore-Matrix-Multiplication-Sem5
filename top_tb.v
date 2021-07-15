`timescale 1 ns/10 ps 
module top_tb;

    //For file reading and writing
	integer data_out; 
    integer data_file;
    integer scan_file;
    integer i;
    

    //Registers used for reading an external file
    reg [15:0] captured_data;
    `define NULL 0 
    reg [15:0] mem_data;
	reg [15:0] current_addr = 16'd0;

    reg [15:0] dmem_size = 16'd1000;
    reg write_from_tb;

    //Ports for Top module
    reg clk;
    reg START;
    reg RESET;
    wire END;
	wire [15:0] DMEMBUS;

    //Used to take data out from data memory
    reg [15:0] ar_out_start_addr;
    reg [15:0] end_addr = 16'd997;
    reg [1:0] addr_mux_select;

    //Initiating the clock
    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;   
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    //Initiating the TOP module
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
		.dmem_out_disp(DMEMBUS)
    );

    //Used to calculate time for matrix multiplication
    realtime capture = 0.0;

    initial begin

        // Opening the file that contains matrix data
        data_file = $fopen("../../../io_txt_files/data_to_mem.txt", "r");

        if (data_file == `NULL) begin
            $display("data_file handle was NULL");
            $finish;
        end

        //Commanding the data memory to use the address provided by testbench
        #10 addr_mux_select <= 1;

        for (current_addr = 0; current_addr < dmem_size+1; current_addr = current_addr+1 ) begin
            @(posedge clk) begin

            scan_file = $fscanf(data_file, "%d\n", captured_data); 
                
                if (!$feof(data_file)) begin
                    #10     mem_data <= captured_data; 
                    #5      write_from_tb <=1; 
                    #20     write_from_tb <= 0;
                    $display(mem_data);
                end
            end
            
        end

        $fclose(data_file);

        $display("Reading data - completed!");

        //Commanding the data memory to use the addresses and data provided by the internal cores
        #10 write_from_tb = 0; addr_mux_select <= 0;
        

        //Starting Core operations
        #200 
        capture = $realtime;

        //Issuing start signal to start the cores
        RESET=1; #20 RESET = 0; #20
        START = 1; RESET = 0; addr_mux_select = 0;
        #10 START = 0; RESET = 0; addr_mux_select = 0;

		//Waiting untill all core operations are completed
        while (END!=1) #10; 

        $display("Time for multiplication (us): %t", ($realtime - capture)/1000000);

        // Opening a file to write the results
        data_out = $fopen("../../../io_txt_files/results_from_mem.txt","w");
		$display("File Opened - results_from_mem.txt");

        //Point the AR to the starting location of data memory
        #10 ar_out_start_addr=16'd0; 
        #10  addr_mux_select <= 2; 

        //Writing data from data memory to file line by line
        while( ar_out_start_addr < end_addr) begin
                @(posedge clk);
                    #50 $fwrite(data_out,"%d\n",DMEMBUS);
                    #50 ar_out_start_addr <= ar_out_start_addr + 16'd1;  //check AR
                    #10;
            end
            
        $display("Writing Results - completed!");

        #20;
        $fclose(data_out);

        #20;
        $stop;
    end



endmodule