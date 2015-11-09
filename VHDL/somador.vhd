library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity somador is
port(
   pc : in STD_LOGIC_VECTOR(0 to 31);
   clk : in bit;
   saida : out STD_LOGIC_VECTOR(0 to 31)
);
end entity;

architecture arc_somador of somador is
begin
process(clk)
begin
	if rising_edge(clk) then
		saida <= pc + 4;
	end if;
end process;

end arc_somador;