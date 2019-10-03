library ieee;
use ieee.std_logic_1164.all;

package ALU_components is
	
	component sum8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
	end component sum8;
	
	component sub8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
	end component sub8;
	
   component and8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
	end component and8;
	
	component or8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
	end component or8;
	
	component xor8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
	end component xor8;
	
	component nand8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
	end component nand8;
	
	component nor8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
	end component nor8;
	
	component xnor8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
	end component xnor8;
	
	component shiftl8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
	end component shiftl8;
	
	component shiftr8 is
	port(
	    in0, in1: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
	end component shiftr8;
	
	component mirror8 is
	port(
	    input: in std_logic_vector (7 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
	end component mirror8;

	component setbit8 is
	port(
	    input: in std_logic_vector (7 downto 0);
       sel: in std_logic_vector (2 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
	end component setbit8;
	
	component clrbit8 is
	port(
	    input: in std_logic_vector (7 downto 0);
       sel: in std_logic_vector (2 downto 0);
	    output: out std_logic_vector (7 downto 0)
		);
	end component clrbit8;
end package ALU_components;