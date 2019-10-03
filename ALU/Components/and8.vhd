library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity and8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
end and8;

architecture proc_of_and8 of and8 is
begin
    output <= in0 and in1;
end proc_of_and8;

-- http://sandbox.mc.edu/~bennet/cs110/tc/orules.html
-- https://www.edaplayground.com/#