module muxA (
    input clk,
    input [31:0] in1,
    input [31:0] in2,
    input sel,
    output reg [31:0] outA
);

always @(posedge clk) begin
    if (sel == 1'b1) begin
        outA <= in1;
    end
    else begin
        outA <= {16'b0, in2};
    end
end

endmodule
