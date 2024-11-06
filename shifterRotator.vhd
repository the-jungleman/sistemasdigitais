-- COMPLETE COM O NOME COMPLETO DOS ALUNOS QUE FAZEM ESTA AVALIACAO
-- Aluno 1: Vitor Pedrosa Brito dos Santos
-- Aluno 2:

library ieee;
use ieee.std_logic_1164.all;

entity shifterRotator is
	generic(
		width: positive;
		isShifter: boolean;
		isLogical: boolean;
		toLeft: boolean;
		bitsToShift: positive
	);
	port(
		input: in std_logic_vector(width-1 downto 0);
		output: out std_logic_vector(width-1 downto 0)
	);
	begin
		assert (bitsToShift < width) severity error;
end entity;

architecture behav of shifterRotator is
    signal  shifted:    std_logic_vector(width-1    downto  0);
    signal  rotaded:    std_logic_vector(width-1    downto  0): 
begin
    rotated<=
    (input(width-bitsToshift-1 downto  0)& input(width-1   downto  width-bitsToShift))when(toLeft=true)else 
             (input(bitsToShift-1   downto  0)& input(widht-1   downto  bitsToShift));
    shifted<=
    (input(width-bitsToShift-1  downto  0)& (others=>'0'))when(toLeft=true  and isLogical=true)else 
    ((others=>'0')& input(width-1   downto  bitsToShift))when(toLeft=false  and isLogical=true)else
    (input(width-1)&    input(width-1   downto  bitsToShift))when(toLeft=false  and isLogical=false)else
    (input(width-bitsToShift-1  downto  0)&(others=>'0'));
    
    output<=shifted when    isShifter=true  else    rotated;
end architecture; 
