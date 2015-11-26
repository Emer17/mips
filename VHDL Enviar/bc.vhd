library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity bc is
port(
	clk_bc,clear_bc : in bit;
	inst_bc : in STD_LOGIC_VECTOR(0 to 5);--Funct
	op_bc : in STD_LOGIC_VECTOR(0 to 5);
	reg_dest_bc,orig_ula,w_bc,r_bc : out bit;
	branch : out bit;-- Usado no mux2x1 para salto Beq
	ula_op_bc : out STD_LOGIC_VECTOR(0 to 2)
);
end bc;

architecture arch of bc is
--signal
signal ula_op : STD_LOGIC_VECTOR(0 to 1);
signal ula_op_out : STD_LOGIC_VECTOR(0 to 2);

--component
component ula_control is
port(
	clk_ula : in bit;
	op_cont : in STD_LOGIC_VECTOR(0 to 1);
	inst_cont : in STD_LOGIC_VECTOR(0 to 5);
	ula_op_cont : out STD_LOGIC_VECTOR(0 to 2)
);
end component;

begin
U1: ula_control port map (clk_bc,ula_op,inst_bc,ula_op_out);
process(clk_bc)
begin
if rising_edge(clk_bc) then
	if(op_bc = "000000") then --add ou slt
		reg_dest_bc <= '1';  --mux : seleciona o que vai para o rd
		ula_op <= "10";
		orig_ula <= '0';
		branch <= '0';
	elsif(op_bc = "000100") then --se for BEQ
		reg_dest_bc <= '1'; --devia ser X
		ula_op <= "01";
		orig_ula <= '0';
		branch <= '1';
	elsif(op_bc = "001000")then  --addi
		ula_op_bc <= "010";
		reg_dest_bc <= '0';
		orig_ula <= '1';
		branch <= '0';
	end if;
	if(clear_bc = '1')then
		w_bc <= '1';
		r_bc <= '0';
   	else
		 w_bc <= '0';
	  	r_bc <= '1';
	end if;
end if;

ula_op_bc <= ula_op_out;

end process;
end arch;
