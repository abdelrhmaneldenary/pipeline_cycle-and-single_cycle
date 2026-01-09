module control_unit(
    input [3:0] opcode,
    output reg reg_dst,
    output reg reg_write,
    output reg alu_src,
    output reg mem_write,
    output reg mem_read,    // Added for pipelined memory control
    output reg mem_to_reg,
    output reg [1:0] alu_op
);

    always @(*) begin
        // Initialize all signals to 0
        reg_dst    = 0;
        reg_write  = 0;
        alu_src    = 0;
        mem_write  = 0;
        mem_read   = 0;    // Default off
        mem_to_reg = 0;
        alu_op     = 2'b00;

        case(opcode)
            4'b0000: begin // R-type (ADD/OR)
                reg_dst    = 1;
                reg_write  = 1;
                alu_op     = 2'b10;
            end
            4'b1000: begin // LW (Load Word)
                alu_src    = 1;
                mem_to_reg = 1;
                reg_write  = 1;
                mem_read   = 1; // Explicitly signal a read
            end
            4'b1010: begin // SW (Store Word)
                alu_src    = 1;
                mem_write  = 1;
            end
            default: ; 
        endcase
    end
endmodule