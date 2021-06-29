module core #(parameter core_id = 0) (
    input clk,  //Corrected clock
    input START, 
    input RESET, 
    //data path
    input [15:0] dmem_in, imem_in,
    output [15:0] dmem_out,
    output [15:0] ar_out,  //arout shoudl be connected to both D mem and I mem as an input
    //output control_signals
    output read_MD, read_MI, write_MD,
    output end_i,

    //added for testing
    output [48:0] micro_ops,
    output [15:0] ir_out_disp,
    output [15:0] dr_out_disp,
    output [15:0] bus_disp,
    output [15:0] ar_disp,
    output corrected_clk_disp,
    output [15:0] pc_disp,
    output inc_pc_disp,
    output lddr_disp,
    output [15:0]n_disp,
    output [15:0]c_disp,
    output [15:0]ic_disp,
    output [15:0]ie_disp,
    output [15:0]i_disp,
    output [15:0]j_disp,
    output [15:0]tp1_disp,
    output [15:0]tp2_disp,
    output [15:0]tp3_disp,
    output [15:0]count_disp, 
	 output ldn_disp,
     output [15:0] ac_disp,
     output [15:0] tr_disp,
     output [15:0] alu_disp,
	  output z_disp,
	  output endinc_disp
);
// wire [15:0] test_out_1;
// wire [15:0] test_out_2;
// wire [15:0] test_out_3;
wire corrected_clk;
clock_corrector_new clock_corrector(.start(START), .clk(clk), .end_signal(end_i), .corrected_clk(corrected_clk));


//buffer MEMBUSD_buf(.data_in(test_out_1), .select(MEMBUSD), .data_out(bus));
//buffer BUSMEMD_buf(.data_in(bus), .select(BUSMEM), .data_out(test_out_2));
//buffer MEMBUSI_buf(.data_in(test_out_3), .select(MEMBUSI), .data_out(bus));



// #(parameter core_id=1)
//Bus
wire [15:0] bus;
wire [15:0] ac_out;
wire [15:0] alu_out;

//Intermediate Control signals
wire DREAD, IREAD, DWRITE, BUSMEM, MEMBUSD, MEMBUSI, TRBUS, DRBUS,  PCBUS, NBUS,  CBUS, JBUS;
wire IDBUS, COUNTBUS,  TP1BUS, TP2BUS, TP3BUS, ICBUS, IBUS, IEBUS, TR2BUS, ACBUS, LDAR;
wire LDTR, LDDR, LDPC, LDN, LDC, LDIR, LDTP1, LDTP2, LDTP3, LDIC, LDI, LDIE, LDTR2; 
wire LDAC, RSTAR, RSTTR, RSTDR, RSTPC, RSTN, RSTC, RSTIR, RSTJ, RSTID, RSTCOUNT, RSTTP1;
wire RSTTP2, RSTTP3, RSTIC, RSTI, RSTIE, RSTTR2, RSTAC, RSTEND, INCPC, INCJ, INCCOUNT;
wire INCTP1, INCTP2, INCI, INCAC, INCEND, ALU0, ALU1, ALU2, ADDKAC;

//Memory read write outputs from the Core
//IR constaines the numbers o,1,2,3.. as per the order in our assembly code
 assign read_MD = DREAD;
 assign read_MI = IREAD;
 assign write_MD = DWRITE;



buffer MEMBUSD_buf(.data_in(dmem_in), .select(MEMBUSD), .data_out(bus));
buffer BUSMEMD_buf(.data_in(bus), .select(BUSMEM), .data_out(dmem_out));
buffer MEMBUSI_buf(.data_in(imem_in), .select(MEMBUSI), .data_out(bus));

//Initialise registers mentioned in excel


//Modules
reg_rst_load AR(.clk(clk), .reset(RSTAR), .load_enable(LDAR), .data_in(bus), .data_out(ar_out));

wire [15:0] tr_out;
reg_rst_load TR(.clk(clk), .reset(RSTTR), .load_enable(LDTR), .data_in(bus), .data_out(tr_out));
buffer TR_buf(.data_in(tr_out), .select(TRBUS), .data_out(bus));

wire [15:0] dr_out;
reg_rst_load DR(.clk(clk), .reset(RSTDR), .load_enable(LDDR), .data_in(bus), .data_out(dr_out));
buffer DR_buf(.data_in(dr_out), .select(DRBUS), .data_out(bus));

