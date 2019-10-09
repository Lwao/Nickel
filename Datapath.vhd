library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity datapath is
	port(
		clk: in	std_logic;
		IR: in std_logic_vector (15 downto 0);
		PC: buffer std_logic_vector (11 downto 0);
		R1_ld, R2_ld, R3_ld, D_rd, D_wr: in std_logic;
		PC_clr, PC_ld, I_ld, IR_ld, OUT_ld, IN_ld, SR_clr: in std_logic;
		RS1_add, RS2_add, MUX_imm, MUX_sel, MUX_PC: in std_logic_vector (1 downto 0);
		MUX_alu: out std_logic_vector (3 downto 0);
		flags: out std_logic_vector (7 downto 0);
		prog_MEM_add: out std_logic_vector (11 downto 0);
		prog_MEM_dt: in std_logic_vector (15 downto 0);
		data_MEM_wrdt, data_MEM_rddt: out std_logic_vector (7 downto 0);
		);
end datapath;

architecture proc_of_datapath of datapath is
	signal flags, r1_out, r2_out, r3_out, rin_out, rout_out: std_logic_vector (7 downto 0);
	signal MUX_sel_out, MUX_rs1_out, MUX_rs2_out, MUX_imm_out: std_logic_vector (7 downto 0); 
	signal imm_pos2: std_logic_vector (7 downto 0);
        signal PC_pos1, PCinc_out, PCsum_out: std_logic_vector (11 downto 0);
	signal Cpc1, Vpc1, Cpc2, Vpc2: std_logic;
	signal L, G, E, Z, S, V, C: std_logic;
	
	
begin
    -- immediate words
    imm_pos2(7 downto 3) <= "00000";
    imm_pos2(2 downto 0) <= IR(9 downto 7);
    PC_pos1(11) <= IR(11);
    PC_pos1(10) <= IR(11);
    PC_pos1(9) <= IR(11);
    PC_pos1(8 downto 0) <= IR(11 downto 3);
    flags(7) <= '0';
    flags(6) <= L;
    flags(5) <= G;
    flags(4) <= E;
    flags(3) <= Z;
    flags(2) <= S;    
    flags(1) <= V;
    flags(0) <= C;
    prog_MEM_add <= PC;

    -- lonely blocks
    INC_PC : sum12 port map (PC, x"001", PCinc_out, Cpc1, Vpc1);
    SUM_PC : sum12 port map (PC, PC_pos1, PCsum_out, Cpc2, Vpc2);
    COMP : comparator8 port map (MUX_rs1_out, MUX_rs2_out, L, E, G);
    ALU  : alu port map (rs1, rs2, MUX_alu, alu_out, Z, S, V, C);	
	    
    -- registers
    R0   : register8 port map (x"00", clk, 1, 1, r0_out);				
    R1   : register8 port map (MUX_sel_out, clk, R1_ld, clr, r1_out);				
    R2   : register8 port map (MUX_sel_out, clk, R2_ld, clr, r2_out);			
    R3   : register8 port map (MUX_sel_out, clk, R3_ld, clr, r3_out);			
    IN   : register8 port map (in, clk, IN_ld, 0, rin_out);
    OUT  : register8 port map (in, clk, OUT_ld, 0, rout_out);
    SR   : register8 port map (flags, clk, 1, SR_clr, out);
    PC   : register12 port map (in, clk, PC_ld, PC_clr, PC);
    IR   : register16 port map (in, clk, IR_ld, 0, IR);
	    
    -- muxes
    MUX_rs1 : mux4x8 port map (r0_out, r1_out, r2_out, r3_out, RS1_add, MUX_rs1_out);
    MUX_rs2 : mux4x8 port map (r0_out, r1_out, r2_out, r3_out, RS2_add, MUX_rs2_out);
    MUX_ime : mux4x8 port map (MUX_rs2_out, IR(7 downto 0), imm_pos2, "00000001", MUX_imm, MUX_imm_out)
    MUX_sel : mux4x8 port map (rout_out, rin_out, rd_dt, alu_out, MUX_sel, sel_out);
    MUX_PC : mux4x8 port map (PCinc_out, PCsum_out, IR(11 downto 0), x"000", MUX_PC, PC);
    
end proc_of_datapath;  
