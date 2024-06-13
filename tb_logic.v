`timescale 1ns/1ns

module tb_logic;

    reg [31:0] a;
    reg [31:0] b;
    reg [2:0] opcode;
    wire [31:0] out;

    // Instancia del módulo logic
    logic uut (
        .a(a),
        .b(b),
        .opcode(opcode),
        .outlu(out)
    );

    initial begin
        // Inicialización de señales
        a = 32'h00000000;
        b = 32'h00000000;
        opcode = 3'b000;
        
        // Estímulos de prueba
        // Prueba de AND
        #10 a = 32'hFFFFFFFF; b = 32'h0F0F0F0F; opcode = 3'b000;
        
        // Prueba de OR
        #10 a = 32'hF0F0F0F0; b = 32'h0F0F0F0F; opcode = 3'b001;

        // Prueba de XOR
        #10 a = 32'hFF00FF00; b = 32'h00FF00FF; opcode = 3'b010;
        
        // Prueba de NOT
        #10 a = 32'hAAAAAAAA; opcode = 3'b011;

        // Finalización de la simulación
        #10 $finish;
    end
endmodule
