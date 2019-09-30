library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ALU_components.all;

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
    SUM  : sum8    port map ();
    SUB  : sub8    port map ();
    AND_ : and8    port map ();
    OR_  : or8     port map ();
    XOR_ : xor8    port map ();
    NAND_: nand8   port map ();
    NOR_ : nor8    port map ();
    XNOR_: xnor8   port map ();
    SLA_ : shiftl8 port map ();
    SRA_ : shiftr8 port map ();
    ROL_ : xxx 	 port map ();
    ROR_ : xxx 	 port map ();
    MIR  : mirror8 port map ();
    SETB : setbit8 port map ();
    CLRB : clrbit8 port map ();
    MUX  : mux16x8 port map (result_sum, result_sub, result_and, result_or,
			 result_xor, result_nand, result_nor, result_xnor,
			 result_sla, result_sra, result_ror, result_rol,
			 result_mir, result_setb, result_clrb, x"00", mux_alu, output);
end proc_of_alu;
