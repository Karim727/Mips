module mips_tb;
    initial $display("Starting MIPS Testbench...");
    reg clk;
    mips_top mips (clk);

    integer i;

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk; 
    end

    
    initial begin
        #5000;

        $display("\nFinal Register File Contents:");
        for (i = 0; i < 32; i = i + 1)
            $display("R[%0d] = %0d", i, mips.rf.registers[i]);

        $display("\nFinal Data Memory Contents:");
        for (i = 0; i < 10; i = i + 1)
            $display("mem[%0d] = %0d", i, mips.dm.memory[i]);

        $finish;
    end

endmodule
