module InstructionMemory(
    input [31:0] Address,
    output [31:0] Instruction
);

reg [31:0] memory [0:255];

initial begin
    memory[0] = {6'b000101, 5'd0, 5'd1, 16'd5};
    memory[1] = {6'b000101, 5'd0, 5'd2, 16'd3};
    memory[2] = {6'b000000, 5'd1, 5'd2, 5'd3, 11'd0};
    memory[3] = {6'b001001, 5'd0, 5'd3, 16'd0};
end

assign Instruction = memory[Address[7:0]];

endmodule