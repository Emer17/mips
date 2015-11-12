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

component banco_reg
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

component extensor
port(
   clk : in bit;
   entrada : in STD_LOGIC_VECTOR(0 to 15);
   saida : out STD_LOGIC_VECTOR(0 to 31)
);
end component;


component memoria
port(
   endereco : in STD_LOGIC_VECTOR(0 to 31);
   clk,reset,w_mem,r_mem : in bit;
   clear_mem : out bit;
   instrucao : out STD_LOGIC_VECTOR(0 to 31)
);
end component;


component mux2x1
port(
	seletor : in bit;
	A : in STD_LOGIC_VECTOR(0 to 31);
	B : in STD_LOGIC_VECTOR(0 to 31);
	saida: out STD_LOGIC_VECTOR(0 to 31)
);
end component;

component pc
port(
   entrada : in STD_LOGIC_VECTOR(0 to 31);
   clk,reset : in bit;
   saida : out STD_LOGIC_VECTOR(0 to 31)
);
end component;

component reg_mem
port(
		entry : in STD_LOGIC_VECTOR(0 to 31);
		clk,reset : in bit;
		saida : out STD_LOGIC_VECTOR(0 to 31) 
	);
end component;

component separador
port(
   sel_mux : in bit;
   instrucao : in STD_LOGIC_VECTOR(0 to 31);
   op_bc,func_ula_control : out STD_LOGIC_VECTOR(0 to 5);
   rs,rt,rd : out STD_LOGIC_VECTOR(0 to 4);
   ext : out STD_LOGIC_VECTOR(0 to 15)
);
end component;

component shifter
port(
	entrada : in STD_LOGIC_VECTOR(0 to 31);
	saida : out STD_LOGIC_VECTOR(0 to 31)
	);
end component;

component somador
port(
   pc : in STD_LOGIC_VECTOR(0 to 31);
   clk : in bit;
   saida : out STD_LOGIC_VECTOR(0 to 31)
);
end component;

component somador_desloc
port(
	clk : in bit;
	A : in STD_LOGIC_VECTOR(0 to 31);
	B : in STD_LOGIC_VECTOR(0 to 31);
	saida : out STD_LOGIC_VECTOR(0 to 31)
	);
end component;

component ula 
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
--port map

process(clk_bo)
begin

end process;
end arch;
