library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity tb_bc is
end entity;

architecture arc_tb_bc of tb_bc is
--signal
signal clk_tb,clear_tb : bit;
signal inst_tb : STD_LOGIC_VECTOR(0 to 5);--Funct
signal op_tb : STD_LOGIC_VECTOR(0 to 5);
signal reg_dest_tb,orig_ula_tb,w_tb,r_tb : bit;
signal branch_tb : bit;-- Usado no mux2x1 para salto Beq
signal ula_op_tb : STD_LOGIC_VECTOR(0 to 2);

--component
component bc is
port(
	clk_bc,clear_bc : in bit;
	inst_bc : in STD_LOGIC_VECTOR(0 to 5);--Funct
	op_bc : in STD_LOGIC_VECTOR(0 to 5);
	reg_dest_bc,orig_ula,w_bc,r_bc : out bit;
	branch : out bit;-- Usado no mux2x1 para salto Beq
	ula_op_bc : out STD_LOGIC_VECTOR(0 to 2)
);
end component;

begin
B1 : bc port map(clk_tb,clear_tb,inst_tb,op_tb,reg_dest_tb,orig_ula_tb,w_tb,r_tb,branch_tb,ula_op_tb);

process 
begin
	
	clk_tb <='0';
	clear_tb <= '0';
	op_tb <= "000000";
	inst_tb <= "100000";--add
	wait for 5 ns;
	
	clk_tb <= '1';
	wait for 5 ns;
	
	clk_tb <= '0';--beq
	op_tb <= "000100";
	inst_tb <= "010010";
	wait for 5 ns;
	
	clk_tb <= '1';
	wait for 5 ns;
	
	clk_tb <= '0';--addi
	op_tb <= "001000";
	inst_tb <= "010100";
	wait for 5 ns;
	
	clk_tb <= '1';
	wait for 5 ns;
	
	clk_tb <= '0';
	op_tb <= "000000";
	inst_tb <= "101010";--slt
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
end arc_tb_bc;
