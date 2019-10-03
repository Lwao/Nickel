library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sum8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0);
		 C: out std_logic
		);
end sum8;

architecture proc_of_sum8 of sum8 is
	 signal temp90, temp91, tempout: std_logic_vector (8 downto 0);
begin

				  
	 temp90(7 downto 0) <= in0;
	 temp90(8) <= '0';
	 
	 temp91(7 downto 0) <= std_logic_vector( unsigned(not in1)+1);
	 temp91(8) <= '0';
	 
	 tempout <=std_logic_vector( unsigned(temp91)+unsigned(temp90));
	 
	 output <=tempout(7 downto 0);
	 C <=tempout(8);
				  
end proc_of_sum8;
