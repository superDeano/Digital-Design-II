library IEEE;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

-- The entity 
entity registers_min_max is
port( din : in std_logic_vector(3 downto 0);
reset : in std_logic;
clk : in std_logic;
sel : in std_logic_vector(1 downto 0);
max_out : out std_logic_vector(3 downto 0);
min_out : out std_logic_vector(3 downto 0);
reg_out : out std_logic_vector(3 downto 0));

end registers_min_max;

-- The architecure
architecture regi_min_max of registers_min_max is 

signal min, max : std_logic_vector (3 downto 0);

-- This is an array of 
Type registerArray is array (0 to 3) of std_logic_vector (3 downto 0);

signal regis : registerArray;

begin

fillRegisters : process (clk, reset)
begin 

if (reset = '1') then 
	--Reset my registers
	-- for loop to reset all the registers
	for index in 0 to 3 loop
	regis(index) <= "0000";
	end loop;

elsif (clk'event and clk = '1') then
	-- Put data from din into the registers
	regis(0) <= din;

	--Shifting the values into the registers
	for i in 1 to 3 loop
	regis(i) <= regis(i -1);
	end loop;

end if;

end process fillRegisters;


findMinMax : process (regis)

variable tempMin, tempMax : std_logic_vector (3 downto 0);

begin
--Initialize to the biggest value
tempMin := "1111";
--Initialized to the smallest value
tempMax := "0000";

--For loop to find the min and the max
for atindex in 0 to 3 loop

if (regis(atindex) < tempMin) then
tempMin := regis(atindex);
end if;

if (regis(atindex) > tempMax) then
tempMax := regis(atindex);
end if;

end loop;

--Assigns the values to the signals
min <= tempMin;
max <= tempMax;

end process;

display : process (sel)
begin
case sel is
when "00" => reg_out <= regis(0);
when "01" => reg_out <= regis(1);
when "10" => reg_out <= regis(2);
when others => reg_out <= regis(3);
end case;
end process display;


max_out <= max;
min_out <= min;
end regi_min_max;
