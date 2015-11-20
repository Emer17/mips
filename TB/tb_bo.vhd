library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity tb_bo is
end entity;

architecture arc_tb_bo of tb_bo is 
--signal
signal clk_tb,reg_dest_tb,orig_ula_tb,branch_tb,reset_tb : bit;
signal ula_op_tb : STD_LOGIC_VECTOR(0 to 2);
signal ender_tb : STD_LOGIC_VECTOR(0 to 31);
signal valor_tb : STD_LOGIC_VECTOR(0 to 31);
signal w_tb,r_tb: bit;
signal clear_mem_tb : bit;
signal op_tb : STD_LOGIC_VECTOR(0 to 5);
signal funct_ula_tb : STD_LOGIC_VECTOR(0 to 5);

--Component
component bo is port(
	clk_bo,reg_dest_bo,orig_ula_bo,branch_bo,reset_bo : in bit;
	ula_op_bo : in STD_LOGIC_VECTOR(0 to 2);
	ender_bo : in STD_LOGIC_VECTOR(0 to 31);
	valor_bo : in STD_LOGIC_VECTOR(0 to 31);
	w_bo,r_bo: in bit;
	clear_mem : out bit;
	op_bo : out STD_LOGIC_VECTOR(0 to 5);
	funct_ula_bo : out STD_LOGIC_VECTOR(0 to 5)

);
end component;

begin

process
begin

	clk_tb <='0';
	reset_tb <= '1';
	reg_dest_tb <= '0';
	orig_ula_tb <= '1';
	branch_tb <= '0';
	w_tb <= '1'; --Inicio do Modo Leitura
	r_tb <= '0';
	wait for 5 ns;
	clk_tb <= '1';
	wait for 5 ns;
	reset_tb <= '0';
	clk_tb <= '0';
	ender_tb <= "00000000000000000000000000100000"; --Add = 32(dec) no campo funct
	wait for 5 ns;
	
	clk_tb <= '1';
	ula_op_tb <="010";
	wait for 5 ns;
	
	clk_tb <= '0';
	w_tb <= '0';
	r_tb <= '1';
	ender_tb <= "00000010001100100100000000100000";
	wait for 5 ns;

	clk_tb <= '1';
	wait for 5 ns;

	clk_tb <= '0';
	wait for 5 ns;

	clk_tb <= '1';
	wait for 5 ns;

	clk_tb <= '0';
	wait for 5 ns;
	
	clk_tb <= '1';
	wait for 5 ns;

	clk_tb <= '0';
	wait;
	
end process;
U1: bo port map(clk_tb,reg_dest_tb,orig_ula_tb,branch_tb,reset_tb,ula_op_tb,ender_tb,valor_tb,w_tb,r_tb,clear_mem_tb,op_tb,funct_ula_tb);
end arc_tb_bo;
