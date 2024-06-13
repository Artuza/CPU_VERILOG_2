module instmem(
    input clk,
    input we_IM,
    input [15:0] dataIM,
    input [11:0] addIM,
    output reg [15:0] outIM
);

    // Memory is an array stored at particular address
    reg [15:0] mem [0 : 15];

    always @(posedge clk) begin
        if (we_IM == 1) begin
            mem[addIM] = dataIM;
        end else begin
            outIM <= mem[addIM];
        end
    end
endmodule
