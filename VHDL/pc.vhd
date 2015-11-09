library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity pc is
port(
   entrada : in STD_LOGIC_VECTOR(0 to 31);
   clk,reset : in bit;
   saida : out STD_LOGIC_VECTOR(0 to 31)
);
end pc;

architecture arch of pc is
begin

process(clk)
begin
if(clk'event and clk = '1')then
   if(reset = '1')then
      saida <= "00000000000000000000000000000000";
   else
      saida <= entrada;
   end if;
end if;

end process;
end arch;
