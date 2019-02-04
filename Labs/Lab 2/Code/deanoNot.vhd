library ieee;
use ieee.std_logic_1164.all;

--The entity of my NOT gate
entity deanoNot is 
port (
input : in std_logic;
output : out std_logic);

end deanoNot;

--The architecture of my NOT GATE
architecture negate_arch of deanoNot is
begin
	output <= not input;
end negate_arch;

