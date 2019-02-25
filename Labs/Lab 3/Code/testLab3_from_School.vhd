library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

-- Entity of the converter
entity converter is 
port ( 	sign_mag : in std_logic_vector (3 downto 0);
		twos_comp : out std_logic_vector (3 downto 0));
end;

-- The architecture of the converter
architecture converter_arch of converter is 

-- Constants to make the code more readable
-- The number which is added at the second step of the 2's complement process
constant numberToAddFor2sComplement : std_logic_vector(3 downto 0) := "0001";
constant atMostSignificantIndex : integer := 3;
constant positiveSign : std_logic := '0';

begin

	-- The process which will use the algorithm
	determining_number: process (sign_mag)

	-- 2 variables for easy manipulations
	variable temp : std_logic_vector (3 downto 0);
	variable temp_negated : std_logic_vector (3 downto 0);
	variable at_index : integer;
	begin
	
		-- Checks whether the number is positive
		if ( sign_mag(atMostSignificantIndex) = positiveSign) then 
		twos_comp <= NOT sign_mag;

		-- Number is negative
		else 
		-- Assigns the variable the input to work with it
		temp := sign_mag;
	
		-- Goes in a loop to negate the number 
		for at_index in 0 to 2 loop

			-- convert into int
			--at_index := to_integer(signed(i));
			
			if (temp(at_index) = '0') then
				temp(at_index) := '1';
			else 
				temp(at_index) := '0';
			end if;
		
		end loop;

		temp_negated := temp + numberToAddFor2sComplement;

		-- Making the number is still negative
		temp_negated(atMostSignificantIndex) := '1';

		-- The final output
		twos_comp <= NOT temp_negated;

		end if;

	end process determining_number;

end converter_arch;
