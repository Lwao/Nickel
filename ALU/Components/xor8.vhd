library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity xor8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
end xor8;

architecture proc_of_xor8 of xor8 is
begin
    output <= in0 xor in1;
end proc_of_xor8;