library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity somador is
port(
   pc : in STD_LOGIC_VECTOR(0 to 31);
   saida : out STD_LOGIC_VECTOR(0 to 31)
);
end entity;

architecture arc_somador of somador is
begin
	saida <= pc + 4;
end arc_somador;