wire [15:0] pc_out;
reg_pc PC(.clk(clk), .reset(RSTPC), .load_enable(LDPC), .inc(INCPC), .data_in(dr_out), .data_out(pc_out));
buffer PC_buf(.data_in(pc_out), .select(PCBUS), .data_out(bus));

wire [15:0] n_out;
reg_rst_load N(.clk(clk), .reset(RSTN), .load_enable(LDN), .data_in(dr_out), .data_out(n_out));
buffer N_buf(.data_in(n_out), .select(NBUS), .data_out(bus));

wire [15:0] c_out;
reg_rst_load C(.clk(clk), .reset(RSTC), .load_enable(LDC), .data_in(dr_out), .data_out(c_out));
buffer C_buf(.data_in(c_out), .select(CBUS), .data_out(bus));

wire [15:0] ir_out;
reg_rst_load IR(.clk(clk), .reset(RSTIR), .load_enable(LDIR), .data_in(dr_out), .data_out(ir_out)); //now bus will get this value insted of high impendence

wire [15:0] j_out;
reg_rst_inc J(.clk(clk), .reset(RSTJ), .inc(INCJ), .data_out(j_out));
buffer J_buf(.data_in(j_out), .select(JBUS), .data_out(bus));



//Core ID module  
wire [15:0] id_out;
//wire [15:0] core_id_reg;
//assign core_id_reg = core_id ; 
reg_rst_load ID(.clk(clk), .reset(RSTID), .load_enable(1), .data_in(core_id), .data_out(id_out));
buffer ID_buf(.data_in(id_out), .select(IDBUS), .data_out(bus));


wire [15:0] count_out;
reg_rst_inc COUNT(.clk(clk), .reset(RSTCOUNT), .inc(INCCOUNT), .data_out(count_out));
buffer COUNT_buf(.data_in(count_out), .select(COUNTBUS), .data_out(bus));


wire [15:0] tp1_out;
reg_rst_load_inc TP1(.clk(clk), .reset(RSTTP1), .load_enable(LDTP1), .inc(INCTP1), .data_in(ac_out), .data_out(tp1_out));
buffer TP1_buf(.data_in(tp1_out), .select(TP1BUS), .data_out(bus));

wire [15:0] tp2_out;
reg_rst_load_inc TP2(.clk(clk), .reset(RSTTP2), .load_enable(LDTP2), .inc(INCTP2), .data_in(ac_out), .data_out(tp2_out));
buffer TP2_buf(.data_in(tp2_out), .select(TP2BUS), .data_out(bus));

wire [15:0] tp3_out;
reg_rst_load TP3(.clk(clk), .reset(RSTTP3), .load_enable(LDTP3), .data_in(ac_out), .data_out(tp3_out));
buffer TP3_buf(.data_in(tp3_out), .select(TP3BUS), .data_out(bus));

wire [15:0] ic_out;
reg_rst_load IC(.clk(clk), .reset(RSTIC), .load_enable(LDIC), .data_in(ac_out), .data_out(ic_out));
buffer IC_buf(.data_in(ic_out), .select(ICBUS), .data_out(bus));

wire [15:0] i_out;
reg_rst_load_inc I(.clk(clk), .reset(RSTI), .load_enable(LDI), .inc(INCI), .data_in(ac_out), .data_out(i_out));
buffer I_buf(.data_in(i_out), .select(IBUS), .data_out(bus));

wire [15:0] ie_out;
reg_rst_load IE(.clk(clk), .reset(RSTIE), .load_enable(LDIE), .data_in(ac_out), .data_out(ie_out));
buffer IE_buf(.data_in(ie_out), .select(IEBUS), .data_out(bus));

wire [15:0] tr2_out;
reg_rst_load TR2(.clk(clk), .reset(RSTTR2), .load_enable(LDTR2), .data_in(ac_out), .data_out(tr2_out));
buffer TR2_buf(.data_in(tr2_out), .select(TR2BUS), .data_out(bus));



reg_ac AC( .clk(clk), .inc(INCAC), .inck(ADDKAC), .load_enable(LDAC), .reset(RSTAC), .data_in(alu_out), .data_out(ac_out) ); 
//Note : If we have to take k from data memory we have to take it as an input to this register
buffer AC_buf(.data_in(ac_out), .select(ACBUS), .data_out(bus));


//check this

