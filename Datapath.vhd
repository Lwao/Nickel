library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity datapath is
	port(
		clk: in	std_logic;
		IR: in std_logic_vector(15 downto 0);
		L, G, E, Z, S, V, C: out std_logic;
		R1_ld, R2_ld, R3_ld, D_rd, D_wr: in std_logic;
		PC_clr, PC_ld, I_ld, IR_ld, OUT_ld, IN_ld, SR_clr: in std_logic;
		RS1_add, RS2_add, MUX_imm, MUX_sel, MUX_PC: in std_logic_vector (1 downto 0);
		MUX_alu: out std_logic_vector(3 downto 0)
		);
end datapath;

architecture proc_of_datapath of datapath is
	signal flags: std_logic_vector (7 downto 0);
	signal MUX_rs1_out, MUX_rs2_out, MUX_imm_out: std_logic_vector (7 downto 0); 
	signal imm_pos2: std_logic_vector (7 downto 0);
        signal PC_pos1: std_logic_vector (11 downto 0);
	
begin
	
    imm_pos2(7 downto 3) <= "00000"
    imm_pos2(2 downto 0) <= IR(9 downto 7);
    PC_pos1(11) <= IR(11);
    PC_pos1(10) <= IR(11);
    PC_pos1(9) <= IR(11);
    PC_pos1(8 downto 0) <= IR(11 downto 3);


    INC_PC : sum12 port map (PC, x"001", PCinc_out, Cpc1, Vpc1);
    SUM_PC : sum12 port map (PC, x"001", PCinc_out, Cpc1, Vpc1);
    COMP : comparator8 port map (MUX_rs1_out, MUX_rs2_out, L, E, G);
    ALU  : alu port map (rs1, rs2, MUX_alu, alu_out);			
    R0   : register8 port map (x"00", clk, 1, 1, r0_out);				
    R1   : register8 port map (sel_out, clk, R1_ld, clr, r1_out);				
    R2   : register8 port map (sel_out, clk, R2_ld, clr, r2_out);			
    R3   : register8 port map (sel_out, clk, R3_ld, clr, r3_out);			
    IN   : register8 port map (sel_out, clk, ld, clr, rin_out);
    OUT  : register8 port map (in, clk, ld, clr, rout_out);
    SR   : register8 port map (flags, clk, 1, SR_clr, out);
    PC   : register12 port map (in, clk, ld, clr, PC);
    IR   : register16 port map (in, clk, ld, clr, IR);
    MUX_rs1 : mux4x8 port map (r0_out, r1_out, r2_out, r3_out, RS1_add, MUX_rs1_out);
    MUX_rs2 : mux4x8 port map (r0_out, r1_out, r2_out, r3_out, RS2_add, MUX_rs2_out);
    MUX_ime : mux4x8 port map (MUX_rs2_out, IR(7 downto 0), imm_pos2, "00000001", MUX_imm, MUX_imm_out)
    MUX_sel : mux4x8 port map (rout_out, rin_out, rd_dt, alu_out, MUX_sel, sel_out);
    MUX_PC : mux4x8 port map (PCinc_out, PCsum_out, IR(11 downto 0), x"000");
    
end proc_of_datapath;  
