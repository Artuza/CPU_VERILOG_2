  module ALU(
    input [31:0] a,
    input [31:0] b,
    input [2:0] opcode,
    input mode,
    output reg [63:0] outALU,
    output reg za,
    output reg zb,
    output reg eq,
    output reg gt,
    output reg lt
);

    wire [63:0] outau;
    wire [63:0] outlu;
    wire tza, tzb, teq, tgt, tlt;

    // Instanciación de los módulos arith y logic
    arith a1 (.a(a), .b(b), .opcode(opcode), .outau(outau));
    logic l1 (.a(a), .b(b), .opcode(opcode), .outlu(outlu), .za(tza), .zb(tzb), .eq(teq), .gt(tgt), .lt(tlt));

    // Selección del modo
    always @(a, b, mode, opcode) begin
        if (mode == 0) begin
            outALU = outau;
        end else if (mode == 1) begin
            outALU = outlu;
        end else begin
            outALU = 64'h0000000000000000;
        end

        za = tza;
        zb = tzb;
        eq = teq;
        gt = tgt;
        lt = tlt;
    end
endmodule
