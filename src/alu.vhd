LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;

entity alu is

port
(
IN1,IN2 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
OP : IN STD_LOGIC_VECTOR(2 downto 0);
Result : out STD_LOGIC_VECTOR(7 DOWNTO 0);
carryout : out std_logic
);

end alu;

architecture Behavioral of alu is

signal ALU_RESULT: std_logic_vector (7 downto 0);
signal temp : std_logic_vector(8 downto 0);

begin
process (IN1,IN2,OP)
begin
case(op) is
when "000" => --addition
ALU_RESULT <= IN1+IN2;
temp<= ('0' & IN1) + ('0' & IN2);

when "001" => --subtractoin
ALU_RESULT<= IN1-IN2;
temp<= ('0' & IN1) - ('0' & IN2);

when "010" => --Multi
ALU_RESULT<=  std_logic_vector(to_unsigned(to_integer(unsigned(IN1)) * to_integer(unsigned(IN2)),8));
 

when "011" => --Multi
ALU_RESULT<=  std_logic_vector(to_unsigned(to_integer(unsigned(IN1)) / to_integer(unsigned(IN2)),8));

when "100" => --XOR
ALU_RESULT<= IN1 XOR IN2;

when "101" => --XOR
ALU_RESULT<= IN1 Xnor IN2;

when "110" => --a eq b
if (IN1=IN2) then
ALU_RESULT<= x"01";
else
ALU_RESULT<= x"00";
end if;

when "111" => --a eq b
if (IN1>IN2) then
ALU_RESULT<= x"01";
else
ALU_RESULT<= x"00";
end if;


when others=>
ALU_RESULT<=IN1;
end case;
end process;

Result<= ALU_RESULT;

CarryOut<= temp(8);



end behavioral;


