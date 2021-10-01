library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sum12 is
	port(
	    in0, in1: in std_logic_vector (11 downto 0);
	    output: out std_logic_vector (11 downto 0);
		 C, V: out std_logic
		);
end sum12;

architecture proc_of_sum12 of sum12 is
	 signal temp0, temp1, tempout: std_logic_vector (12 downto 0);
begin

				  
	 temp0(11 downto 0) <= in0;
	 temp0(12) <= '0';
	 
	 temp1(11 downto 0) <= in1;
	 temp1(12) <= '0';
	 
	 tempout <=std_logic_vector( unsigned(temp1)+unsigned(temp0));
	 
	 output <=tempout(11 downto 0);
	 C <=tempout(12);
 	 V <= '1' when (tempout(11)='1' and in0(11)='0' and in1(11)='0') or (tempout(11)='0' and in0(11)='1' and in1(11)='1') else '0';
				  
end proc_of_sum12;
