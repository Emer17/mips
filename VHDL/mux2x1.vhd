library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


entity mux2x1 is
port(
	seletor : in bit;
	A : in STD_LOGIC_VECTOR(0 to 31);
	B : in STD_LOGIC_VECTOR(0 to 31);
	saida: out STD_LOGIC_VECTOR(0 to 31)
);
end mux2x1;

architecture arch of mux2x1 is
begin

--process(seletor)
process
begin

if(seletor = '1') then
	saida <= B; --extensor
else
	saida <= A;
end if;

end process;
end arch;
