library ieee;
use ieee.std_logic_1164.all;
-- pg364

entity ManchesterEncoder is
	port(
		-- control inputs
		clock, reset: in std_logic;
		-- data inputs
		v, d: in std_logic;
		-- control outputs
		-- data outputs
		y: out std_logic
	);
end entity;

architecture studenttry of ManchesterEncoder is
	type State is (idle,s0a,s1a,s0b,s1b);-- COMPLETE
	signal currentState, nextState: State;
begin
	-- next-state logic (DO NOT CHANGE OR REMOVE THIS LINE)
	-- COMPLETE
	process(currentState,v,d)
	begin
	    if  currentState=idle   then
            nextState<=idle when    v='0'   else
                s0a when    v='1'   and d='0'   else
                s1a when    v='1'   and d='1';
	    elsif   currentState=s0a    then
	       nextState<=s0b;
	    elsif   currentState=s0b    then
	        nextState<=s0a  when    v='1'   and d='1'   else
	            s1a  when    v='1'   and d='1'  else
	            idle    when    v='0';
	    elsif   currentState<=s1a   then
	        nextState<=s1b;
	    elsif   currentState<=s1b   then
	        nextState<=s1a  when    v='1'   and d='1'   else
	            s0a  when    v='1'   and d='0'   else
	            idle;
	    end  if;
	  
	    
	-- end-next-state logic (DO NOT CHANGE OR REMOVE THIS LINE)
	
	
	-- memory register (DO NOT CHANGE OR REMOVE THIS LINE)
	-- COMPLETE
	process(clock) is
    begin
        if clear = '1' then
            currentState <= idle;  -- Estado inicial ao limpar
        elsif rising_edge(clock) then
            currentState <= nextState;
        end if;
    end process;
	-- memory register (DO NOT CHANGE OR REMOVE THIS LINE)
	
	
	-- output-logic (DO NOT CHANGE OR REMOVE THIS LINE)
    -- COMPLETE
    y<='1'   when    currentState=s0b  else
        '1' when    currentState=s1a    else
        '0';
    -- end-output-logic (DO NOT CHANGE OR REMOVE THIS LINE)
end architecture;





	