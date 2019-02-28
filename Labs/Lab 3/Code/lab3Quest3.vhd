library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- Entity of the converter

entity converter is 
port ( sign_mag : in std_logic_vector (3 downto 0);
	twos_comp : out std_logic_vector (3 downto 0));
end;

-- Architecture of the converter

architecture converter_with_signal of converter is 

-- Constants to make code more readable
constant numberToAddFor2sComp : std_logic_vector(3 downto 0) := "0001";
constant atMostSignificantIndex : integer := 3;
constant positiveSign : std_logic := '0';
constant negativeSign : std_logic := '1';

-- Signals
signal temp : std_logic_vector (3 downto 0);
signal temp_negated : std_logic_vector (3 downto 0);


begin determineSign : process(sign_mag)

	-- Check if number is positive
	if (sign_mag(atMostSignificantIndex) = positiveSign) then
		-- Same number in twos Complement
		twos_comp <= sign_mag;

	else -- Number is negative

		temp_negated <= not sign_mag; -- Negates the number

end determineSign;

temp <= temp_negated + numberToAddFor2sComp;

temp(atMostSignificantIndex) <= negativeSign; -- Makes Sure Number is still negative

twos_comp <= temp; -- The output

end converter_with_signal;

