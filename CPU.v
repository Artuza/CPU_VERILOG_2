module CPU(
    input clk,
    input en,
    input we_IM,
    input [31:0] codein,
    input [11:0] immd,
    output za,
    output zb,
    output eq,
    output gt,
    output lt
);

// Declare internal signals
wire [4:0] read_addressA;
wire [4:0] read_addressB;
wire [11:0] curradd;
wire [31:0] outIMd;
wire [11:0] addressd;
wire [3:0] opcodeD;
wire loadIRd, loadAd, loadBd, loadCd, moded, we_DMd, selAd, selBd, loadPCd, incPCd;
wire [31:0] dataAoutd;
wire [31:0] dataBoutd;
wire [31:0] outALUd;
wire [31:0] currdat;
wire [31:0] outDMd;
wire zad, zbd, eqd, gtd, ltd;

// Instantiate components
instmem a1 (.clk(clk), .we_IM(we_IM), .dataIM(codein), .addIM(curradd), .outIM(outIMd));

insReg a2 (
    .clk(clk), 
    .loadIR(loadIRd), 
    .insin(outIMd), 
    .address(addressd), 
    .opcode(opcodeD)
);



controller a3 (
    .clk(clk), 
    .en(en), 
    .opcode(opcodeD), 
    .za(zad), 
    .zb(zbd), 
    .eq(eqd), 
    .gt(gtd), 
    .lt(ltd), 
    .loadA(loadAd), 
    .loadB(loadBd), 
    .loadC(loadCd),  // Salida loadC del módulo controller
    .loadIR(loadIRd), 
    .loadPC(loadPCd), 
    .incPC(incPCd), 
    .mode(moded), 
    .we_DM(we_DMd), 
    .selA(selAd), 
    .selB(selBd)
);


PC a4 (.clk(clk), .loadPC(loadPCd), .incPC(incPCd), .address(addressd), .execadd(execaddd));


muxB a5 (.clk(clk), .in1(execaddd), .in2(immd), .sel(selBd), .outB(curradd));

register_bank reg_bank (
    .clk(clk), 
    .write_address(addressd), 
    .write_data(dataBoutd), 
    .read_addressA(read_addressA), 
    .read_addressB(read_addressB), 
    .write_enableA(loadAd), 
    .write_enableB(loadBd), 
    .write_enableC(loadCd),  // Conectar la salida loadC del módulo controller a la entrada write_enableC del módulo register_bank
    .write_dataC(currdat),  // Conectar la salida outA del módulo muxA a la entrada write_dataC del módulo register_bank
    .read_dataA(dataAoutd),  
    .read_dataB(dataBoutd)   
);

datamem a9 (
    .clk(clk), 
    .we_DM(we_DMd), 
    .dataDM(dataCoutd),  // Usar el valor que se carga en el registro C como los datos de entrada para el módulo datamem
    .addDM(addressd), 
    .outDM(outDMd)
);

assign read_addressA = outDMd[4:0];  // Usar los 5 bits inferiores de outDM como dirección de lectura A
assign read_addressB = outDMd[9:5];  // Usar los siguientes 5 bits de outDM como dirección de lectura B

muxA b1 (
    .clk(clk), 
    .in1(addressd),  // Conectar la salida address del banco de instrucciones a la entrada in1 del muxA
    .in2(outALUd), 
    .sel(selAd), 
    .outA(currdat)
);


ALU b2 (.a(dataAoutd), .b(dataBoutd), .opcode(opcodeD[2:0]), .mode(moded), .outALU(outALUd), .za(zad), .zb(zbd), .eq(eqd), .gt(gtd), .lt(ltd));
// Output assignments
assign za = zad;
assign zb = zbd;
assign eq = eqd;
assign gt = gtd;
assign lt = ltd;




endmodule
