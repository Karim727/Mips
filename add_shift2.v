module add_shift2(pc, imm_branch, pc_next );

input [31:0] pc;
input [31:0] imm_branch; // immediate value for branch instruction
output reg [31:0] pc_next;
always @(*) begin
    // Shift the immediate value left by 2 bits and add to the current PC
    pc_next = pc + (imm_branch << 2);
end


endmodule