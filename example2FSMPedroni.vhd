library ieee;
use ieee.std_logic_1164.all;

entity example2FSMPedroni is
	port(
		-- control inputs
		clock, reset: in std_logic;
		-- data inputs
		inp: in std_logic;
		-- control outputs
		-- data outputs
		outp: out std_logic_vector(1 downto 0)
	);
end entity;

architecture archstudenttryPg195 of example2FSMPedroni is
	type State is (state1,state2,state3,state4);
	signal currentState, nextState: State;
begin
	-- next-state logic (DO NOT CHANGE OR REMOVE THIS LINE)
	LPE:    process(inp,reset,currentState)is
	    begin
	    if  reset='1'   then
	        nextState<=state1;
	    else
	        if  currentState=state1 then
	            if  inp='1' then
	                nextState<=state2;
	            end if;        
	        elsif   currentState=state2 then
	            if  inp='0' then
	                nextState<=state3;
    	        else
	                nextState<=state4;
	            end if;
	        elsif   currentState=state3 then
	            if  inp='0' then
	                nextState<=state3;
    	        else
	                nextState<=state4;
	            end if;
	        elsif   currentState=state4 then
	            if  inp='0' then
	                nextState<=state2;
    	        else
	                nextState<=state1;
	            end if;
	       end  if;
	   end  if;
    end process;
	-- end-next-state logic (DO NOT CHANGE OR REMOVE THIS LINE)
	
	
	-- memory register (DO NOT CHANGE OR REMOVE THIS LINE)
	--process (clock,reset)is
	--begin
	   -- if  rising_edge(clock)then
	    --    currentState<=nextState;
	  --  end if;
	--end process;
	memory_register: process(clock)
	begin
	    if  rising_edge(clock)  then
	        currentState<=nextState;
	    end if;
	end process;
	-- COMPLETE
	-- memory register (DO NOT CHANGE OR REMOVE THIS LINE)
	
	
	-- output-logic (DO NOT CHANGE OR REMOVE THIS LINE)
	outp<="00"  when    currentState=state1 else
    "01"    when    currentState=state2 else
    "10"    when    currentState=state3 else
    "11"    when    currentState=state4 else
    "00";
    -- COMPLETE
    -- end-output-logic (DO NOT CHANGE OR REMOVE THIS LINE)
end architecture;
