library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

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
signal reg0,reg1,reg2,reg3 : std_logic_vector(31 downto 0); 				--$zero, $at, $v0, $v1
signal reg4,reg5,reg6,reg7 : std_logic_vector(31 downto 0); 				--$a0 - $a3
signal reg8,reg9,reg10,reg11,reg12,reg13,reg14,reg15 : std_logic_vector(31 downto 0); 	--$t0 - $t7
signal reg16,reg17,reg18,reg19,reg20,reg21,reg22,reg23 : std_logic_vector(31 downto 0); --$s0 - $s9
signal reg24,reg25,reg26,reg27 : std_logic_vector(31 downto 0); 			--$t8, $t9, $k0, $k1
signal reg28,reg29,reg30,reg31 : std_logic_vector(31 downto 0); 			--$gp, $sp, $fp, $ra
--Component







begin
process(clk)
begin
	if rising_edge(clk) then	        --Inicio do Teste de Leitura (borda de subida) entrada do Banco de REG
		if(reset = '1') then
			reg0 <=	"00000000000000000000000000000000";
			reg1 <= "00000000000000000000000000000001";
			reg2 <= "00000000000000000000000000000010";
			reg3 <= "00000000000000000000000000000011";
			reg4 <= "00000000000000000000000000000100";
			reg5 <= "00000000000000000000000000000101";
			reg6 <= "00000000000000000000000000000110";
			reg7 <= "00000000000000000000000000000111";
			reg8 <= "00000000000000000000000000001000";
			reg9 <= "00000000000000000000000000001001";
			reg10 <= "00000000000000000000000000001010";
			reg11 <= "00000000000000000000000000001011";
			reg12 <= "00000000000000000000000000001100";
			reg13 <= "00000000000000000000000000001101";
			reg14 <= "00000000000000000000000000001110";
			reg15 <= "00000000000000000000000000001111";
			reg16 <= "00000000000000000000000000010000";
			reg17 <= "00000000000000000000000000010001";
			reg18 <= "00000000000000000000000000010010";
			reg19 <= "00000000000000000000000000010011";
			reg20 <= "00000000000000000000000000010100";
			reg21 <= "00000000000000000000000000010101";
			reg22 <= "00000000000000000000000000010110";
			reg23 <= "00000000000000000000000000010111";
			reg24 <= "00000000000000000000000000011000";
			reg25 <= "00000000000000000000000000011001";
			reg26 <= "00000000000000000000000000011010";
			reg27 <= "00000000000000000000000000011011";
			reg28 <= "00000000000000000000000000011100";
			reg29 <= "00000000000000000000000000011101";
			reg30 <= "00000000000000000000000000011110";
			reg31 <= "00000000000000000000000000011111";
	
		elsif(rs_in = "00000") then 	--Inicio do Teste com RS
			rs_out <= reg0;
		elsif(rs_in = "00001") then
			rs_out <= reg1;
		elsif(rs_in = "00010") then
			rs_out <= reg2;
		elsif(rs_in = "00011") then
			rs_out <= reg3;
		elsif(rs_in = "00100") then
			rs_out <= reg4;
		elsif(rs_in = "00101") then
			rs_out <= reg5;
		elsif(rs_in = "00110") then
			rs_out <= reg6;
		elsif(rs_in = "00111") then
			rs_out <= reg7;
		elsif(rs_in = "01000") then
			rs_out <= reg8;
		elsif(rs_in = "01001") then
			rs_out <= reg9;
		elsif(rs_in = "01010") then
			rs_out <= reg10;
		elsif(rs_in = "01011") then
			rs_out <= reg11;
		elsif(rs_in = "01100") then
			rs_out <= reg12;
		elsif(rs_in = "01101") then
			rs_out <= reg13;
		elsif(rs_in = "01110") then
			rs_out <= reg14;
		elsif(rs_in = "01111") then
			rs_out <= reg15;
		elsif(rs_in = "10000") then
			rs_out <= reg16;
		elsif(rs_in = "10001") then
			rs_out <= reg17;
		elsif(rs_in = "10010") then
			rs_out <= reg18;
		elsif(rs_in = "10011") then
			rs_out <= reg19;
		elsif(rs_in = "10100") then
			rs_out <= reg20;
		elsif(rs_in = "10101") then
			rs_out <= reg21;
		elsif(rs_in = "10110") then
			rs_out <= reg22;
		elsif(rs_in = "10111") then
			rs_out <= reg23;
		elsif(rs_in = "11000") then
			rs_out <= reg24;
		elsif(rs_in = "11001") then
			rs_out <= reg25;
		elsif(rs_in = "11010") then
			rs_out <= reg26;
		elsif(rs_in = "11011") then
			rs_out <= reg27;
		elsif(rs_in = "11100") then
			rs_out <= reg28;
		elsif(rs_in = "11101") then
			rs_out <= reg29;
		elsif(rs_in = "11110") then
			rs_out <= reg30;
		elsif(rs_in = "11111") then
			rs_out <= reg31;
		end if;				--Fim do Teste com RS
		if(rt_in = "00000") then 	--Inicio do Teste com RS
			rt_out <= reg0;
		elsif(rt_in = "00001") then
			rt_out <= reg1;
		elsif(rt_in = "00010") then
			rt_out <= reg2;
		elsif(rt_in = "00011") then
			rt_out <= reg3;
		elsif(rt_in = "00100") then
			rt_out <= reg4;
		elsif(rt_in = "00101") then
			rt_out <= reg5;
		elsif(rt_in = "00110") then
			rt_out <= reg6;
		elsif(rt_in = "00111") then
			rt_out <= reg7;
		elsif(rt_in = "01000") then
			rt_out <= reg8;
		elsif(rt_in = "01001") then
			rt_out <= reg9;
		elsif(rt_in = "01010") then
			rt_out <= reg10;
		elsif(rt_in = "01011") then
			rt_out <= reg11;
		elsif(rt_in = "01100") then
			rt_out <= reg12;
		elsif(rt_in = "01101") then
			rt_out <= reg13;
		elsif(rt_in = "01110") then
			rt_out <= reg14;
		elsif(rt_in = "01111") then
			rt_out <= reg15;
		elsif(rt_in = "10000") then
			rt_out <= reg16;
		elsif(rt_in = "10001") then
			rt_out <= reg17;
		elsif(rt_in = "10010") then
			rt_out <= reg18;
		elsif(rt_in = "10011") then
			rt_out <= reg19;
		elsif(rt_in = "10100") then
			rt_out <= reg20;
		elsif(rt_in = "10101") then
			rt_out <= reg21;
		elsif(rt_in = "10110") then
			rt_out <= reg22;
		elsif(rt_in = "10111") then
			rt_out <= reg23;
		elsif(rt_in = "11000") then
			rt_out <= reg24;
		elsif(rt_in = "11001") then
			rt_out <= reg25;
		elsif(rt_in = "11010") then
			rt_out <= reg26;
		elsif(rt_in = "11011") then
			rt_out <= reg27;
		elsif(rt_in = "11100") then
			rt_out <= reg28;
		elsif(rt_in = "11101") then
			rt_out <= reg29;
		elsif(rt_in = "11110") then
			rt_out <= reg30;
		elsif(rt_in = "11111") then
			rt_out <= reg31;
		end if;				--Fim do Teste com RT e do Teste de Leitura
	elsif falling_edge(clk) then		--Teste de Escrita (Borda de descida) saida da ula
		if(rd_in = "00000") then	--Inicio do teste com RD
			 reg0 <= dados;
		elsif(rd_in = "00001") then
			 reg1 <= dados;
		elsif(rd_in = "00010") then
			 reg2 <= dados;
		elsif(rd_in = "00011") then
			 reg3 <= dados;
		elsif(rd_in = "00100") then
			 reg4 <= dados;
		elsif(rd_in = "00101") then
			 reg5 <= dados;
		elsif(rd_in = "00110") then
			 reg6 <= dados;
		elsif(rd_in = "00111") then
			 reg7 <= dados;
		elsif(rd_in = "01000") then
			 reg8 <= dados;
		elsif(rd_in = "01001") then
			 reg9 <= dados;
		elsif(rd_in = "01010") then
			 reg10 <= dados;
		elsif(rd_in = "01011") then
			 reg11 <= dados;
		elsif(rd_in = "01100") then
			 reg12 <= dados;
		elsif(rd_in = "01101") then
			 reg13 <= dados;
		elsif(rd_in = "01110") then
			 reg14 <= dados;
		elsif(rd_in = "01111") then
			 reg15 <= dados;
		elsif(rd_in = "10000") then
			 reg16 <= dados;
		elsif(rd_in = "10001") then
			 reg17 <= dados;
		elsif(rd_in = "10010") then
			 reg18 <= dados;
		elsif(rd_in = "10011") then
			 reg19 <= dados;
		elsif(rd_in = "10100") then
			 reg20 <= dados;
		elsif(rd_in = "10101") then
			 reg21 <= dados;
		elsif(rd_in = "10110") then
			 reg22 <= dados;
		elsif(rd_in = "10111") then
			 reg23 <= dados;
		elsif(rd_in = "11000") then
			 reg24 <= dados;
		elsif(rd_in = "11001") then
			 reg25 <= dados;
		elsif(rd_in = "11010") then
			 reg26 <= dados;
		elsif(rd_in = "11011") then
			 reg27 <= dados;
		elsif(rd_in = "11100") then
			 reg28 <= dados;
		elsif(rd_in = "11101") then
			 reg29 <= dados;
		elsif(rd_in = "11110") then
			 reg30 <= dados;
		elsif(rd_in = "11111") then
			 reg31 <= dados;
		end if;				--Fim do Teste com RD
	end if;					--Fim do Teste de Escrita
end process;
						--Post Map
end arch;
