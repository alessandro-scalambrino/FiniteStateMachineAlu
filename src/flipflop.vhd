library ieee;
use ieee.std_logic_1164.all;

entity flipflop is
port (

DATA_IN : IN STD_LOGIC_VECTOR( 7 DOWNTO 0);
Clk: IN STD_LOGIC;
RST : IN STD_LOGIC;
DATA_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)

);
end flipflop;

architecture Behavioral of flipflop is
begin
process(Clk)
begin
if RST = '1' then
	DATA_OUT<=(others=>'0');
elsif (rising_edge(Clk)) then
	DATA_OUT<= DATA_IN;
end if;
end process;
end Behavioral;

