module muxB(
    input clk,
    input [31:0] in1,
    input [31:0] in2,
    input sel,
    output reg [31:0] outB
);

always @(posedge clk) begin
    if (sel == 1'b1) begin
        outB <= in1;
    end
    else begin
        outB <= in2;
    end
end

endmodule
