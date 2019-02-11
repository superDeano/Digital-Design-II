library ieee;
use ieee.std_logic_1164.all;

--The entity of my or gate
entity deanoOR is 
port ( a, b, c : in std_logic;
d : out std_logic);
end deanoOR;

--The architecture definition of my or gate
architecture or_arch of deanoOR is

begin
	d <= a or b or c;

end or_arch;
