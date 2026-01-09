module instruction_memory (
    input [15:0] pc,
    output reg [15:0] instruction
);

    always @(*) begin
        case (pc)
            // 1. Load ID Part 1 (0253) into Register $1 (Not $0!)
            // Op=8, Rs=0, Rt=1 (Dest), Imm=0 -> Hex 8040
            16'd0: instruction = 16'h8040; 

            // 2. Load ID Part 2 (2022) into Register $2
            // Op=8, Rs=0, Rt=2 (Dest), Imm=1 -> Hex 8081
            16'd1: instruction = 16'h8081; 

            // --- SAFETY BUBBLES (NOPs) ---
            // Wait for data to travel to WB stage
            16'd2: instruction = 16'h0000;
            16'd3: instruction = 16'h0000;
            16'd4: instruction = 16'h0000;

            // 3. ADD $1 + $2 -> Store in $3
            // Now $1 and $2 actually have values!
            16'd5: instruction = 16'h0298;

            // 4. OR $1 | $2 -> Store in $4
				16'd6: instruction = 16'h02A3;
            // 5. Store Result 1 ($3) to Address 5
            16'd7: instruction = 16'h9605;

            // 6. Store Result 2 ($4) to Address 7
            16'd8: instruction = 16'h9807;

            default: instruction = 16'h0000;
        endcase
    end

endmodule