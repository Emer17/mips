library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity memoria is
port(
   endereco : in STD_LOGIC_VECTOR(0 to 31);   --ver clock e w,r
   clk,reset,w_mem,r_mem : in bit;
   clear_mem : out bit;
   instrucao : out STD_LOGIC_VECTOR(0 to 31)
);
end memoria;

architecture arch of memoria is
--signal
signal reg1,reg2,reg3,reg4 : STD_LOGIC_VECTOR(0 to 31);

begin

process(clk)
begin
if rising_edge(clk) then
	if reset = '1' then --Função Reset
		reg1 <= "00000000000000000000000000000000";
		reg2 <= "00000000000000000000000000000000";
		reg3 <= "00000000000000000000000000000000";
		reg4 <= "00000000000000000000000000000000";
		clear_mem <= '1';
	elsif (w_mem = '1') then --Inicio do Modo Escrita
		if (reg1 = "00000000000000000000000000000000") then
			reg1 <= endereco;
		elsif (reg2 = "00000000000000000000000000000000") then
			reg2 <= endereco;
		elsif (reg3 = "00000000000000000000000000000000") then
			reg3 <= endereco;
		elsif (reg4 = "00000000000000000000000000000000") then
			reg4 <= endereco;
			clear_mem <= '0';
		end if; --Fim do Modo Escrita
	elsif (r_mem = '1')	then --Inicio do Modo Leitura
		if (endereco(26 to 31) = "000000")then
			instrucao <= reg1;
		elsif (endereco(26 to 31) = "000100") then
			instrucao <= reg2;
		elsif (endereco(26 to 31) = "001000") then
			instrucao <= reg3;
		elsif (endereco(26 to 31) = "010000") then
				instrucao <= reg4;
		else instrucao <= "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU"; --Saida quando a instrução é invalida, não exite na memoria
		end if;
	end if; --Fim do Modo Leitura
end if;
end process;
end arch;
