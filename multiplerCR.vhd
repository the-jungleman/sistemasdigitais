library ieee;
use ieee.std_logic_1164.all;

entity multiplierCR is
	generic(N: positive := 4);
	port(   
	    a, b: in std_logic_vector(N-1 downto 0);
		y: out std_logic_vector(2*N-1 downto 0) 
	);
end entity;

architecture structure of multiplierCR is
	component fulladder1bit is
		port(
			cin, a, b: in std_logic;
			sum: out std_logic;
			cout: out std_logic
		);
	end component;
    type matriz2d is array(N-1 downto 0) of std_logic_vector(N downto 0);
	signal s, c, ab: matriz2d;
	-- para acessar, por exemplo, s[i,j], use: s(i)(j)
begin
    -- complete com comandos concorrentes(sugestao de estrutura abaixo. mude se achar melhor)
    
    -- gera produto de bits a.b
    
    -- colunas mais aa esquerda e mais aa direita
    
    -- primeira linha
    
    -- linhas do meio
    
    -- ultima linha e saidas
    
end architecture;