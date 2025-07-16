module data_memory(MemWrite, MemRead, address, write_data, read_data);


input MemWrite, MemRead;
input [31:0] address, write_data;
output reg [31:0] read_data;

reg [31:0] memory [0:255]; // 256 Words. 32 bit data. 1 Data per word.


initial begin
    $readmemb("data.mem", memory); 
end 

always @(*) begin
    if (MemRead) begin
        read_data = memory[address]; 
    end
end

always @(*) begin
    if (MemWrite) begin
        memory[address] = write_data;
    end
    $writememb("data.mem", memory);
end



endmodule