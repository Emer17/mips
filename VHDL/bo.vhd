library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity bo is
port(
   clk_bo,reg_dest_bo,orig_ula_bo,w_bo,r_bo : in bit;
   ula_op_bo : in STD_LOGIC_VECTOR(0 to 2);
   ender_bo : in STD_LOGIC_VECTOR(0 to 31);
   valor_bo : in STD_LOGIC_VECTOR(0 to 31);
   op_bo : out STD_LOGIC_VECTOR(0 to 5);
   inst_bo : out STD_LOGIC_VECTOR(0 to 5)
);
end bo;

architecture arch of bo is
--signal

--component
begin
--port map

process(clk_bo)
begin

end process;
end arch;
