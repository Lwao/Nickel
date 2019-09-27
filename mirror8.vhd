library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mirror8 is
	port(
	    input: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0);
	    Z, S, V: out std_logic
		);
end mirror8;

architecture proc_of_mirror8 of mirror8 is
    signal temp: std_logic_vector (7 downto 0);
begin
    temp(7) <= input(0);
    temp(6) <= input(1);
    temp(5) <= input(2);
    temp(4) <= input(3);
    temp(3) <= input(4);
    temp(2) <= input(5);
    temp(1) <= input(6);
    temp(0) <= input(7);
    Z <= '1' when temp="00000000" else '0';
    S <= '1' when temp(7)='1' else '0';
    output <= temp;
end proc_of_mirror8;