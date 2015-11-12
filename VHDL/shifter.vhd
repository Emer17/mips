library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity shifter is
port(
	entrada : in STD_LOGIC_VECTOR(0 to 31);
	saida : out STD_LOGIC_VECTOR(0 to 31)
	);
end shifter;

architecture arch of shifter is
begin

process(entrada)
begin
	saida <= entrada(0 to 29)&"00";

end process;
end arch;
