library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity setbit8 is
	port(
	    input: in std_logic_vector (7 downto 0);
      sel: in std_logic_vector (2 downto 0);
	    output: out std_logic_vector (7 downto 0);
	    Z, S, V: out std_logic
		);
end setbit8;

architecture proc_of_setbit8 of setbit8 is
  signal temp: std_logic_vector (7 downto 0);
begin
    temp <= input;
    temp(sel) <= '1';
    Z <= '1' when temp=x"00" else '0';
    S <= '1' when temp(7)='1' else '0';
    V <= '0';
    output <= temp;
end proc_of_setbit8;
