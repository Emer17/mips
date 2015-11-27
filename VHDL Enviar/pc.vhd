--Marcelo e Emerson
--Implementa o Contador de Programa responsavel por controlar a ordem em que as instruções são executadas
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity pc is
port(
   entrada : in STD_LOGIC_VECTOR(0 to 31);
   reset : in bit;
   saida : out STD_LOGIC_VECTOR(0 to 31)
);
end pc;

architecture arch of pc is
begin

process
begin
   if(reset = '1')then
      saida <= "00000000000000000000000000000000";
   else
      saida <= entrada;
   end if;
end process;
end arch;
