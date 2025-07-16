module mips_top (
    clk
);
  input clk;
  
  reg [31:0] pc = 32'b0;
  wire [31:0] new_pc;
  

  wire [31:0] instruction;
  wire [4:0] write_reg;
  wire [31:0] write_data;

  // Control signals
  wire RegDst;
  wire Branch;
  wire MemRead;
  wire MemtoReg;
  wire [1:0]ALUOp;
  wire MemWrite;
  wire ALUSrc;
  wire RegWrite;
  wire PCSrc;

  wire [31:0] rs, rt;

  wire [31:0]ALU_in2;
  wire [31:0] A3;
  wire [3:0] ALU_cont;
  wire zero_flag;

  wire [31:0] mem_data;

  wire [31:0] A1;
  wire [31:0] A2;
  wire [31:0] imm_ext;
  // Modules Instantiations //

  assign PCSrc = Branch & zero_flag;

  add_4 add_pc ( // 1
      .pc(pc),
      .pc_next(A1)
  );

  control_unit cu ( //2
      .RegDst(RegDst),
      .Branch(Branch),
      .MemRead(MemRead),
      .MemtoReg(MemtoReg),
      .ALUOp(ALUOp),
      .MemWrite(MemWrite),
      .ALUSrc(ALUSrc),
      .RegWrite(RegWrite),
      .opcode(instruction[31:26])
  );

  register_file rf ( //3
      .read_reg1 (instruction[25:21]),
      .read_reg2 (instruction[20:16]),
      .write_reg (write_reg),
      .write_data(write_data),
      .RegWrite  (RegWrite),
      .read_data1(rs),
      .read_data2(rt)
  );

  alu alu_unit ( //4
      .alu_control(ALU_cont),
      .rs(rs),
      .shamt(instruction[10:6]),
      .mux_2to1_out(ALU_in2),
      .alu_result(A3),
      .zero_flag(zero_flag)
  ); 
  data_memory dm ( //5
      .MemWrite(MemWrite),
      .MemRead(MemRead),
      .address(A3),
      .write_data(rt),
      .read_data(mem_data)
  );

  sign_extend se ( //6
      .immediate(instruction[15:0]),
      .extended_immediate(imm_ext)
  );


  add_shift2 as ( //7
      .pc(A1),
      .imm_branch(imm_ext),
      .pc_next(A2)
  );
  //module add_shift2(pc, imm_branch, pc_next );

// Mux Instantiations //
//module mux_2to1(in0, in1, select, out);

mux_2to1 #(.WIDTH(5))mux_1 ( //8
    .in0(instruction[20:16]),
    .in1(instruction[15:11]),
    .select(RegDst),
    .out(write_reg)
);

mux_2to1 mux2 ( //9
    .in0(rt),
    .in1(imm_ext),
    .select(ALUSrc),
    .out(ALU_in2)
);

mux_2to1 mux3 ( //10
    .in0(A3),
    .in1(mem_data),
    .select(MemtoReg),
    .out(write_data)
);

mux_2to1 mux4 ( //11
    .in0(A1),
    .in1(A2),
    .select(PCSrc),
    .out(new_pc)
);

instruction_memory im ( //12
      .address(pc),
      .instruction(instruction)
  );


alu_control ac ( //13
    .ALUOp(ALUOp),
    .funct(instruction[5:0]),
    .control_signal(ALU_cont)
);
//module alu_control(ALUOp,funct,control_signal);

//module alu_control(ALUOp,funct,control_signal);
always @(posedge clk) begin
    pc <= new_pc;
end



endmodule

