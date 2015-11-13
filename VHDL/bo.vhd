library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity bo is port(
	clk_bo,reg_dest_bo,orig_ula_bo,branch_bo,reset_bo : in bit;
	ula_op_bo : in STD_LOGIC_VECTOR(0 to 2);
	ender_bo : in STD_LOGIC_VECTOR(0 to 31);
	valor_bo : in STD_LOGIC_VECTOR(0 to 31);
	w_bo,r_bo: in bit;
	clear_mem : out bit;
	op_bo : out STD_LOGIC_VECTOR(0 to 5);
	funct_ula_bo : out STD_LOGIC_VECTOR(0 to 5)

);
end entity;

architecture arc_bo of bo is
--signal
signal pc_in,pc_out,pc_out4 : STD_LOGIC_VECTOR(0 to 31);--Logica PC
signal ender_mem,inst_mem : STD_LOGIC_VECTOR(0 to 31);--Logica MEMORIA
signal clear_bc : bit;
signal op_bc_out,func_bc_out : STD_LOGIC_VECTOR(0 to 5);--Logica SEPARADOR
signal rs_in,rt_in,rd_in : STD_LOGIC_VECTOR(0 to 4);
signal ext_16 : STD_LOGIC_VECTOR(0 to 15);
signal ext_32 : STD_LOGIC_VECTOR(0 to 31);--Logica EXTENSOR
signal ext_desloc,pc_out8 : STD_LOGIC_VECTOR(0 to 31);--Logica SHIFTER and SOMADOR_DESLOC
signal dates_reg : STD_LOGIC_VECTOR(0 to 31);--Logica BANCO_REG
signal rs_out,rt_out : STD_LOGIC_VECTOR(0 to 31);
signal rt_in_ula : STD_LOGIC_VECTOR(0 to 31);--Logica MUX2x1_(BANCO_REG or EXTENSOR)
signal zero_ula,sel_zero : bit;--Logica MUX2x1_(SOMADOR or SOMADOR_DESLOC)


--component
component pc is -- PC
port(
   entrada : in STD_LOGIC_VECTOR(0 to 31);
   clk,reset : in bit;
   saida : out STD_LOGIC_VECTOR(0 to 31)
);
end component;

component memoria is -- MEMORIA
port(
   endereco : in STD_LOGIC_VECTOR(0 to 31);   --ver clock e w,r
   clk,reset,w_mem,r_mem : in bit;
   clear_mem : out bit;
   instrucao : out STD_LOGIC_VECTOR(0 to 31)
);
end component;

component somador is -- SOMADOR
port(
   pc : in STD_LOGIC_VECTOR(0 to 31);
   clk : in bit;
   saida : out STD_LOGIC_VECTOR(0 to 31)
);
end component;

component mux2x1 is -- MUX 2X1
port(
	seletor : in bit;
	A : in STD_LOGIC_VECTOR(0 to 31);--Saida do Banco_Reg
	B : in STD_LOGIC_VECTOR(0 to 31);--Saida do Extensor
	saida: out STD_LOGIC_VECTOR(0 to 31)--Entrada da Ula
);
end component;

component separador is -- SEPARADOR
port(
   sel_mux : in bit;
   instrucao : in STD_LOGIC_VECTOR(0 to 31);
   op_bc,func_ula_control : out STD_LOGIC_VECTOR(0 to 5);
   rs,rt,rd : out STD_LOGIC_VECTOR(0 to 4);
   ext : out STD_LOGIC_VECTOR(0 to 15)
);
end component;

component banco_reg is -- BANCO REGISTRADORES
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

component ula is -- ULA
port(
	clk : in bit;
	A : in STD_LOGIC_VECTOR(0 to 31);
	B : in STD_LOGIC_VECTOR(0 to 31);
	op : in STD_LOGIC_VECTOR(0 to 2);
	zero : out bit;
	saida: out STD_LOGIC_VECTOR(0 to 31)
	);
end component;

component extensor is -- EXTENSOR
port(
   clk : in bit;
   entrada : in STD_LOGIC_VECTOR(0 to 15);
   saida : out STD_LOGIC_VECTOR(0 to 31)
);
end component;

component shifter is -- SHIFTER
port(
	entrada : in STD_LOGIC_VECTOR(0 to 31);
	saida : out STD_LOGIC_VECTOR(0 to 31)
	);
end component;

component somador_desloc is -- SOMADOR DESLOCAMENTO
port(
	clk : in bit;
	A : in STD_LOGIC_VECTOR(0 to 31);
	B : in STD_LOGIC_VECTOR(0 to 31);
	saida : out STD_LOGIC_VECTOR(0 to 31)
	);
end component;

-- Port Map
begin
--Busca da Instrução
U1: pc port map(pc_in,clk_bo,reset_bo,pc_out);
U2: somador port map(pc_out,clk_bo,pc_out4);
U3: memoria port map(ender_mem,clk_bo,reset_bo,w_bo,r_bo,clear_bc,inst_mem);
U4: separador port map(reg_dest_bo,inst_mem,op_bc_out,func_bc_out,rs_in,rt_in,rd_in,ext_16);

--Logica da Proxima Instrução
U5: extensor port map(clk_bo,ext_16,ext_32);
U6: shifter port map(ext_32,ext_desloc);
U7: somador_desloc port map(clk_bo,pc_out4,ext_desloc,pc_out8);

--Busca dos dados
U8: banco_reg port map(clk_bo,reset_bo,rs_in,rt_in,rd_in,dates_reg,rs_out,rt_out);
U9: mux2x1 port map(orig_ula_bo,rt_out,ext_32,rt_in_ula);

--Calculos na ULA
U10 : ula port map(clk_bo,rs_out,rt_in_ula,ula_op_bo,zero_ula,dates_reg);

--Proximo Valor do PC
U11: mux2x1 port map(sel_zero,pc_out4,pc_out8,pc_in);

process(clk_bo)
begin
if rising_edge(clk_bo) then
	--if(w_bo = '1') then
		ender_mem <= ender_bo;
	--else
		--ender_mem <= pc_out;
	--end if;
	sel_zero <= zero_ula and branch_bo;
end if;

end process;
end arc_bo;
