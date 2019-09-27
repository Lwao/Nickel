library ieee;
use ieee.std_logic_164.all;
use ieee.numeric_std.all;

entity register16 is
	port(
	    input: in std_logic_vector (15 downto 0);
	    clk, ld, clr: in std_logic;
		output: out std_logic_vector (15 downto 0) 
		);
end register16;

architecture proc_of_register16 of register16 is

begin
    change: process(clk)
        if (rising_edge(clk)) then
            if (ld='1') then
                output <= "0000000000000000";
            elsif (ld='0' and clr='1') then
                output <= input;
            end if;
        end if;
    
    end process change;
end proc_of_register16;
