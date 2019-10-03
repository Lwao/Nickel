library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clrbit8 is
	port(
	    input: in std_logic_vector (7 downto 0);
      sel: in std_logic_vector (2 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
end clrbit8;

architecture proc_of_clrbit8 of clrbit8 is
begin
    output <= input;
    output(sel) <= '0';
end proc_of_clrbit8;
