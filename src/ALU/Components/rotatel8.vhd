library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rotatel8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
end rotatel8;

architecture proc_of_rotatel8 of rotatel8 is
    signal temp: std_logic_vector (7 downto 0);
begin
	temp<=in0;
	output(7) <= temp(7) WHEN in1(2 downto 0) = "000" else
					 temp(6) WHEN in1(2 downto 0) = "001" else 
					 temp(5) WHEN in1(2 downto 0) = "010" else
					 temp(4) WHEN in1(2 downto 0) = "011" else
					 temp(3) WHEN in1(2 downto 0) = "100" else
					 temp(2) WHEN in1(2 downto 0) = "101" else
					 temp(1) WHEN in1(2 downto 0) = "110" else
					 temp(0);
			
	output(6) <= temp(6) WHEN in1(2 downto 0) = "000" else
					 temp(5) WHEN in1(2 downto 0) = "001" else 
					 temp(4) WHEN in1(2 downto 0) = "010" else
					 temp(3) WHEN in1(2 downto 0) = "011" else
					 temp(2) WHEN in1(2 downto 0) = "100" else
					 temp(1) WHEN in1(2 downto 0) = "101" else
					 temp(0) WHEN in1(2 downto 0) = "110" else
					 temp(7);
					 
	output(5) <= temp(5) WHEN in1(2 downto 0) = "000" else
					 temp(4) WHEN in1(2 downto 0) = "001" else 
					 temp(3) WHEN in1(2 downto 0) = "010" else
					 temp(2) WHEN in1(2 downto 0) = "011" else
					 temp(1) WHEN in1(2 downto 0) = "100" else
					 temp(0) WHEN in1(2 downto 0) = "101" else
					 temp(7) WHEN in1(2 downto 0) = "110" else
					 temp(6);
			
	output(4) <= temp(4) WHEN in1(2 downto 0) = "000" else
					 temp(3) WHEN in1(2 downto 0) = "001" else 
					 temp(2) WHEN in1(2 downto 0) = "010" else
					 temp(1) WHEN in1(2 downto 0) = "011" else
					 temp(0) WHEN in1(2 downto 0) = "100" else
					 temp(7) WHEN in1(2 downto 0) = "101" else
					 temp(6) WHEN in1(2 downto 0) = "110" else
					 temp(5);
				
	output(3) <= temp(3) WHEN in1(2 downto 0) = "000" else
					 temp(2) WHEN in1(2 downto 0) = "001" else 
					 temp(1) WHEN in1(2 downto 0) = "010" else
					 temp(0) WHEN in1(2 downto 0) = "011" else
					 temp(7) WHEN in1(2 downto 0) = "100" else
					 temp(6) WHEN in1(2 downto 0) = "101" else
					 temp(5) WHEN in1(2 downto 0) = "110" else
					 temp(4);
			
	output(2) <= temp(2) WHEN in1(2 downto 0) = "000" else
					 temp(1) WHEN in1(2 downto 0) = "001" else 
					 temp(0) WHEN in1(2 downto 0) = "010" else
					 temp(7) WHEN in1(2 downto 0) = "011" else
					 temp(6) WHEN in1(2 downto 0) = "100" else
					 temp(5) WHEN in1(2 downto 0) = "101" else
					 temp(4) WHEN in1(2 downto 0) = "110" else
					 temp(3);
				
	output(1) <= temp(1) WHEN in1(2 downto 0) = "000" else
					 temp(0) WHEN in1(2 downto 0) = "001" else 
					 temp(7) WHEN in1(2 downto 0) = "010" else
					 temp(6) WHEN in1(2 downto 0) = "011" else
					 temp(5) WHEN in1(2 downto 0) = "100" else
					 temp(4) WHEN in1(2 downto 0) = "101" else
					 temp(3) WHEN in1(2 downto 0) = "110" else
					 temp(2);
			
	output(0) <= temp(0) WHEN in1(2 downto 0) = "000" else
					 temp(7) WHEN in1(2 downto 0) = "001" else 
					 temp(6) WHEN in1(2 downto 0) = "010" else
					 temp(5) WHEN in1(2 downto 0) = "011" else
					 temp(4) WHEN in1(2 downto 0) = "100" else
					 temp(3) WHEN in1(2 downto 0) = "101" else
					 temp(2) WHEN in1(2 downto 0) = "110" else
					 temp(1);
end proc_of_rotatel8;