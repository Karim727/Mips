module control_unit(RegDst, Branch, MemRead, MemtoReg,
ALUOp, MemWrite, ALUSrc, RegWrite,opcode);


input [5:0] opcode;
output reg RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
output reg [1:0] ALUOp;



always@(*)begin

    case(opcode)
        6'd0: begin // R-type instructions
            RegDst = 1;
            ALUSrc = 0;
            MemtoReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            ALUOp = 2'b10;
        end

        6'd35: begin // LW
            RegDst = 0;
            ALUSrc = 1;
            MemtoReg = 1;
            RegWrite = 1;
            MemRead = 1;
            MemWrite = 0;
            Branch = 0;
            ALUOp = 2'b00;
        end

        6'd43: begin // SW
            RegDst = 1'bx; 
            ALUSrc = 1;
            MemtoReg = 1'bx; 
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 1;
            Branch = 0;
            ALUOp = 2'b00; 
        end

        6'd4: begin // BEQ
            RegDst = 1'bx; 
            ALUSrc = 1'b0; 
            MemtoReg = 1'bx;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 0;
            Branch = 1; 
            ALUOp = 2'b01; 
        end
        
        6'd15: begin // LUI
            RegDst = 1'b0; 
            ALUSrc = 1'b1; 
            MemtoReg = 1'b0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0; 
            ALUOp = 2'b11; 
        end

        6'd8: begin // ADDI
            RegDst = 0;
            ALUSrc = 1;
            MemtoReg = 0;
            RegWrite = 1;
            MemRead = 0;        
            MemWrite = 0;
            Branch = 0;
            ALUOp = 2'b00; 
        end



        default: $display("incorrect opcode = %d", opcode);

    endcase



end



endmodule