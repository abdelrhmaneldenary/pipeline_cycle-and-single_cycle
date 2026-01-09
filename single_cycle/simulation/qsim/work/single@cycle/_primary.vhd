library verilog;
use verilog.vl_types.all;
entity singleCycle is
    port(
        test_alu        : out    vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        test_inst       : out    vl_logic_vector(15 downto 0);
        test_pc         : out    vl_logic_vector(15 downto 0)
    );
end singleCycle;
