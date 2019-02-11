library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- The entity for a sum of minterms with concurrent statements


entity lab2 is 
port (a, b, c : in std_logic;
out_final : out std_logic);
end lab2;

--how the architecture is supposed to behave

architecture csa of lab2 is 
--signal out2 : std_logic;

begin
 
out_final <= ((not a) and (not b) and (c)) or ((not a) and b and c) or (a and b and c);


end csa;
