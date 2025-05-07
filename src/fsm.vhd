library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM is
port (
 clock: in std_logic; 
 reset: in std_logic; 
 acc, start : in std_logic;
 
 WRA, WRB, WRC,sel :out std_logic

);
end FSM;

architecture Behavioral of FSM is
type state is (init,fetch_numbers,procc, write_result, accumulate);
signal current_state, next_state: state;
  

begin
 
 
process(clock,reset)
begin
 if(reset='1') then
  current_state <= init;
 elsif(falling_edge(clock)) then
  current_state <= next_state;
 end if;
end process;
 
process(start, acc)
begin
 case(current_state) is
 when init =>

   WRA<='0';
	WRB<='0';
	WRC<='0';
	SEL<='0';
  if (start='1' and acc='0') then
   next_state <= fetch_numbers;
  elsif (start='1' and acc='1') THEN
   next_state <= accumulate;
   else
	next_state<=init;
  end if;
  
  
 when fetch_numbers =>
   WRA<='1';
	WRB<='1';
	WRC<='0';
	SEL<='0';
   next_state <= procc;
 
 when procc =>
   next_state <= write_result;

 when accumulate =>
   WRA<='0';
	WRB<='0';
	WRC<='1';
	SEL<='1';
   next_state <= procc;
 
 when write_result => 
   WRA<='0';
	WRB<='0';
	WRC<='1';
	SEL<='0';
   next_state <= init;
 






	
 end case;
end process;
 
end Behavioral;