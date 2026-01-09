library verilog;
use verilog.vl_types.all;
entity pipelineCycle is
    port(
        alu_result      : out    vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        instruction     : out    vl_logic_vector(15 downto 0);
        pc              : out    vl_logic_vector(15 downto 0);
        write_data      : out    vl_logic_vector(15 downto 0)
    );
end pipelineCycle;
