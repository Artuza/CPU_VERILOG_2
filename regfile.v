module regfile(
    input clk,
    input [4:0] rdAddr1, rdAddr2, // Direcciones de lectura para los registros 1 y 2
    input [4:0] wrAddr,            // Dirección de escritura
    input wrEn,                    // Habilitador de escritura
    input [31:0] wrData,           // Datos a escribir
    output reg [31:0] rdData1,     // Datos leídos del registro 1
    output reg [31:0] rdData2      // Datos leídos del registro 2
);

reg [31:0] regfile[31:0]; // Definición del banco de registros de 32 bits

// Proceso de escritura en el banco de registros
always @(posedge clk) begin
    if (wrEn) begin
        regfile[wrAddr] <= wrData;
    end
end

// Proceso de lectura desde el banco de registros
always @(*) begin
    rdData1 = regfile[rdAddr1];
    rdData2 = regfile[rdAddr2];
end

endmodule
