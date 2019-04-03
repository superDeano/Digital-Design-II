library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity twos_complementer is
port(din : in std_logic_vector (7 downto 0);
reset : in std_logic;
clk : in std_logic;
done_out : out std_logic;
counter_out : out std_logic_vector (3 downto 0);
reg_out : out std_logic_vector (7 downto 0));
end twos_complementer;


architecture twos_comp_arch of twos_complementer is 

signal d, shift, load, inc, clr, ld_done, clr_done: std_logic;
signal done : std_logic;
signal counter : std_logic_vector (3 downto 0);
signal shift_register : std_logic_vector (7 downto 0);
 
type states_type is ( load_state, test_bit_state, first_one_state, still_zero_state, test_count_zero_state, test_count_one_state, next_state, flip_zero_state, flip_one_state, done_state);


signal state : states_type;

begin 

-- to load the number, clear the counters
shift_reg : process (clk)
begin
if (clk'event and clk = '1') then 
	if (load = '1') then
		shift_register <= din;
	elsif (shift = '1') then
		shift_register(7) <= d;
		for index in 6 downto 0 loop
		shift_register(index ) <= shift_register(index + 1);
		end loop;
	end if;
end if;
end process shift_reg;

setting_states: process (clk, reset)
begin
if (reset = '1') then 
state <= load_state;
elsif (clk'event and clk = '1') then
case (state) is 
	when load_state => state <= test_bit_state;
	when test_bit_state =>
		if (shift_register(0) = '1') then
			state <= first_one_state;
		else
			state <= still_zero_state;
		end if;
	when first_one_state =>	state <= test_count_one_state;
	when still_zero_state => state <= test_count_zero_state;
	when test_count_one_state =>
		if (counter = "1000") then
			state <= done_state;
		else
			state <= next_state;
		end if;
	when test_count_zero_state =>
		if (counter = "1000") then
			state <= done_state;
		else 
			state <= test_bit_state;
		end if;
	when next_state =>
		if (shift_register(0) = '1') then
			state <= flip_one_state;
		else
			state <= flip_zero_state;
		end if;
	when flip_one_state => state <= test_count_one_state;
	when flip_zero_state =>	state <= test_count_one_state;
	when done_state => state <= done_state;
	end case;
end if;

end process setting_states;

states_logic : process (state)
-- Resetting the logic control signals
begin
d <= '0';
shift <= '0';
load <= '0';
inc <= '0';
clr <= '0';
clr_done <= '0';
ld_done <='0';


case (state) is 
when load_state => d <= '0';
shift <= '0';
load <= '1';
inc <= '0';
clr <= '1';
clr_done <= '1';
ld_done <= '0';

when test_bit_state => d <= '0';
shift <= '0';
load <= '0';
inc <= '0';
clr <= '0';
clr_done <= '0';
ld_done <= '0';

when first_one_state => d <= '1';
shift <= '1';
load <= '0';
inc <= '1';
clr <= '0';
clr_done <= '0';
ld_done <= '0';

when still_zero_state => d <= '0';
shift <= '1';
load <= '0';
inc <= '1';
clr <= '0';
clr_done <= '0';
ld_done <= '0';

when test_count_one_state => d <= '0';
shift <= '0';
load <= '0';
inc <= '0';
clr <= '0';
clr_done <= '0';
ld_done <= '0';

when test_count_zero_state => d <= '0';
shift <= '0';
load <= '0';
inc <= '0';
clr <= '0';
clr_done <= '0';
ld_done <= '0';


when next_state => d <= '0';
shift <= '0';
load <= '0';
inc <= '0';
clr <= '0';
clr_done <= '0';
ld_done <= '0';

when flip_one_state => d <= '0';
shift <= '1';
load <= '0';
inc <= '1';
clr <= '0';
clr_done <= '0';
ld_done <= '0';

--here
when flip_zero_state => d <= '1';
shift <= '1';
load <= '0';
inc <= '1';
clr <= '0';
clr_done <= '0';
ld_done <= '0';

when done_state => d <= '0';
shift <= '0';
load <= '0';
inc <= '0';
clr <= '0';
clr_done <= '0';
ld_done <= '1';
end case;
end process states_logic;

counting : process (clk)
begin

if (clk'event and clk = '1') then
	if (clr = '1') then
		counter <= "0000";
	elsif (inc = '1') then
		counter <= counter + "0001"; 
	end if;
end if;

end process counting;

-- tells that the whole program is done for that particular number
all_done : process (clk)
begin
if (clk'event and clk = '1') then
	if (clr_done = '1') then 
		done <= '0';
	elsif (ld_done = '1') then
		done <= '1';
	end if;
end if;

end process all_done;
-- Connecting the output to the out signals
done_out <= done;
counter_out <= counter;
reg_out <= shift_register;
end twos_comp_arch;
