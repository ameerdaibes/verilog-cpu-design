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
reg RegWrite;
reg MemRead;
reg MemWrite;
reg ALUSrc;
reg MemToReg;
reg [3:0] ALUControl;
reg [3:0] WriteReg;

assign opcode = Instruction[31:26];
assign rs_full = Instruction[25:21];
assign rt_full = Instruction[20:16];
assign rd_full = Instruction[15:11];
assign immediate = Instruction[15:0];
assign PCNext = PCValue + 32'd1;

PC pc_unit(.clk(clk), .reset(reset), .PCNext(PCNext), .PCOut(PCValue));
InstructionMemory instruction_memory(.Address(PCValue), .Instruction(Instruction));
SignExtend sign_extend(.Imm(immediate), .SignImm(SignImm));

assign ALUInputB = (ALUSrc) ? SignImm : ReadData2;

ALU alu_unit(
    .A(ReadData1), .B(ALUInputB), .ALUControl(ALUControl),
    .Result(ALUResult), .Zero(Zero), .Negative(Negative),
    .CarryOut(CarryOut), .Overflow(Overflow)
);

DataMemory data_memory(
    .clk(clk), .MemRead(MemRead), .MemWrite(MemWrite),
    .Address(ALUResult), .WriteData(ReadData2), .ReadData(DataMemoryOut)
);

assign WriteBackData = (MemToReg) ? DataMemoryOut : ALUResult;

RegisterFile register_file(
    .clk(clk), .RegWrite(RegWrite),
    .rs(rs_full[3:0]), .rt(rt_full[3:0]), .rd(WriteReg),
    .WriteData(WriteBackData), .ReadData1(ReadData1), .ReadData2(ReadData2)
);

always @(*) begin
    RegWrite = 1'b0;
    MemRead = 1'b0;
    MemWrite = 1'b0;
    ALUSrc = 1'b0;
    MemToReg = 1'b0;
    ALUControl = 4'b0000;
    WriteReg = rd_full[3:0];

    case(opcode)
        6'b000000: begin
            RegWrite = 1'b1;
            ALUSrc = 1'b0;
            MemToReg = 1'b0;
            WriteReg = rd_full[3:0];
            ALUControl = 4'b0000;
        end
        6'b000101: begin
            RegWrite = 1'b1;
            ALUSrc = 1'b1;
            MemToReg = 1'b0;
            WriteReg = rt_full[3:0];
            ALUControl = 4'b0000;
        end
        6'b001000: begin
            RegWrite = 1'b1;
            MemRead = 1'b1;
            ALUSrc = 1'b1;
            MemToReg = 1'b1;
            WriteReg = rt_full[3:0];
            ALUControl = 4'b0000;
        end
        6'b001001: begin
            RegWrite = 1'b0;
            MemWrite = 1'b1;
            ALUSrc = 1'b1;
            ALUControl = 4'b0000;
        end
        default: begin
            RegWrite = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            MemToReg = 1'b0;
            ALUControl = 4'b0000;
            WriteReg = 4'b0000;
        end
    endcase
end

endmodule