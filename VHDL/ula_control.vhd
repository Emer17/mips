library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity ula_control is
port(
   clk : in bit;
   op_cont : in STD_LOGIC_VECTOR(0 to 1);
   inst_cont : in STD_LOGIC_VECTOR(0 to 5);
   ula_op_cont : out STD_LOGIC_VECTOR(0 to 2)
);
end ula_control;

architecture arch of ula_control is
begin

process(clk)
begin
if rising_edge (clk) then
	if(op_cont = "10" and inst_cont = "100000") then --add
   		ula_op_cont <= "010"; --add
	elsif(op_cont = "10" and inst_cont = "101010") then --slt
   		ula_op_cont <= "111"; --slt
	elsif(op_cont = "10")then
   		ula_op_cont <= "010"; --addi
	elsif(op_cont = "01") then --beq
   		ula_op_cont <= "110"; --sub
	end if;
end if;

end process;
end arch;
