`timescale 1ns / 1ps

module tb_instmem;

    // Definición de los puertos del testbench
    reg clk;
    reg we_IM;
    reg [15:0] dataIM;
    reg [11:0] addIM;
    wire [15:0] outIM;

    // Instanciación del módulo instmem bajo prueba
    instmem dut (
        .clk(clk),
        .we_IM(we_IM),
        .dataIM(dataIM),
        .addIM(addIM),
        .outIM(outIM)
    );

    // Parámetros de simulación
    initial begin
        // Inicialización de señales
        clk = 0;
        we_IM = 0;
        dataIM = 16'h0000;
        addIM = 12'h000;

        // Primer ciclo de clock para estabilización
        #5;

        // Caso 1: Escribir en la memoria
        we_IM = 1;
        dataIM = 16'h1234; // Datos de ejemplo a escribir
        addIM = 12'h002;   // Dirección de memoria a escribir
        #10; // Esperar unos ciclos de clock
        
        // Caso 2: Leer desde la memoria
        we_IM = 0;
        addIM = 12'h002;   // Dirección de memoria a leer
        #10; // Esperar unos ciclos de clock

        // Caso 3: Otra operación de escritura
        we_IM = 1;
        dataIM = 16'hABCD; // Nuevos datos a escribir
        addIM = 12'h00A;   // Nueva dirección de memoria
        #10; // Esperar unos ciclos de clock

        // Finalizar simulación
        $finish;
    end

endmodule
