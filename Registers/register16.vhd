library ieee;
use ieee.std_logic_1164.all;
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
    change: 
	 process(clk)
    begin
        if (rising_edge(clk)) then
            if (clr='1') then
                output <=  x"0000";
            elsif (ld='1' and clr='0') then
                output <= input;
            end if;
        end if;
    end process change;
end proc_of_register16;