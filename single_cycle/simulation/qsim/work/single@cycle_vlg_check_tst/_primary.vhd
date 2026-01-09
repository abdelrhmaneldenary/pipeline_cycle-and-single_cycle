library verilog;
use verilog.vl_types.all;
entity singleCycle_vlg_check_tst is
    port(
        test_alu        : in     vl_logic_vector(15 downto 0);
        test_inst       : in     vl_logic_vector(15 downto 0);
        test_pc         : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end singleCycle_vlg_check_tst;
