library verilog;
use verilog.vl_types.all;
entity pipelineCycle_vlg_check_tst is
    port(
        alu_result      : in     vl_logic_vector(15 downto 0);
        instruction     : in     vl_logic_vector(15 downto 0);
        pc              : in     vl_logic_vector(15 downto 0);
        write_data      : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end pipelineCycle_vlg_check_tst;
