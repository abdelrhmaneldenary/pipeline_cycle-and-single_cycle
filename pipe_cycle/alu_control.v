module alu_control(
    input [1:0] ALUOp,
    input [2:0] FuncCode,
    output reg [3:0] ALU_Cntrl
);
    always @(*) begin
        if (ALUOp == 2'b10) begin // R-Type
            case (FuncCode)
                3'b000: ALU_Cntrl = 4'b0010; // ADD (matches your alu.v)
                3'b011: ALU_Cntrl = 4'b0001; // OR  (matches your alu.v)
                default: ALU_Cntrl = 4'b0010;
            endcase
        end else begin
            ALU_Cntrl = 4'b0010; // Load/Store (Force ADD)
        end
    end
endmodule