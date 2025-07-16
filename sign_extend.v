module sign_extend (immediate, extended_immediate);
input [15:0] immediate;
output reg [31:0] extended_immediate;
    
always @(immediate) begin
    extended_immediate = {{16{immediate[15]}}, immediate};
    end
    
endmodule