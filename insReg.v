module insReg (
    input clk,
    input loadIR,
    input [15:0] insin,
    output reg [11:0] address,
    output reg [3:0] opcode
);

    reg [15:0] temp;

    always @(posedge clk) begin
        if (loadIR == 1) begin
            temp <= insin;
        end
        address <= temp[11:0];
        opcode <= temp[15:12];
    end

endmodule
