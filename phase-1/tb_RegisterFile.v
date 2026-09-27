`timescale 1ns/1ps

module tb_RegisterFile;

reg clk;
reg RegWrite;

reg [3:0] rs;
reg [3:0] rt;
reg [3:0] rd;

reg [31:0] WriteData;

wire [31:0] ReadData1;
wire [31:0] ReadData2;

RegisterFile uut (
    .clk(clk),
    .RegWrite(RegWrite),
    .rs(rs),
    .rt(rt),
    .rd(rd),
    .WriteData(WriteData),
    .ReadData1(ReadData1),
    .ReadData2(ReadData2)
);

always begin
    #5 clk = ~clk;
end

initial begin

    clk = 0;
    RegWrite = 0;
    rs = 4'b0000;
    rt = 4'b0000;
    rd = 4'b0000;
    WriteData = 32'd0;

    #10;

    RegWrite = 1;
    rd = 4'b0001;
    WriteData = 32'd25;

    #10;

    rd = 4'b0010;
    WriteData = 32'd40;

    #10;

    RegWrite = 0;
    rs = 4'b0001;
    rt = 4'b0010;

    #10;

    RegWrite = 1;
    rd = 4'b0000;
    WriteData = 32'd99;

    #10;

    RegWrite = 0;
    rs = 4'b0000;
    rt = 4'b0001;

    #20;

    $stop;

end

endmodule
