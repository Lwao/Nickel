library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mirror8 is
	port(
	    input: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
end mirror8;

architecture proc_of_mirror8 of mirror8 is
begin
    output(7) <= input(0);
    output(6) <= input(1);
    output(5) <= input(2);
    output(4) <= input(3);
    output(3) <= input(4);
    output(2) <= input(5);
    output(1) <= input(6);
    output(0) <= input(7);
end proc_of_mirror8;