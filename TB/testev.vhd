library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity testev is
port(
	clk : in bit;
	reg0,reg1 : out std_logic_vector(31 downto 0)
);
end entity;

architecture arc_test of testev is
type regs is array(0 to 31) of std_logic_vector(31 downto 0);
signal registradores : regs; 	

begin
process(clk)
begin
	registradores(0) <= "00000000000000000000000000000000";
	registradores(1) <= "00000000000000000000000000000001";
	reg0 <= registradores(0);
	reg1 <= registradores(1);
	
end process;
end arc_test;
