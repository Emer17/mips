library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity separador is
port(
   sel_mux : in bit;
   instrucao : in STD_LOGIC_VECTOR(0 to 31);
   op_bc,func_ula_control : out STD_LOGIC_VECTOR(0 to 5);
   rs,rt,rd : out STD_LOGIC_VECTOR(0 to 4);
   ext : out STD_LOGIC_VECTOR(0 to 15)
);
end separador;

architecture arch of separador is
begin
process(instrucao)
begin
op_bc <= instrucao(0 to 5); --op que vai pro bc
func_ula_control <= instrucao (26 to 31); --func, vai pro bc(ula_control)
rs <= instrucao (6 to 10);
rt <= instrucao (11 to 15);
if(sel_mux = '0')then
   rd <= instrucao (11 to 15);
else
   rd <= instrucao (16 to 20);
end if;
ext <= instrucao (16 to 31); --vai pro extensor
end process;
end arch;
