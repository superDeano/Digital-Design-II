--***********************************************************************
--
-- Dean Chong San
-- 
--***********************************************************************









library ieee;
use ieee.std_logic_1164.all;

entity sum_of_minterms is
 
	port(a,b,c	: in std_logic;
	     output 	: out std_logic);

end sum_of_minterms;

architecture sum_arch of sum_of_minterms is 

--The component of the AND gate
component deanoAND 
port (a, b, c : in std_logic;
	out1  : out std_logic);
end component;

--The component of the OR gate
component deanoOR
port( a, b, c : in std_logic;
	out2  : out std_logic);
end component;

--The wires to connect the components
signal out1 : std_logic;
signal out2 : std_logic;
signal out3 : std_logic;

--Begin instantiating components
--First AND Gate
--might have error in assigning the values here
and1: deanoAND 
port map(
a => a;
b => b;
c => c;
d => out1);

--Second AND Gate
and2 : deanoAND
port map(
a => a;
b => b;
c => c;
d => out2);

--Third AND Gate
and3: deanoAND
port map (
a => a;
b => b;
c => c;
d => out3);

--The OR Gate
finalOR: deanoOR
port map(
a => out1;
b => out2;
c => out3;
d => output);


end sum_arch;
