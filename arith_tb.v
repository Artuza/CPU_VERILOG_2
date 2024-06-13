`timescale 1ns/1ns  // Definición de la escala de tiempo para simulación

module arith_tb;

    // Parámetros de la prueba
    reg [31:0] a, b;
    reg [2:0] opcode;
    wire [31:0] outau;

    // Instancia del módulo arith
    arith uut (
        .a(a),
        .b(b),
        .opcode(opcode),
        .outau(outau)
    );

    // Inicialización de la simulación
    initial begin
        // Inicialización de valores
        a = 10;
        b = 5;
        
        // Test 1: Suma (opcode = 3'b000)
        opcode = 3'b000;
        #10;  // Espera 10 unidades de tiempo para estabilización
        $display("Resultado de suma: %d", outau);
        
        // Test 2: Multiplicación (opcode = 3'b001)
        opcode = 3'b001;
        #10;
        $display("Resultado de multiplicación: %d", outau);
        
        // Test 3: Resta (opcode = 3'b010)
        opcode = 3'b010;
        #10;
        $display("Resultado de resta: %d", outau);
        
        // Test 4: División (opcode = 3'b011)
        opcode = 3'b011;
        #10;
        $display("Resultado de división: %d", outau);
        
        // Otros casos de prueba según necesidad

        // Finalización de la simulación
        $finish;
    end

endmodule
