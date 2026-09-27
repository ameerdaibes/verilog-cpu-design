module Datapath(
    input clk,
    input reset,
    output [31:0] PCValue,
    output [31:0] Instruction,
    output [31:0] ALUResult,
    output [31:0] DataMemoryOut
);

wire [31:0] PCNext;
wire [31:0] ReadData1;
wire [31:0] ReadData2;
wire [31:0] SignImm;
wire [31:0] ALUInputB;
wire [31:0] WriteBackData;
wire Zero;
wire Negative;
wire CarryOut;
wire Overflow;
wire [5:0] opcode;
wire [4:0] rs_full;
wire [4:0] rt_full;
wire [4:0] rd_full;
wire [15:0] immediate;
wire RegWrite;
wire MemRead;
wire MemWrite;
wire ALUSrc;
wire MemToReg;
wire Branch;
wire Jump;
wire BranchTaken;
wire [31:0] BranchAddress;
wire [31:0] JumpAddress;
wire [3:0] ALUControl;
wire [3:0] WriteReg;

assign opcode = Instruction[31:26];
assign rs_full = Instruction[25:21];
assign rt_full = Instruction[20:16];
assign rd_full = Instruction[15:11];
assign immediate = Instruction[15:0];

assign WriteReg =
    (opcode == 6'b000000 ||
     opcode == 6'b000001 ||
     opcode == 6'b000010 ||
     opcode == 6'b000011 ||
     opcode == 6'b000100)
    ? rd_full[3:0]
    : rt_full[3:0];

ControlUnit control_unit(
    .opcode(opcode),
    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .MemToReg(MemToReg),
    .Branch(Branch),
    .Jump(Jump),
    .ALUControl(ALUControl)
);

assign BranchTaken = Branch & Zero;
assign BranchAddress = PCValue + 32'd1 + SignImm;
assign JumpAddress = {6'b0, Instruction[25:0]};

assign PCNext =
    Jump ? JumpAddress :
    (BranchTaken ? BranchAddress : (PCValue + 32'd1));

PC pc_unit(.clk(clk), .reset(reset), .PCNext(PCNext), .PCOut(PCValue));
InstructionMemory instruction_memory(.Address(PCValue), .Instruction(Instruction));
SignExtend sign_extend(.Imm(immediate), .SignImm(SignImm));

assign ALUInputB = (ALUSrc) ? SignImm : ReadData2;

ALU alu_unit(
    .A(ReadData1),
    .B(ALUInputB),
    .ALUControl(ALUControl),
    .Result(ALUResult),
    .Zero(Zero),
    .Negative(Negative),
    .CarryOut(CarryOut),
    .Overflow(Overflow)
);

DataMemory data_memory(
    .clk(clk),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .Address(ALUResult),
    .WriteData(ReadData2),
    .ReadData(DataMemoryOut)
);

assign WriteBackData = (MemToReg) ? DataMemoryOut : ALUResult;

RegisterFile register_file(
    .clk(clk),
    .RegWrite(RegWrite),
    .rs(rs_full[3:0]),
    .rt(rt_full[3:0]),
    .rd(WriteReg),
    .WriteData(WriteBackData),
    .ReadData1(ReadData1),
    .ReadData2(ReadData2)
);

endmodule