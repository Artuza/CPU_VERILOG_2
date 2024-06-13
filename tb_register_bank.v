`timescale 1ns / 1ps

module tb_register_bank;

    // Definición de los puertos del testbench
    reg clk = 0;
    reg [4:0] write_address;
    reg [31:0] write_data;
    reg [4:0] read_addressA;
    reg [4:0] read_addressB;
    reg write_enable;
    reg write_enableA;
    reg write_enableB;
    reg write_enableC;
    reg [31:0] write_dataC;
    wire [31:0] read_dataA;
    wire [31:0] read_dataB;

    // Instanciación del módulo register_bank bajo prueba
    register_bank dut (
        .clk(clk),
        .write_address(write_address),
        .write_data(write_data),
        .read_addressA(read_addressA),
        .read_addressB(read_addressB),
        .write_enable(write_enable),
        .write_enableA(write_enableA),
        .write_enableB(write_enableB),
        .write_enableC(write_enableC),
        .write_dataC(write_dataC),
        .read_dataA(read_dataA),
        .read_dataB(read_dataB)
    );

    // Parámetros de simulación
    initial begin
        // Inicialización de señales
        clk = 0;
        write_address = 0;
        write_data = 0;
        read_addressA = 0;
        read_addressB = 0;
        write_enable = 0;
        write_enableA = 0;
        write_enableB = 0;
        write_enableC = 0;
        write_dataC = 0;

        // Ciclo de clock
        #10;

        // Caso de prueba 1: Escribir en un registro específico
        write_enable = 1;
        write_address = 5;
        write_data = 32'h12345678;
        #10;

        // Caso de prueba 2: Leer desde los registros A y B
        read_addressA = 5;
        read_addressB = 0;
        #10;

        // Caso de prueba 3: Escribir en registros A, B y C
        write_enableA = 1;
        write_data = 32'hABCDEF01; // Se escribe en el registro A
        #10;
        write_enableB = 1;
        write_data = 32'h87654321; // Se escribe en el registro B
        #10;
        write_enableC = 1;
        write_dataC = 32'h55555555; // Se escribe en el registro C
        #10;

        // Caso de prueba 4: Leer desde el registro C
        read_addressA = 2; // Se lee desde el registro C
        #10;

        // Puedes agregar más casos de prueba según sea necesario

        // Finalizar simulación
        $finish;
    end

endmodule
