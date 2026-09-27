module InstructionMemory(
    input [31:0] Address,
    output [31:0] Instruction
);

reg [31:0] memory [0:255];

initial begin
    memory[0]  = {6'b000101, 5'd0, 5'd1, 16'd5};
    memory[1]  = {6'b000101, 5'd0, 5'd2, 16'd3};
    memory[2]  = {6'b000000, 5'd1, 5'd2, 5'd3, 11'd0};
    memory[3]  = {6'b001001, 5'd0, 5'd3, 16'd0};
    memory[4]  = {6'b001000, 5'd0, 5'd4, 16'd0};
    memory[5]  = {6'b001010, 5'd3, 5'd4, 16'd1};
    memory[6]  = {6'b000101, 5'd0, 5'd5, 16'd99};
    memory[7]  = {6'b001011, 26'd10};
    memory[8]  = {6'b000101, 5'd0, 5'd6, 16'd100};
    memory[10] = {6'b000101, 5'd0, 5'd7, 16'd50};
end

assign Instruction = memory[Address[7:0]];

endmodule