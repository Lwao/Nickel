library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity or8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
end or8;

architecture proc_of_or8 of or8 is
    signal temp: std_logic_vector (7 downto 0);
begin
    output <= in0 or in1;
end proc_of_or8;