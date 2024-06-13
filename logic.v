module logic(
    input [31:0] a,
    input [31:0] b,
    input [2:0] opcode,
    output reg [31:0] outlu,
    output reg za,
    output reg zb,
    output reg eq,
    output reg gt,
    output reg lt
);

// Operaciones lógicas basadas en el opcode
always @(*) begin
    case (opcode)
        // AND lógico
        3'b000: outlu = a & b;
        // OR lógico
        3'b001: outlu = a | b;
        // NOR lógico
        3'b010: outlu = ~(a | b);
        // NOT de a
        3'b100: outlu = ~a;
        // NOT de b
        3'b101: outlu = ~b;
        // XOR lógico
        3'b110: outlu = a ^ b;
        // XNOR lógico
        3'b111: outlu = ~(a ^ b);
        default: outlu = 32'h00000000;
    endcase
end

// Detectar si a o b son cero
always @(*) begin
    za = (a == 32'h00000000);
    zb = (b == 32'h00000000);
end

// Detectar igualdad, mayor que y menor que
always @(*) begin
    eq = (a == b);
    gt = (a > b);
    lt = (a < b);
end

endmodule
