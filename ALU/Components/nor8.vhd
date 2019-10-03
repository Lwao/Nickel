library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity nor8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
end nor8;

architecture proc_of_nor8 of nor8 is
begin
    output <= in0 nor in1;
end proc_of_nor8;