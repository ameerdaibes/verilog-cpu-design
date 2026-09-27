module RegisterFile(
    input clk,
    input RegWrite,

    input [3:0] rs,
    input [3:0] rt,
    input [3:0] rd,

    input [31:0] WriteData,

    output [31:0] ReadData1,
    output [31:0] ReadData2
);

reg [31:0] R [15:0];

assign ReadData1 = (rs == 4'b0000) ? 32'b0 : R[rs];
assign ReadData2 = (rt == 4'b0000) ? 32'b0 : R[rt];

always @(posedge clk) begin
    if(RegWrite && rd != 4'b0000)
        R[rd] <= WriteData;
end

endmodule
