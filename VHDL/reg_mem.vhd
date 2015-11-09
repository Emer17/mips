library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity reg_mem is
port(
		entry : in STD_LOGIC_VECTOR(0 to 31);
		clk,reset : in bit;
		saida : out STD_LOGIC_VECTOR(0 to 31) 
	);
end entity;

architecture arc_reg_mem of reg_mem is
begin
	process(clk)
	begin
	
	if rising_edge(clk) then
		saida <= entry;
	end if;
end process;
end arc_reg_mem;
