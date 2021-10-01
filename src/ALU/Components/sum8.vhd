library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sum8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0);
		 C, V: out std_logic
		);
end sum8;

architecture proc_of_sum8 of sum8 is
	 signal temp0, temp1, tempout: std_logic_vector (8 downto 0);
begin

				  
	 temp0(7 downto 0) <= in0;
	 temp0(8) <= '0';
	 
	 temp1(7 downto 0) <= in1;
	 temp1(8) <= '0';
	 
	 tempout <=std_logic_vector( unsigned(temp1)+unsigned(temp0));
	 
	 output <=tempout(7 downto 0);
	 C <=tempout(8);
 	 V <= '1' when (tempout(7)='1' and in0(7)='0' and in1(7)='0') or (tempout(7)='0' and in0(7)='1' and in1(7)='1') else '0';
				  
end proc_of_sum8;
