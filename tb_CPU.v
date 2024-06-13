`timescale 1ns / 1ps

module tb_CPU();
    reg clk;
    reg en;
    reg we_IM;
    reg [31:0] codein;
    reg [11:0] immd;
    wire za;
    wire zb;
    wire eq;
    wire gt;
    wire lt;

    // Instanciación del módulo CPU
    CPU C1 (
        .clk(clk),
        .en(en),
        .we_IM(we_IM),
        .codein(codein),
        .immd(immd),
        .za(za),
        .zb(zb),
        .eq(eq),
        .gt(gt),
        .lt(lt)
    );

    // Inicialización de señales
    initial begin
        clk = 0;
        en = 0;
        we_IM = 0;
        codein = 32'h00000000;
        immd = 12'h000;
    end

    // Generación de reloj
    always #5 clk = ~clk;

    // Estímulos de entrada
    initial begin
        #10 en = 1;  // Habilitar el CPU
        
        // Escribir en la memoria de instrucciones
        #15 we_IM = 1;
        codein = 32'h6001;  // Escribir la instrucción en la dirección 0
        #5 we_IM = 0;

        // Esperar un ciclo antes de la próxima operación
        #10;

        // Otras operaciones similares de escritura en la memoria de instrucciones
        // Puedes agregar más aquí según sea necesario

        // Esperar un ciclo antes de la próxima operación
        #10;

        // Ejemplo de carga de un valor inmediato
        we_IM = 1;
        codein = 32'h7111;  // Cargar un valor inmediato en el registro
        #5;
        we_IM = 0;
        immd = 12'hFEB;     // Valor inmediato a cargar

        // Esperar un ciclo antes de finalizar la simulación
        #10;
        $finish;
    end
endmodule
