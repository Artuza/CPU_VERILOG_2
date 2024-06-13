module (
    input clk,
    input en,
    input we_IM,
    input [15:0] codein,
    input [11:0] immd,
    output reg za,
    output reg zb,
    output reg eq,
    output reg gt,
    output reg lt
);

// Señales internas
reg [31:0] execadd;
reg [15:0] dataAoutd, dataBoutd;
reg [31:0] outALUd, currdat, outDMd;
reg [11:0] curradd, addressd;
reg [3:0] opcodeD;

reg loadIRd, loadAd, loadBd, loadCd, moded, we_DMd, selAd, selBd, loadPCd, incPCd;
reg zad, zbd, eqd, gtd, ltd;

// Definir las señales de control para el banco de registros
reg [4:0] rdAddr1, rdAddr2, wrAddr; // Direcciones de lectura y escritura
reg wrEn; // Habilitador de escritura
reg [31:0] wrData; // Datos a escribir

// Lógica para el manejo del banco de registros
always @(*) begin
    rdAddr1 = opcodeD[7:3]; // Dirección de lectura 1 basada en los bits del opcode
    rdAddr2 = opcodeD[2:0]; // Dirección de lectura 2 basada en los bits del opcode
    wrAddr = addressd[7:3]; // Dirección de escritura basada en los bits de la dirección de la instrucción
    wrEn = we_DMd; // Habilitar escritura basada en la señal we_DMd
    wrData = dataCoutd; // Datos a escribir obtenidos de la memoria de datos
end

// Instanciar el banco de registros
regfile regfile_inst(
    .clk(clk),
    .rdAddr1(rdAddr1),
    .rdAddr2(rdAddr2),
    .wrAddr(wrAddr),
    .wrEn(wrEn),
    .wrData(wrData),
    .rdData1(dataAoutd),
    .rdData2(dataBoutd)
);

// Módulo de la ALU
ALU alu_inst(
    .a(dataAoutd),
    .b(dataBoutd),
    .opcode(opcodeD[2:0]),
    .mode(moded),
    .outALU(outALUd),
    .za(zad),
    .zb(zbd),
    .eq(eqd),
    .gt(gtd),
    .lt(ltd)
);

// Resto del código...
