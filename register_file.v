module register_file(read_reg1,read_reg2,write_reg,write_data,RegWrite,read_data1,read_data2);


input [4:0] read_reg1,read_reg2,write_reg;
input RegWrite; 
input [31:0] write_data;
output reg [31:0] read_data1, read_data2;

reg [31:0] registers [0:31]; // 32 registers


initial begin

    $readmemb("registers.mem",registers);
end


always @(read_reg1,read_reg2) begin
    read_data1 = registers[read_reg1];
    read_data2 = registers[read_reg2];

end

always@(write_data,write_reg,RegWrite)begin

    if(RegWrite && write_reg != 5'b0)begin // Protect $zero register from being written to.
        registers[write_reg] = write_data;
        
    end
    $writememb("registers.mem",registers);

end

endmodule