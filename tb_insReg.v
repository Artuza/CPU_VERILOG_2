`timescale 1ns / 1ps

module tb_insReg;

    // Definición de los puertos del testbench
    reg clk;
    reg loadIR;
    reg [15:0] insin;
    wire [11:0] address;
    wire [3:0] opcode;

    // Instanciación del módulo insReg bajo prueba
    insReg dut (
        .clk(clk),
        .loadIR(loadIR),
        .insin(insin),
        .address(address),
        .opcode(opcode)
    );

    // Parámetros de simulación
    initial begin
        // Inicialización de señales
        clk = 0;
        loadIR = 0;
        insin = 16'h0000;

        // Primer ciclo de clock para estabilización
        #5;

        // Caso 1: Cargar una instrucción
        loadIR = 1;
        insin = 16'h1234; // Ejemplo de una instrucción
        #10; // Esperar unos ciclos de clock
        
        // Caso 2: No cargar y verificar salida
        loadIR = 0;
        #5;

        // Caso 3: Cambio de instrucción
        loadIR = 1;
        insin = 16'hABCD; // Nueva instrucción
        #10; // Esperar unos ciclos de clock

        // Caso 4: Incremento de reloj
        clk = 1;
        #5;
        clk = 0;
        #5;

        // Finalizar simulación
        $finish;
    end

endmodule
