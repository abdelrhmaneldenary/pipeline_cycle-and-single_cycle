module instruction_memory(
    input [15:0] pc,
    output reg [15:0] instruction
);
    reg [15:0] rom [0:255];
    integer i; 

    initial begin
        // 1. LW R1, 0(R0)  -> Address 0x00
        rom[0] = 16'h8040; 
        // 2. LW R2, 1(R0)  -> Address 0x01
        rom[1] = 16'h8081; 
        // 3. ADD R3, R1, R2 -> FuncCode 000 (Last 3 bits are 000)
        rom[2] = 16'h0280; 
        // 4. OR R4, R1, R2  -> FuncCode 101 (Last 3 bits are 101)
        rom[3] = 16'h0285; // FIXED: This matches your 3'b101 case
        // 5. SW R3, 5(R0)  -> Store ADD result to 0x05
        rom[4] = 16'hA005; 
        // 6. SW R4, 7(R0)  -> Store OR result to 0x07
        rom[5] = 16'hA007;

        for (i = 6; i < 256; i = i + 1) rom[i] = 16'h0000;
    end

    always @(*) instruction = rom[pc[7:0]];
endmodule