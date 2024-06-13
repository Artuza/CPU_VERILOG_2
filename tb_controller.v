`timescale 1ns / 1ps

module tb_controller;

    // Definición de los puertos del testbench
    reg clk = 0;
    reg en = 0;
    reg [3:0] opcode = 4'b0000;
    reg za = 0, zb = 0, eq = 0, gt = 0, lt = 0;

    // Señales de salida del controller
    wire loadA, loadB, loadC, loadIR, loadPC, incPC, mode, we_DM, selA, selB;

    // Instanciación del módulo controller bajo prueba
    controller dut (
        .clk(clk),
        .en(en),
        .opcode(opcode),
        .za(za),
        .zb(zb),
        .eq(eq),
        .gt(gt),
        .lt(lt),
        .loadA(loadA),
        .loadB(loadB),
        .loadC(loadC),
        .loadIR(loadIR),
        .loadPC(loadPC),
        .incPC(incPC),
        .mode(mode),
        .we_DM(we_DM),
        .selA(selA),
        .selB(selB)
    );

    // Parámetros de simulación
    initial begin
        // Inicialización de señales
        clk = 0;
        en = 1; // Activar el controlador
        opcode = 4'b0000; // Ejemplo de opcode inicial

        // Esperar un ciclo de clock para estabilización
        #10;

        // Simulación de cambio de opcode y otras señales de entrada
        // Ejemplo 1: Carga de IR y PC
        opcode = 4'b0100;
        #10;

        // Ejemplo 2: Ejecución de operación ALU con opcode 000
        opcode = 4'b0000;
        #10;

        // Ejemplo 3: Ejecución de otra operación ALU con opcode 001
        opcode = 4'b0001;
        #10;

        // Puedes agregar más casos de prueba según tus requisitos

        // Finalizar simulación
        $finish;
    end

endmodule
