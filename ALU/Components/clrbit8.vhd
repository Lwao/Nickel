library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clrbit8 is
	port(
	    input: in std_logic_vector (7 downto 0);
      sel: in std_logic_vector (2 downto 0);
	    output: out std_logic_vector (7 downto 0);
	    Z, S, V: out std_logic
		);
end clrbit8;

architecture proc_of_clrbit8 of clrbit8 is
  signal temp: std_logic_vector (7 downto 0);
begin
    temp <= input;
    temp(sel) <= '0';
    Z <= '1' when temp=x"00" else '0';
    S <= '1' when temp(7)='1' else '0';
    V <= '0';
    output <= temp;
end proc_of_clrbit8;
