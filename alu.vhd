library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
	port(
	    rs1, rs2: in std_logic_vector (7 downto 0);
      mux_alu: in std_logic_vector (3 downto 0);
	    output: out std_logic_vector (7 downto 0);
	    L, G, E, Z, S, V: out std_logic
		);
end alu;

architecture proc_of_alu of alu is
    signal result_sum, result_sub: std_logic_vector (7 downto 0); 
    signal result_and, result_or, result_xor: std_logic_vector (7 downto 0);
    signal result_nand, result_nor, result_xnor: std_logic_vector (7 downto 0);
    signal result_sla, result_sra, result_ror, result_rol: std_logic_vector (7 downto 0);
    signal result_mir, result_setb, result_clrb: std_logic_vector (7 downto 0);
begin
    SUM  : xxx port map ();
    SUB  : xxx port map ();
    AND  : xxx port map ();
    OR   : xxx port map ();
    XOR  : xxx port map ();
    NAND : xxx port map ();
    NOR  : xxx port map ();
    XNOR : xxx port map ();
    SLA  : xxx port map ();
    SRA  : xxx port map ();
    ROL  : xxx port map ();
    ROR  : xxx port map ();
    MIR  : xxx port map ();
    SETB : xxx port map ();
    CLRB : xxx port map ();
    
    change: process()
    begin
      case mux_alu is
        when x"0" => -- sum
          output <= result_sum;
        when x"1" => -- sub
          output <= result_sub;
        when x"2" => -- and
          output <= result_and;
        when x"3" => -- or
          output <= result_or;
        when x"4" => -- xor
          output <= result_xor;
        when x"5" => -- nand
          output <= result_nand;
        when x"6" => -- nor
          output <= result_nor;
        when x"7" => -- xnor
          output <= result_xnor;
        when x"8" => -- sla
          output <= result_sla;
        when x"9" => -- sra
          output <= result_sra;
        when x"A" => -- ror
          output <= result_ror;
        when x"B" => -- rol
          output <= result_rol;
        when x"C" => -- mir
          output <= result_mir;
        when x"D" => -- setb
          output <= result_setb;
        when x"E" => -- clrb
          output <= result_clrb;
      end case;
    end process change;
end proc_of_alu;
