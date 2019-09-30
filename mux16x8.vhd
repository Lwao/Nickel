library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux16x8 is
	port(
	    in0, in1, in2, in3, in4, in5, in6, in7: in std_logic_vector (7 downto 0);
      in8, in9, in10, in11, in12, in13, in14, in15: in std_logic_vector (7 downto 0);
	    sel: in std_logic_vector (3 downto 0);
		  output: out std_logic_vector (7 downto 0) 
		);
end mux16x8;

architecture proc_of_mux4x8 of mux16x8 is

begin
    output <=   in0 when sel=x"0" else
                in1 when sel=x"1" else
                in2 when sel=x"2" else
                in3 when sel=x"3" else
                in4 when sel=x"4" else
                in5 when sel=x"5" else
                in6 when sel=x"6" else
                in7 when sel=x"7" else
                in8 when sel=x"8" else
                in9 when sel=x"9" else
                in10 when sel=x"A" else
                in11 when sel=x"B" else
                in12 when sel=x"C" else
                in13 when sel=x"D" else
                in14 when sel=x"E" else
                in15;
end proc_of_mux16x8;
