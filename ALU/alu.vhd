library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ALU_components.all;

entity alu is
	port(
	    rs1, rs2: in std_logic_vector (7 downto 0);
            mux_alu: in std_logic_vector (3 downto 0);
	    output: out std_logic_vector (7 downto 0);
	    L, G, E, Z, S, V, C: out std_logic
		);
end alu;

architecture proc_of_alu of alu is
    signal result_sum, result_sub: std_logic_vector (7 downto 0); 
    signal result_and, result_or, result_xor: std_logic_vector (7 downto 0);
    signal result_nand, result_nor, result_xnor: std_logic_vector (7 downto 0);
    signal result_sla, result_sra, result_ror, result_rol: std_logic_vector (7 downto 0);
    signal result_mir, result_setb, result_clrb: std_logic_vector (7 downto 0);
    signal Csum, Vsum, Csub, Vsub: std_logic;
begin
    SUM  : sum8     port map (rs1, rs2, result_sum, Csum, Vsum);
    SUB  : sub8     port map (rs1, rs2, result_sub, Csub, Vsub);
    AND_ : and8     port map (rs1, rs2, result_and);
    OR_  : or8      port map (rs1, rs2, result_or);
    XOR_ : xor8     port map (rs1, rs2, result_xor);
    NAND_: nand8    port map (rs1, rs2, result_nand);
    NOR_ : nor8     port map (rs1, rs2, result_nor);
    XNOR_: xnor8    port map (rs1, rs2, result_xnor);
    SLA_ : shiftl8  port map (rs1, rs2, result_sla);
    SRA_ : shiftr8  port map (rs1, rs2, result_sra);
    ROL_ : rotatel8 port map (rs1, rs2, result_rol);
    ROR_ : rotater8 port map (rs1, rs2, result_ror);
    MIR  : mirror8  port map (rs1, result_mir);
    SETB : setbit8  port map (rs1, rs2(2 downto 0), result_setb);
    CLRB : clrbit8  port map (rs1, rs2(2 downto 0), result_clrb);
    MUX16: mux16x8  port map (result_sum, result_sub, result_and, result_or,
			 result_xor, result_nand, result_nor, result_xnor,
			 result_sla, result_sra, result_ror, result_rol,
			 result_mir, result_setb, result_clrb, x"00", mux_alu, output);
	 Z <= '1' when (output=x"00") else '0';
	 S <= '1' when (output(7)='1') else '0';
	 C <= Csum when mux_alu = "000" else
	      Csub when mux_alu = "001" else
	      '0';
	 V <= Vsum when mux_alu = "000" else
	      Vsub when mux_alu = "001" else
	      '0';
	    
end proc_of_alu;
