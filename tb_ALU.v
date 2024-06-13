`timescale 1ns/1ns

module tb_ALU;

    reg [31:0] a;
    reg [31:0] b;
    reg [2:0] opcode;
    reg mode;
    wire [63:0] outALU;
    wire za, zb, eq, gt, lt;

    // Instancia del módulo ALU
    ALU uut (
        .a(a),
        .b(b),
        .opcode(opcode),
        .mode(mode),
        .outALU(outALU),
        .za(za),
        .zb(zb),
        .eq(eq),
        .gt(gt),
        .lt(lt)
    );

    initial begin
        // Inicialización de señales
        a = 32'h00000000;
        b = 32'h00000000;
        opcode = 3'b000;
        mode = 1'b0;
        
        // Estímulos de prueba para operaciones aritméticas
        // Prueba de suma
        #10 a = 32'h00000005; b = 32'h00000003; opcode = 3'b000; mode = 1'b0;

        // Prueba de multiplicación
        #10 a = 32'h00000002; b = 32'h00000004; opcode = 3'b001; mode = 1'b0;

        // Prueba de resta (a > b)
        #10 a = 32'h00000007; b = 32'h00000002; opcode = 3'b010; mode = 1'b0;

        // Prueba de resta (a < b)
        #10 a = 32'h00000002; b = 32'h00000007; opcode = 3'b010; mode = 1'b0;

        // Prueba de división (a > b)
        #10 a = 32'h00000008; b = 32'h00000002; opcode = 3'b011; mode = 1'b0;

        // Prueba de división (a < b)
        #10 a = 32'h00000002; b = 32'h00000008; opcode = 3'b011; mode = 1'b0;

        // Prueba de división por cero
        #10 a = 32'h00000008; b = 32'h00000000; opcode = 3'b011; mode = 1'b0;

        // Estímulos de prueba para operaciones lógicas
        // Prueba de AND
        #10 a = 32'hFFFFFFFF; b = 32'h0000FFFF; opcode = 3'b000; mode = 1'b1;

        // Prueba de OR
        #10 a = 32'h0F0F0F0F; b = 32'hF0F0F0F0; opcode = 3'b001; mode = 1'b1;

        // Prueba de XOR
        #10 a = 32'hAAAAAAAA; b = 32'h55555555; opcode = 3'b010; mode = 1'b1;

        // Prueba de NOT
        #10 a = 32'hFFFFFFFF; b = 32'h00000000; opcode = 3'b011; mode = 1'b1;

        // Prueba de comparación (igual)
        #10 a = 32'h00000005; b = 32'h00000005; opcode = 3'b100; mode = 1'b1;

        // Prueba de comparación (mayor)
        #10 a = 32'h00000007; b = 32'h00000005; opcode = 3'b101; mode = 1'b1;

        // Prueba de comparación (menor)
        #10 a = 32'h00000003; b = 32'h00000005; opcode = 3'b110; mode = 1'b1;

        // Finalización de la simulación
        #10 $finish;
    end
endmodule
