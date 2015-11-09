library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity TB_tbit is 
end entity;

architecture arc_TB of TB_tbit is
signal endereco,saida : std_logic_vector(0 to 31);
signal t_clk,t_w,t_r,reset,clear : bit;
signal op1, funct1 : std_logic_vector(0 to 5);

component memoria is
port(
   endereco : in STD_LOGIC_VECTOR(0 to 31);   --ver clock e w,r
   clk,reset,w_mem,r_mem : in bit;
   clear_mem : out bit;
   op, funct : out std_logic_vector(0 to 5);
   instrucao : out STD_LOGIC_VECTOR(0 to 31)
);
end component;
begin
U1 : memoria port map(endereco,t_clk,reset,t_w,t_r,clear,op1,funct1,saida);
process
begin
	t_clk <='0';
	reset <= '1';
	wait for 5 ns;
	t_clk <= '1';
	wait for 5 ns;
	reset <= '0';
	t_clk <= '0';
	t_w <= '1'; --Inicio do Modo Leitura
	wait for 5 ns;

	t_clk <= '1';
	endereco <= "00010000000000000000000000000000"; --Beq = 4(dec) no campo op
	wait for 5 ns;
	t_clk <= '0';
	wait for 5 ns;

	t_clk <= '1';
	endereco <= "00100000000000000000000000000000"; --Addi = 8(dec) no campo op
	wait for 5 ns;
	t_clk <= '0';
	wait for 5 ns;

	t_clk <= '1';	
	endereco <= "00000000000000000000000000100000"; --Add = 32(dec) no campo funct
	wait for 5 ns;
	t_clk <= '0';
	wait for 5 ns;

	t_clk <= '1';
	endereco <= "00000000000000000000000000101010"; --Slt = 42(dec) no campo funct
	wait for 5 ns;
	t_clk <= '0';
	t_w <= '0';--Fim do Modo Escrita
	t_r <= '1';--Inicio do Modo Leitura
	wait for 5 ns;
	
	t_clk <= '1';
	endereco <= "00100000000000000000000000000000";--Addi
	wait for 5 ns;
	t_clk <= '0';
	wait for 5 ns;

	t_clk <= '1';
	endereco <= "00000000000000000000000000100010";--Sub = 34(dec) no campo funct
	wait for 5 ns;
	t_clk <= '0';
	wait for 5 ns;

	t_clk <= '1';
	endereco <= "00000000000000000000000000101010";--Slt
	wait for 5 ns;
	t_clk <= '0';
	wait;
	
end process;
end arc_TB;