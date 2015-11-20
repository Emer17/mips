library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity TB_tbit is 
end entity;

architecture arc_TB of TB_tbit is
signal endereco,saida,dados1,extend,ula_in : std_logic_vector(0 to 31);
signal t_clk, t_w, t_r, reset, clear, selecao,orig_ula,zero1 : bit;
signal op1, funct1 : std_logic_vector(0 to 5);
signal rs1,rt1,rd1 : std_logic_vector(0 to 4);
signal ext : STD_LOGIC_VECTOR(0 to 15);
signal oper : STD_LOGIC_VECTOR(0 to 2);
signal rs_out,rt_out : STD_LOGIC_VECTOR(0 to 31);

component memoria is
port(
   endereco : in STD_LOGIC_VECTOR(0 to 31);   --ver clock e w,r
   clk,reset,w_mem,r_mem : in bit;
   clear_mem : out bit;
   instrucao : out STD_LOGIC_VECTOR(0 to 31)
);
end component;

component separador is
port(
   sel_mux : in bit;
   instrucao : in STD_LOGIC_VECTOR(0 to 31);
   op_bc,func_ula_control : out STD_LOGIC_VECTOR(0 to 5);
   rs,rt,rd : out STD_LOGIC_VECTOR(0 to 4);
   ext : out STD_LOGIC_VECTOR(0 to 15)
);
end component;

component banco_reg is
port(
	clk,reset : in bit;
	rs_in : in STD_LOGIC_VECTOR(0 to 4);
	rt_in : in STD_LOGIC_VECTOR(0 to 4);
	rd_in : in STD_LOGIC_VECTOR(0 to 4);
	dados : in STD_LOGIC_VECTOR(0 to 31);
	rs_out : out STD_LOGIC_VECTOR(0 to 31);
	rt_out : out STD_LOGIC_VECTOR(0 to 31)
);
end component;

component extensor is
port(
   clk : in bit;
   entrada : in STD_LOGIC_VECTOR(0 to 15);
   saida : out STD_LOGIC_VECTOR(0 to 31)
);
end component;

component mux2x1 is
port(
	seletor : in bit;
	A : in STD_LOGIC_VECTOR(0 to 31);--Saida do Banco_Reg
	B : in STD_LOGIC_VECTOR(0 to 31);--Saida do Extensor
	saida: out STD_LOGIC_VECTOR(0 to 31)--Entrada da Ula
);
end component;

component ula is 
port(
	clk : in bit;
	A : in STD_LOGIC_VECTOR(0 to 31);
	B : in STD_LOGIC_VECTOR(0 to 31);
	op : in STD_LOGIC_VECTOR(0 to 2);
	zero : out bit;
	saida: out STD_LOGIC_VECTOR(0 to 31)
	);
end component;

begin
U1 : memoria port map(endereco,t_clk,reset,t_w,t_r,clear,saida);
U2 : separador port map(selecao,saida,op1,funct1,rs1,rt1,rd1,ext);
U3 : banco_reg port map(t_clk,reset,rs1,rt1,rd1,dados1,rs_out,rt_out);
U4 : extensor port map(t_clk,ext,extend);
U5 : mux2x1 port map(orig_ula,rt_out,extend,ula_in);
U : ula port map(t_clk,rs_out,ula_in,oper,zero1,dados1);
process
begin
	
	reset <= '1';
	selecao <= '1';
	orig_ula <= '0';
	wait for 5 ns;
	t_clk <='0';
	wait for 5 ns;
	t_clk <= '1';
	wait for 5 ns;
	reset <= '0';
	t_clk <= '0';
	t_w <= '1'; --Inicio do Modo Leitura
	wait for 5 ns;

	t_clk <= '1';
	endereco <= "00010000000000000000000000000000"; --Beq = 4(dec) no campo op
	wait for 5 ns;
	t_clk <= '0';
	wait for 5 ns;

	t_clk <= '1';
	endereco <= "00100000000000000000000000000000"; --Addi = 8(dec) no campo op
	wait for 5 ns;
	t_clk <= '0';
	wait for 5 ns;

	t_clk <= '1';	
	endereco <= "00000000000000000000000000100000"; --Add = 32(dec) no campo funct
	wait for 5 ns;
	t_clk <= '0';
	wait for 5 ns;

	t_clk <= '1';
	endereco <= "00000000000000000000000000101010"; --Slt = 42(dec) no campo funct
	wait for 5 ns;
	t_clk <= '0';
	t_w <= '0';--Fim do Modo Escrita
	t_r <= '1';--Inicio do Modo Leitura
	wait for 5 ns;
	
	t_clk <= '1';
	endereco <= "00100010010100010000000000011001";--Addi
	orig_ula <= '1';
	oper <= "010";
	wait for 5 ns;
	t_clk <= '0';
	wait for 5 ns;

	t_clk <= '1';
	endereco <= "00000000000000000000000000100010";--Sub = 34(dec) no campo funct
	orig_ula <= '0';
	oper <= "000";
	wait for 5 ns;
	t_clk <= '0';
	wait for 5 ns;

	t_clk <= '1';
	endereco <= "00000010010100111000100000101010";--Slt
	oper <= "111";
	wait for 5 ns;
	t_clk <= '0';
	wait;
	
end process;
end arc_TB;
