module datamem(
    input clk,
    input we_DM,
    input [31:0] dataDM,
    input [31:0] addDM,
    output reg [31:0] outDM
);

reg [31:0] mem [0:31];

always @(posedge clk) begin
    if (we_DM == 1) begin
        mem[addDM] <= dataDM;
    end
    else begin
        outDM <= mem[addDM];
    end
end

endmodule
