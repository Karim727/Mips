module instruction_memory(address,instruction);

input [31:0] address;
output reg [31:0] instruction;


reg [31:0] memory [0:255];  // 256 Words. 32 bit instruction. 1 Instruction per word.


initial begin
        $readmemb("instruction.mem", memory); // Load machine code into instruction memory. 
    end

always @(*) begin
    instruction = memory[address >> 2]; // Still don't get it // will look into it later....
end


endmodule


