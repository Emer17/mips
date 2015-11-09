library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity tb_reg is
end entity;

architecture arch_tb_reg of tb_reg is
--Signal
signal clk_tb,reset_tb : bit;
signal rs_in_tb, rt_in_tb, rd_in_tb : STD_LOGIC_VECTOR(0 to 4);
signal dados_tb : STD_LOGIC_VECTOR(0 to 31);
signal rs_out_tb, rt_out_tb : STD_LOGIC_VECTOR(0 to 31);

--Component
component banco_reg is
port(
	clk,reset : in bit;
	rs_in : in STD_LOGIC_VECTOR(0 to 4);
	rt_in : in STD_LOGIC_VECTOR(0 to 4);
	rd_in : in STD_LOGIC_VECTOR(0 to 4);
	dados : in STD_LOGIC_VECTOR(0 to 31);
	rs_out : out STD_LOGIC_VECTOR(0 to 31);
	rt_out : out STD_LOGIC_VECTOR(0 to 31)
);
end component;
--Port Map
begin
U1 : banco_reg port map(clk_tb,reset_tb,rs_in_tb,rt_in_tb,rd_in_tb,dados_tb,rs_out_tb,rt_out_tb);

process
begin
	clk_tb <='0';
	reset_tb <= '1';
	wait for 5 ns;
	clk_tb <= '1';
	wait for 5 ns;
	reset_tb <= '0';
	clk_tb <= '0';
	rs_in_tb <= "00101";
	rt_in_tb <= "10000";
	wait for 5 ns;
	
	clk_tb <= '1';
	wait for 5 ns;
	
	clk_tb <= '0';
	rs_in_tb <= "01000";
	rt_in_tb <= "11001";
	wait for 5 ns;
	
	clk_tb <= '1';
	wait for 5 ns;
	
	clk_tb <= '0';
	rs_in_tb <= "01011";
	rt_in_tb <= "10101";
	wait for 5 ns;
	
	clk_tb <= '1';
	wait for 5 ns;
	
	clk_tb <= '0';
	rs_in_tb <= "UUUUU";
	rt_in_tb <= "UUUUU";
	wait for 5 ns;
	clk_tb <= '1';
	wait for 5 ns;
	
	clk_tb <= '0';
	rs_in_tb <= "00101";
	rd_in_tb <= "00101";
	dados_tb <= "00000000000000000000000000001010";
	wait for 5 ns;
	
	clk_tb <= '1';
	wait for 5 ns;
	
	clk_tb <= '0';
	rs_in_tb <= "00101";
	rt_in_tb <= "10000";
	rd_in_tb <= "10000";
	dados_tb <= "00000000000000000000000000100000";
	wait for 5 ns;
	
	clk_tb <= '1';
	wait for 5 ns;
	
	clk_tb <= '0';
	wait for 5 ns;
	
	clk_tb <= '1';
	rs_in_tb <= "UUUUU";
	rt_in_tb <= "10000";
	wait for 5 ns;
	
	clk_tb <= '0';
	wait;
	
end process;
end arch_tb_reg;
