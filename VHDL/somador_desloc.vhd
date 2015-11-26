library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity somador_desloc is
port(
	clk : in bit;
	A : in STD_LOGIC_VECTOR(0 to 31);
	B : in STD_LOGIC_VECTOR(0 to 31);
	saida : out STD_LOGIC_VECTOR(0 to 31)
	);
end somador_desloc;

architecture arch of somador_desloc is
begin

--process(clk)
--begin
--	if rising_edge(clk) then
		saida <= A + B;
--	end if;

--end process;
end arch;