wire [2:0] operation;
assign operation[0] = ALU0;
assign operation[1] = ALU1;
assign operation[2] = ALU2;

alu ALU(.in_bus(bus), .in_AC(ac_out), .operation(operation), .data_out(alu_out));

// z login
//reg z;
//always @(alu_out)
//    begin
//        if (! alu_out)
//            z <= 1;
//                
//       else
//            z <= 0;
        
//    end

wire z;
assign z= ~(ac_out[0]||ac_out[1]||ac_out[2]||ac_out[3]||ac_out[4]||ac_out[5]||ac_out[6]||ac_out[7]||ac_out[8]||ac_out[9]||ac_out[10]||ac_out[11]||ac_out[12]||ac_out[13]||ac_out[14]||ac_out[15]); 

    

//Controller
wire [48:0] OPs;
controller controller(.clk(corrected_clk), .IR(ir_out), .z(z), .OPs(OPs));

ops_decoder decoder(.uOPs(OPs), .START(START), .RESET(RESET), 
.DREAD(DREAD), .IREAD(IREAD), .DWRITE(DWRITE), .BUSMEM(BUSMEM), .MEMBUSD(MEMBUSD), .MEMBUSI(MEMBUSI), .TRBUS(TRBUS), .DRBUS(DRBUS),  .PCBUS(PCBUS), .NBUS(NBUS),  .CBUS(CBUS), .JBUS(JBUS), 
.IDBUS(IDBUS), .COUNTBUS(COUNTBUS),  .TP1BUS(TP1BUS), .TP2BUS(TP2BUS), .TP3BUS(TP3BUS), .ICBUS(ICBUS), .IBUS(IBUS), .IEBUS(IEBUS), .TR2BUS(TR2BUS), .ACBUS(ACBUS), .LDAR(LDAR), 
.LDTR(LDTR), .LDDR(LDDR), .LDPC(LDPC), .LDN(LDN), .LDC(LDC), .LDIR(LDIR), .LDTP1(LDTP1), .LDTP2(LDTP2), .LDTP3(LDTP3), .LDIC(LDIC), .LDI(LDI), .LDIE(LDIE), .LDTR2(LDTR2), 
.LDAC(LDAC), .RSTAR(RSTAR), .RSTTR(RSTTR), .RSTDR(RSTDR), .RSTPC(RSTPC), .RSTN(RSTN), .RSTC(RSTC), .RSTIR(RSTIR), .RSTJ(RSTJ), .RSTID(RSTID), .RSTCOUNT(RSTCOUNT), .RSTTP1(RSTTP1), 
.RSTTP2(RSTTP2), .RSTTP3(RSTTP3), .RSTIC(RSTIC), .RSTI(RSTI), .RSTIE(RSTIE), .RSTTR2(RSTTR2), .RSTAC(RSTAC), .RSTEND(RSTEND), .INCPC(INCPC), .INCJ(INCJ), .INCCOUNT(INCCOUNT), 
.INCTP1(INCTP1), .INCTP2(INCTP2), .INCI(INCI), .INCAC(INCAC), .INCEND(INCEND), .ALU0(ALU0), .ALU1(ALU1), .ALU2(ALU2), .ADDKAC(ADDKAC)
);


// wire [15:0] end_out;
//check whether the end_out has got value = 1 after the process
reg_rst_inc END(.clk(clk), .reset(RSTEND), .inc(INCEND), .data_out(end_i));

//assign LED_wire = end_out[0];


//added for testing purposes
assign micro_ops = OPs;
assign ir_out_disp = ir_out;
assign dr_out_disp = dr_out;
assign bus_disp = bus;
assign ar_disp = ar_out;
assign pc_disp = pc_out;
assign inc_pc_disp = INCPC;
assign lddr_disp = LDDR;
assign n_disp = n_out;
assign c_disp = c_out;
assign ic_disp = ic_out;
assign ie_disp = ie_out;
assign i_disp = i_out;
assign j_disp = j_out;
assign tp1_disp =  tp1_out;
assign tp2_disp = tp2_out;
assign tp3_disp = tp3_out;
assign count_disp = count_out;
assign ldn_disp = LDN;
assign ac_disp = ac_out;
assign tr_disp = tr_out;
assign alu_disp = alu_out;
assign corrected_clk_disp = corrected_clk;
assign z_disp= z;
assign endinc_disp= INCEND;

endmodule