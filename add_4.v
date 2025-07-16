module add_4(pc, pc_next);

input [31:0] pc; 
output reg [31:0] pc_next;
always @(*) begin
    pc_next = pc + 4;
end


endmodule