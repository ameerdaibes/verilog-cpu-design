`timescale 1ns/1ps

module tb_Datapath;

reg clk;
reg reset;

wire [31:0] PCValue;
wire [31:0] Instruction;
wire [31:0] ALUResult;
wire [31:0] DataMemoryOut;

Datapath uut(
    .clk(clk),
    .reset(reset),
    .PCValue(PCValue),
    .Instruction(Instruction),
    .ALUResult(ALUResult),
    .DataMemoryOut(DataMemoryOut)
);

always begin
    #5 clk = ~clk;
end

initial begin
    clk = 0;
    reset = 1;
    #10;
    reset = 0;
    #80;
    $stop;
end

endmodule