library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity tb_pc is
end tb_pc;

architecture arch of tb_pc is
--signal
signal t_entrada1,t_saida1,t_entrada2,t_saida2,instrucao1 : STD_LOGIC_VECTOR(0 to 31);
signal t_clk,t_reset,t_w,t_r : bit;

--component
component pc is
port(
   entrada : in STD_LOGIC_VECTOR(0 to 31);
   clk,reset : in bit;
   saida : out STD_LOGIC_VECTOR(0 to 31)
);
end component;

component somador is
port(
   pc : in STD_LOGIC_VECTOR(0 to 31);
   clk : in bit;
   saida : out STD_LOGIC_VECTOR(0 to 31)
);
end component;

component memoria is
port(
   endereco : in STD_LOGIC_VECTOR(0 to 31);   --ver clock e w,r
   clk : in bit;
   w_mem,r_mem : out bit;
   instrucao : out STD_LOGIC_VECTOR(0 to 31)
);
end component;

begin
--port map
U1: pc port map (t_entrada1,t_clk,t_reset,t_saida1);
U2: somador port map (t_entrada2,t_clk,t_saida2);
U3: memoria port map (t_saida2,t_clk,t_w,t_r,instrucao1);
t_entrada2 <= t_saida1;
t_entrada1 <= t_saida2;
process
begin

wait for 1 ns;
t_clk <= '1';
--t_entrada1 <= "00000000000000000000000000000000";
t_reset <= '1';

wait for 5 ns;
t_clk <= '0';
t_reset <= '0';

wait for 5 ns;
t_clk <= '1';

wait for 5 ns;

end process;
end arch;
