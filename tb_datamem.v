`timescale 1ns / 1ps

module tb_datamem;

    // Definición de los puertos del testbench
    reg clk = 0;
    reg we_DM = 0;
    reg [31:0] dataDM;
    reg [31:0] addDM;
    wire [31:0] outDM;

    // Instanciación del módulo datamem bajo prueba
    datamem dut (
        .clk(clk),
        .we_DM(we_DM),
        .dataDM(dataDM),
        .addDM(addDM),
        .outDM(outDM)
    );

    // Parámetros de simulación
    initial begin
        // Inicialización de señales
        clk = 0;
        we_DM = 0;
        dataDM = 0;
        addDM = 0;

        // Esperar un ciclo de clock para estabilización
        #10;

        // Caso de prueba 1: Escribir en memoria
        we_DM = 1;
        dataDM = 32'hABCDEFFF; // Datos a escribir
        addDM = 8; // Dirección de memoria donde escribir
        #10;

        // Caso de prueba 2: Leer desde memoria
        we_DM = 0;
        addDM = 8; // Dirección de memoria desde donde leer
        #10;

        // Caso de prueba 3: Escribir en otra dirección
        we_DM = 1;
        dataDM = 32'h12345678; // Otros datos a escribir
        addDM = 16; // Otra dirección de memoria
        #10;

        // Caso de prueba 4: Leer desde la nueva dirección
        we_DM = 0;
        addDM = 16; // Nueva dirección de memoria desde donde leer
        #10;

        // Puedes agregar más casos de prueba según sea necesario

        // Finalizar simulación
        $finish;
    end

endmodule
