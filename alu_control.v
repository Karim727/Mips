module alu_control(ALUOp,funct,control_signal);


input [1:0] ALUOp;
input [5:0] funct;
output reg [3:0] control_signal;


always@(*)begin

    case(ALUOp)
        2'b00: control_signal = 4'b0010; // LW or SW or ADDI to perform addition.
        2'b01: control_signal = 4'b0110; // BEQ to perform subtraction.
        2'b10: // R-type instructions
        begin 
            case(funct)
                6'd32: control_signal = 4'b0010; // ADD
                6'd34: control_signal = 4'b0110; // SUB
                6'd36: control_signal = 4'b0000; // AND
                6'd37: control_signal = 4'b0001; // OR
                6'd42: control_signal = 4'b0111; // SLT
                6'd0: control_signal = 4'b1000; // SLL
                6'd2: control_signal = 4'b1001; // SRL
                6'd3: control_signal = 4'b1010; // SRA
                6'd39: control_signal = 4'b1100; // NOR
                default: $display("incorrect funct code funct = %d", funct);
            endcase
        end
        2'b11: control_signal = 4'b1101; // LUI

        default: $display("incorrect ALUOp code ALUOp = %b", ALUOp);
    endcase
end


endmodule