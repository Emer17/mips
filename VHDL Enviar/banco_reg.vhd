--Marcelo e Emerson
--Implementa o Banco de Registradores onde os 32 registradores recebem os valores de 0 a 31
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
--use IEEE.STD_LOGIC_ARITH.all;
--use IEEE.std_logic_arith.UNSIGNED;
--use IEEE.NUMERIC_STD.UNSIGNED;

entity banco_reg is
port(
	clk,reset : in bit;
	rs_in : in STD_LOGIC_VECTOR(0 to 4);
	rt_in : in STD_LOGIC_VECTOR(0 to 4);
	rd_in : in STD_LOGIC_VECTOR(0 to 4);
	dados : in STD_LOGIC_VECTOR(0 to 31);
	rs_out : out STD_LOGIC_VECTOR(0 to 31);
	rt_out : out STD_LOGIC_VECTOR(0 to 31)
);
end banco_reg;

architecture arch of banco_reg is
--signal
type registradores is array(0 to 31) of std_logic_vector(31 downto 0);
signal regs : registradores;
signal prt,prs,prd : integer;

begin
process(clk)
begin
	if rising_edge(clk) then	        --Inicio do Teste de Leitura (borda de subida) entrada do Banco de REG
		if(reset = '1') then
			prt <= 0;
			prd <= 0;
			prs <= 0;
			regs(0) <=	"00000000000000000000000000000000";
			regs(1) <= "00000000000000000000000000000001";
			regs(2) <= "00000000000000000000000000000010";
			regs(3) <= "00000000000000000000000000000011";
			regs(4) <= "00000000000000000000000000000100";
			regs(5) <= "00000000000000000000000000000101";
			regs(6) <= "00000000000000000000000000000110";
			regs(7) <= "00000000000000000000000000000111";
			regs(8) <= "00000000000000000000000000001000";
			regs(9) <= "00000000000000000000000000001001";
			regs(10) <= "00000000000000000000000000001010";
			regs(11) <= "00000000000000000000000000001011";
			regs(12) <= "00000000000000000000000000001100";
			regs(13) <= "00000000000000000000000000001101";
			regs(14) <= "00000000000000000000000000001110";
			regs(15) <= "00000000000000000000000000001111";
			regs(16) <= "00000000000000000000000000010000";
			regs(17) <= "00000000000000000000000000010001";
			regs(18) <= "00000000000000000000000000010010";
			regs(19) <= "00000000000000000000000000010011";
			regs(20) <= "00000000000000000000000000010100";
			regs(21) <= "00000000000000000000000000010101";
			regs(22) <= "00000000000000000000000000010110";
			regs(23) <= "00000000000000000000000000010111";
			regs(24) <= "00000000000000000000000000011000";
			regs(25) <= "00000000000000000000000000011001";
			regs(26) <= "00000000000000000000000000011010";
			regs(27) <= "00000000000000000000000000011011";
			regs(28) <= "00000000000000000000000000011100";
			regs(29) <= "00000000000000000000000000011101";
			regs(30) <= "00000000000000000000000000011110";
			regs(31) <= "00000000000000000000000000011111";
		elsif (reset = '0') then	--Inicio do Teste com RS e RT
			prs <= to_integer(unsigned(rs_in));
			rs_out <= regs(prs);
			prt <= to_integer(unsigned(rt_in));
			rt_out <= regs(prt);	--Fim do Teste com RS e RT
	elsif falling_edge(clk) then	--Teste de Escrita (Borda de descida) saida da ula
			prd <= to_integer(unsigned(rd_in));
			regs(prd) <= dados;
		end if;				--Fim do Teste de Escrita
	end if;
end process;
end arch;
