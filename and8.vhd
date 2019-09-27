library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity and8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0);
	    Z, S, V: out std_logic
		);
end and8;

architecture proc_of_and8 of and8 is
    signal temp: std_logic_vector (7 downto 0);
begin
    temp <= in0 and in1;
    Z <= '1' when temp="00000000" else '0';
    S <= '1' when temp(7)='1' else '0';
    V <= '1' when ((in0(7)='0' and in1(7)='0' and temp(7)='1') or (in0(7)='1' and in1(7)='1' and temp(7)='0')) else '0';
    output <= temp;
end proc_of_and8;

-- http://sandbox.mc.edu/~bennet/cs110/tc/orules.html
-- https://www.edaplayground.com/#
