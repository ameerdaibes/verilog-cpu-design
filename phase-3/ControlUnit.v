module ControlUnit(
    input [5:0] opcode,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg ALUSrc,
    output reg MemToReg,
    output reg Branch,
    output reg Jump,
    output reg [3:0] ALUControl
);

always @(*) begin
    RegWrite = 0;
    MemRead  = 0;
    MemWrite = 0;
    ALUSrc   = 0;
    MemToReg = 0;
    Branch   = 0;
    Jump     = 0;
    ALUControl = 4'b0000;

    case(opcode)
        6'b000000: begin RegWrite = 1; ALUControl = 4'b0000; end
        6'b000001: begin RegWrite = 1; ALUControl = 4'b0001; end
        6'b000010: begin RegWrite = 1; ALUControl = 4'b0010; end
        6'b000011: begin RegWrite = 1; ALUControl = 4'b0011; end
        6'b000100: begin RegWrite = 1; ALUControl = 4'b0100; end
        6'b000101: begin RegWrite = 1; ALUSrc = 1; ALUControl = 4'b0000; end
        6'b000110: begin RegWrite = 1; ALUSrc = 1; ALUControl = 4'b0010; end
        6'b000111: begin RegWrite = 1; ALUSrc = 1; ALUControl = 4'b0011; end
        6'b001000: begin RegWrite = 1; MemRead = 1; ALUSrc = 1; MemToReg = 1; ALUControl = 4'b0000; end
        6'b001001: begin MemWrite = 1; ALUSrc = 1; ALUControl = 4'b0000; end
        6'b001010: begin Branch = 1; ALUControl = 4'b0001; end
        6'b001011: begin Jump = 1; end
    endcase
end

endmodule