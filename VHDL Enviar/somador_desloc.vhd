--Marcelo e Emerson
--Implementa o somador do PC+4 com o resultado do Shifter
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity somador_desloc is
port(
	A : in STD_LOGIC_VECTOR(0 to 31);
	B : in STD_LOGIC_VECTOR(0 to 31);
	saida : out STD_LOGIC_VECTOR(0 to 31)
	);
end somador_desloc;

architecture arch of somador_desloc is
begin
	saida <= A + B;
end arch;
