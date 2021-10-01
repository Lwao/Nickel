library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shiftr8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0);
	    Z, S, V: out std_logic
		);
end shiftr8;

architecture proc_of_shiftr8 of shiftr8 is
    signal temp: std_logic_vector (7 downto 0);
begin

	temp<=in0;
	output(7) <= temp(7) WHEN in1(7 downto 0) = "00000000" else
					 '0';
			
	output(6) <= temp(6) WHEN in1(7 downto 0) = "00000000" else
					 temp(7) WHEN in1(7 downto 0) = "00000001" else 
					 '0';
					 
	output(5) <= temp(5) WHEN in1(7 downto 0) = "00000000" else
					 temp(6) WHEN in1(7 downto 0) = "00000001" else 
					 temp(7) WHEN in1(7 downto 0) = "00000010" else
					 '0';
			
	output(4) <= temp(4) WHEN in1(7 downto 0) = "00000000" else
					 temp(5) WHEN in1(7 downto 0) = "00000001" else 
					 temp(6) WHEN in1(7 downto 0) = "00000010" else
					 temp(7) WHEN in1(7 downto 0) = "00000011" else
					 '0';
				
	output(3) <= temp(3) WHEN in1(7 downto 0) = "00000000" else
					 temp(4) WHEN in1(7 downto 0) = "00000001" else 
					 temp(5) WHEN in1(7 downto 0) = "00000010" else
					 temp(6) WHEN in1(7 downto 0) = "00000011" else
					 temp(7) WHEN in1(7 downto 0) = "00000100" else
					 '0';
			
	output(2) <= temp(2) WHEN in1(7 downto 0) = "00000000" else
					 temp(3) WHEN in1(7 downto 0) = "00000001" else 
					 temp(4) WHEN in1(7 downto 0) = "00000010" else
					 temp(5) WHEN in1(7 downto 0) = "00000011" else
					 temp(6) WHEN in1(7 downto 0) = "00000100" else
					 temp(7) WHEN in1(7 downto 0) = "00000101" else
					 '0';
				
	output(1) <= temp(1) WHEN in1(7 downto 0) = "00000000" else
					 temp(2) WHEN in1(7 downto 0) = "00000001" else 
					 temp(3) WHEN in1(7 downto 0) = "00000010" else
					 temp(4) WHEN in1(7 downto 0) = "00000011" else
					 temp(5) WHEN in1(7 downto 0) = "00000100" else
					 temp(6) WHEN in1(7 downto 0) = "00000101" else
					 temp(7) WHEN in1(7 downto 0) = "00000110" else
					 '0';
			
	output(0) <= temp(0) WHEN in1(7 downto 0) = "00000000" else
					 temp(1) WHEN in1(7 downto 0) = "00000001" else 
					 temp(2) WHEN in1(7 downto 0) = "00000010" else
					 temp(3) WHEN in1(7 downto 0) = "00000011" else
					 temp(4) WHEN in1(7 downto 0) = "00000100" else
					 temp(5) WHEN in1(7 downto 0) = "00000101" else
					 temp(6) WHEN in1(7 downto 0) = "00000110" else
					 temp(7) WHEN in1(7 downto 0) = "00000111" else
					 '0';

end proc_of_shiftr8;
