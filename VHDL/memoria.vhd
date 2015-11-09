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
   op, funct : out std_logic_vector(0 to 5);
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
		if (endereco(0 to 5) = "000000")then
			if (reg1 = "00000000000000000000000000000000") then
				reg1 <= endereco;
			elsif (reg2 = "00000000000000000000000000000000") then
				if (endereco /= reg1) then
					reg2 <= endereco;
				end if;
			elsif (reg3 = "00000000000000000000000000000000") then
				if (endereco /= reg1 and endereco /= reg2) then
					reg3 <= endereco;
				end if;
			elsif (reg4 = "00000000000000000000000000000000") then
				if(endereco /= reg1 and endereco /= reg2 and endereco /= reg3)then
					reg4 <= endereco;
					clear_mem <= '0';
				end if;
			end if;
		elsif (endereco(0 to 5) /= "000000") then
			if(reg1 = "00000000000000000000000000000000")then
				reg1 <= endereco;
			elsif(reg2 = "00000000000000000000000000000000")then
				if(endereco /= reg1)then
					reg2 <= endereco;
				end if;
			elsif(reg3 = "00000000000000000000000000000000")then
				if (endereco /= reg1 and endereco /= reg2) then
					reg3 <= endereco;
				end if;
			elsif(reg4 = "00000000000000000000000000000000")then
				if(endereco /= reg1 and endereco /= reg2 and endereco /= reg3)then
					reg4 <= endereco;
					clear_mem <= '0';
				end if;
			end if;
		end if; --Fim do Modo Escrita
	elsif (r_mem = '1')	then --Inicio do Modo Leitura
		if (endereco(0 to 5) = "000000")then
			if (endereco(26 to 31) = reg1(26 to 31)) then
				instrucao <= reg1;
				op <= reg1(0 to 5);
				funct <= reg1(26 to 31);
			elsif (endereco(26 to 31) = reg2(26 to 31)) then
				instrucao <= reg2;
				op <= reg2(0 to 5);
				funct <= reg2(26 to 31);
			elsif (endereco(26 to 31) = reg3(26 to 31)) then
				instrucao <= reg3;
				op <= reg2(0 to 5);
				funct <= reg2(26 to 31);
			elsif (endereco(26 to 31) = reg4(26 to 31)) then
				instrucao <= reg4;
				op <= reg4(0 to 5);
				funct <= reg4(26 to 31);
			else instrucao <= "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU"; --Saida quando a instrução é invalida, não exite na memoria
					op <= "UUUUUU";
					funct <= "UUUUUU";
			end if;
		elsif (endereco(0 to 5) /= "000000") then
			if (endereco(0 to 5) = reg1(0 to 5)) then
				instrucao <= reg1;
				op <= reg1(0 to 5);
				funct <= reg1(26 to 31);
			elsif (endereco(0 to 5) = reg2(0 to 5)) then
				instrucao <= reg2;
				op <= reg2(0 to 5);
				funct <= reg2(26 to 31);
			elsif (endereco(0 to 5) = reg3(0 to 5)) then
				instrucao <= reg3;
				op <= reg3(0 to 5);
				funct <= reg3(26 to 31);
			elsif (endereco(0 to 5) = reg4(0 to 5)) then
				instrucao <= reg4;
				op <= reg4(0 to 5);
				funct <= reg4(26 to 31);
			else instrucao <= "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU"; --Saida quando a instrução é invalida, não exite na memoria
					op <= "UUUUUU";
					funct <= "UUUUUU";
			end if;
		end if; --Fim do Modo Leitura
	end if;
end if;
end process;
end arch;
