

module alu_control(
    input [1:0] ALUOp,       // 00=LW/SW, 10=R-Type
    input [2:0] FuncCode,    // 3-bit Function (Mapped from standard 6-bit)
    output reg [3:0] ALU_Cntrl // 4-bit Signal to ALU
);

always @(*)
begin
    case(ALUOp)
        // ---------------------------------------------------------
        // 1. LW / SW (Load/Store)
        // Requirement: Mandatory
        // Operation: Add Base + Offset -> Send ADD (0010) to ALU
        // ---------------------------------------------------------
        2'b00: ALU_Cntrl = 4'b0010; 

        // ---------------------------------------------------------
        // 2. R-Type Instructions
        // Requirement: Mandatory ADD & OR
        // Operation: Determined by 3-bit FuncCode
        // ---------------------------------------------------------
        2'b10: begin
            case(FuncCode)
                // ADD (Standard: 100000 -> Project: 000)
                3'b000: ALU_Cntrl = 4'b0010; 
                
                // SUB (Optional but standard MIPS: 100010 -> Project: 010)
                3'b010: ALU_Cntrl = 4'b0110; 
                
                // AND (Standard: 100100 -> Project: 100)
                3'b100: ALU_Cntrl = 4'b0000; 
                
                // OR  (Mandatory: 100101 -> Project: 101)
                3'b101: ALU_Cntrl = 4'b0001; 
                
                // SLT (Standard: 101010 -> Project: 110)
                3'b110: ALU_Cntrl = 4'b0111;
                
                // Default to ADD
                default: ALU_Cntrl = 4'b0010; 
            endcase
        end
        
        // Default Safety
        default: ALU_Cntrl = 4'b0010;
    endcase
end
endmodule