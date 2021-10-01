library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity setbit8 is
	port(
	    input: in std_logic_vector (7 downto 0);
      sel: in std_logic_vector (2 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
end setbit8;

architecture proc_of_setbit8 of setbit8 is
begin
    output <= input;
    output(sel) <= '1';
end proc_of_setbit8;
