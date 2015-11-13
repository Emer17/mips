library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity mips is
port(
   clk : in bit;
   ender : in STD_LOGIC_VECTOR(0 to 31);
   valor : in STD_LOGIC_VECTOR(0 to 31)
);
end mips;

architecture arch of mips is
--signal
signal op1 : STD_LOGIC_VECTOR(0 to 5);
signal inst1 : STD_LOGIC_VECTOR(0 to 5); --arrumar depois
signal clear1,branch1,r1,w1,reg1,orig1,reset1 : bit;
signal ula_op : STD_LOGIC_VECTOR (0 to 2);

--component
component bc
port(
	clk_bc,clear_bc : in bit;
	inst_bc : in STD_LOGIC_VECTOR(0 to 5);--Funct
	op_bc : in STD_LOGIC_VECTOR(0 to 5);
	reg_dest_bc,orig_ula,w_bc,r_bc : out bit;
	branch : out bit;-- Usado no mux2x1 para salto Beq
	ula_op_bc : out STD_LOGIC_VECTOR(0 to 2)
);
end component;


component bo 
port(
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

branch1 <= '0';
reset1 <= '1';
--port map
U1: bc port map (clk,clear1,inst1,op1,reg1,orig1,w1,r1,branch1,ula_op);
U2: bo port map (clk,reg1,orig1,branch1,reset1,ula_op,ender,valor,w1,r1,clear1,op1,inst1);

end arch;

