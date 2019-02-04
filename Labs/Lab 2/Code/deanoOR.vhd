library ieee;
use ieee.std_logic_1164.all;

--The entity of my or gate
entity deanOR is 
port map (
a, b, c : in std_logic;
d :out std_logic);


--The architecture definition of my or gate
architecture or_arch of deanOR is
begin
	d <= a or b or c;
end or_arch;
