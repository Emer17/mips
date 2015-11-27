--Marcelo e Emerson
--Implementa o Mux 2x1 de 32 bits responsavel pela sele��o dos valores da ula e do Banco de registradores
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


entity mux2x1 is
port(
	seletor : in bit;
	A : in STD_LOGIC_VECTOR(0 to 31);--Saida do Banco_Reg
	B : in STD_LOGIC_VECTOR(0 to 31);--Saida do Extensor
	saida: out STD_LOGIC_VECTOR(0 to 31)--Entrada da Ula
);
end mux2x1;

architecture arch of mux2x1 is
begin

--process(seletor,A,B)
process
begin
	
	if(seletor = '1') then
		saida <= B; --Saida do Extensor
	else
		saida <= A; --Saida do Banco_Reg
	end if;

end process;
end arch;
