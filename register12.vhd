library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register12 is
	port(
	    input: in std_logic_vector (11 downto 0);
	    clk, ld, clr: in std_logic;
		output: out std_logic_vector (11 downto 0) 
		);
end register12;

architecture proc_of_register12 of register12 is

begin
    change: process(clk)
        if (rising_edge(clk)) then
            if (ld='1') then
                output <= "000000000000";
            elsif (ld='0' and clr='1') then
                output <= input;
            end if;
        end if;
    end process change;
end proc_of_register12;
