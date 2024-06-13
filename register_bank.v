module register_bank (
    input clk,
    input [4:0] write_address,
    input [31:0] write_data,
    input [4:0] read_addressA,
    input [4:0] read_addressB,
    input write_enable,
    input write_enableA,
    input write_enableB,
    input write_enableC,  // Entrada para controlar cuándo se carga un valor en el registro C
    input [31:0] write_dataC,  // Entrada para el valor que se carga en el registro C
    output reg [31:0] read_dataA,
    output reg [31:0] read_dataB
);

    reg [31:0] registers [0:31];

    always @(posedge clk) begin
        if (write_enable) begin
            registers[write_address] <= write_data;
        end
        if (write_enableA) begin
            registers[4'd0] <= write_data;  // Asume que el registro A está en la dirección 0
        end
        if (write_enableB) begin
            registers[4'd1] <= write_data;  // Asume que el registro B está en la dirección 1
        end
        if (write_enableC) begin
            registers[4'd2] <= write_dataC;  // Asume que el registro C está en la dirección 2
        end
        read_dataA <= registers[read_addressA];
        read_dataB <= registers[read_addressB];
    end
endmodule
