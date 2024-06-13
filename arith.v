module arith(
    input [31:0] a,
    input [31:0] b,
    input [2:0] opcode,
    output reg [31:0] outau
);

// Operaciones aritméticas basadas en el opcode
always @(*) begin
    case (opcode)
        // Suma
        3'b000: outau = a + b;
        // Multiplicación
        3'b001: outau = a * b;
        // Resta (con manejo de desbordamiento)
        3'b010: if (a > b) outau = a - b;
                else outau = b - a;
        // División (con manejo de división por cero)
        3'b011: if (b != 0) begin
                    if (a > b) outau = a / b;
                    else outau = b / a;
                end
                else outau = 32'h80000000; // Valor de error para división por cero
        default: outau = 32'h00000000; // Valor predeterminado
    endcase
end

endmodule
