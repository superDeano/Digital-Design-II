library ieee;
use ieee.std_logic_1164.all;

--Creation of the entity for my AND gate
entity deanoAND is

port (a,b,c : in std_logic;
	d : out std_logic);

end deanoAND;


architecture and_arch of deanoAND is
begin

d <= a and b and c;

end and_arch;
