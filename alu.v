module alu(alu_control,rs,mux_2to1_out,alu_result,zero_flag,shamt);


input [31:0]rs,mux_2to1_out;
input [3:0]alu_control;
input [4:0] shamt;
output reg zero_flag;
output reg [31:0] alu_result;

always@(*)begin

    case(alu_control)
        4'b0000: alu_result = rs & mux_2to1_out;  
        4'b0001: alu_result = rs | mux_2to1_out;
        4'b0010: alu_result = rs + mux_2to1_out; 
        4'b0011: alu_result = rs ^ mux_2to1_out;
        4'b0110: alu_result = rs - mux_2to1_out; 
        4'b0111: alu_result = (rs < mux_2to1_out) ? 32'b1 : 32'b0; // SLT 
        4'b1000: alu_result = mux_2to1_out << shamt; // SLL 
        4'b1001: alu_result = mux_2to1_out >> shamt ; // SRL 
        4'b1010: alu_result = mux_2to1_out >>> shamt; // SRA 
        4'b1100: alu_result = ~(rs | mux_2to1_out); // NOR
        4'b1101: alu_result = mux_2to1_out << 16; // LUI
        default: alu_result = 32'b0; 
    endcase

    zero_flag = (alu_result == 32'b0) ? 1'b1 : 1'b0;

end



endmodule

