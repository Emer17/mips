library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity extensor is
port(
   entrada : in STD_LOGIC_VECTOR(0 to 15);
   saida : out STD_LOGIC_VECTOR(0 to 31)
);
end extensor;

architecture arch of extensor is
begin
process
begin
   if(entrada(0) = '0')then
      saida <= "0000000000000000"&entrada;
   else
      saida <= "1111111111111111"&entrada;
   end if;
end process;
end arch;
