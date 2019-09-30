library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sum12 is
	port(
	    in0, in1: in std_logic_vector (11 downto 0);
	    output: out std_logic_vector (11 downto 0);
	    Z, S, V: out std_logic
		);
end sum8;

architecture proc_of_sum12 of sum12 is
    signal temp: std_logic_vector (11 downto 0);
begin
    temp <= std_logic_vector(signed(in0) + signed(in1));
    Z <= '1' when temp="000000000000" else '0';
    S <= '1' when temp(11)='1' else '0';
    V <= '1' when (temp(11)='1' and in0(11)='0' and in1(11)='0') or (temp(11)='0' and in0(11)='1' and in1(11)='1') else '0';
    output <= temp;
end proc_of_sum12;
