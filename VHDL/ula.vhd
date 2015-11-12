library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity ula is 
port(
	clk : in bit;
	A : in STD_LOGIC_VECTOR(0 to 31);
	B : in STD_LOGIC_VECTOR(0 to 31);
	op : in STD_LOGIC_VECTOR(0 to 2);
	zero : out bit;
	saida: out STD_LOGIC_VECTOR(0 to 31)
	);
end ula;

architecture arch of ula is
signal aux_zero : STD_LOGIC_VECTOR(0 to 31);
begin
process(clk)
begin
if rising_edge (clk) then
	if(op = "010")then --add ou addi
		saida <= A+B;
	elsif(op = "111")then --slt
		if(A < B)then
			saida <= "00000000000000000000000000000001";  --1
		else
			saida <= "00000000000000000000000000000000";  --0
		end if;
	elsif(op = "110")then --beq
	saida <= A-B;
	aux_zero <= A-B;
	end if;
end if;

end process;
process(aux_zero) --Verifica zero, usado para a Instrução Beq
begin
	if(aux_zero="00000000000000000000000000000000") then
		zero <= '1';
	else
		zero <= '0';
	end if;
end process;
end arch;
