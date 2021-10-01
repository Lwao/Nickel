library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity nand8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
end nand8;

architecture proc_of_nand8 of nand8 is
begin
    output <= in0 nand in1;
end proc_of_nand8;