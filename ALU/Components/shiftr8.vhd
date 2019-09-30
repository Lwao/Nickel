library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shiftr8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0);
	    Z, S, V: out std_logic
		);
end shiftr8;

architecture proc_of_shiftr8 of shiftr8 is
    signal temp: std_logic_vector (7 downto 0);
begin
    output <= std_logic_vector(shift_right(unsigned(in0), to_integer(unsigned(in1))));
    Z <= '1' when temp="00000000" else '0';
    S <= '1' when temp(7)='1' else '0';
end proc_of_shiftr8;