`timescale 1ns / 1ps

module tb_processor();

    // 1. Declare Inputs as Registers (so we can change them)
    reg clk;
    reg rst;

    // 2. Declare Outputs as Wires (to read from the processor)
    wire [15:0] test_alu;
    wire [15:0] test_inst;
    wire [15:0] test_pc;

    // 3. Instantiate the Processor (The Unit Under Test)
    // REPLACE "singleCycle" with the exact name of your top-level .bdf file!
    singleCycle uut (
        .clk(clk),
        .rst(rst),
        .test_alu(test_alu),
        .test_inst(test_inst),
        .test_pc(test_pc)
    );

    // 4. Clock Generation
    // Toggle clock every 10ns (20ns period = 50MHz)
    always begin
        #10 clk = ~clk;
    end

    // 5. The Test Sequence
    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1; // Start with Reset ON (Active High)

        // Wait 20ns and turn off Reset
        #20;
        rst = 0;
        $display("--- Simulation Started: Reset Deactivated ---");

        // Run for 200ns (Enough for 10 clock cycles)
        #200;

        // Stop Simulation
        $display("--- Simulation Finished ---");
        $stop;
    end

    // 6. Monitor / Print Results
    // This prints to the console whenever the clock rises
    always @(posedge clk) begin
        if (!rst) begin
            $display("Time=%0t | PC=%d | Inst=%h | ALU_Out=%h (Dec: %d)", 
                     $time, test_pc, test_inst, test_alu, test_alu);
            
            // Auto-check for your ID
            if (test_alu == 16'h2275) 
                $display(">>> SUCCESS: ID Sum (2275) Detected! <<<");
            if (test_alu == 16'h2277) 
                $display(">>> SUCCESS: ID OR (2277) Detected! <<<");
        end
    end

endmodule