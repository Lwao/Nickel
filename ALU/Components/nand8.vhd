library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity nand8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0);
	    Z, S, V: out std_logic
		);
end nand8;

architecture proc_of_nand8 of nand8 is
    signal temp: std_logic_vector (7 downto 0);
begin
    temp <= in0 nand in1;
    Z <= '1' when temp="00000000" else '0';
    S <= '1' when temp(7)='1' else '0';
    V <= V <= '0';
    output <= temp;
end proc_of_nand8;