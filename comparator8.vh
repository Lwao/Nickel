library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparator8 is
	port(
	    A, B: in std_logic_vector (7 downto 0);
	    lt, eq, gt: out std_logic 
		);
end comparator8;

architecture proc_of_comparator8 of comparator8 is

begin
    lt <= '1' when (signed(A)<signed(B)) else '0';
    eq <= '1' when (signed(A)=signed(B)) else '0';
    gt <= '1' when (signed(A)>signed(B)) else '0';
end proc_of_comparator8;
