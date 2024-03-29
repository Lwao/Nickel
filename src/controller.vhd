library ieee;
use ieee.std_logic_1164.all;

entity controller is

	port(
		clk, reset: in	std_logic;
		flags: in std_logic_vector (7 downto 0);
		IR: in std_logic_vector (15 downto 0);
		R1_ld, R2_ld, R3_ld, D_rd, D_wr: out std_logic;
		PC_clr, PC_ld, I_ld, IR_ld, OUT_ld, IN_ld, SR_clr: out std_logic;
		RS1_add, RS2_add, MUX_imm, MUX_sel, MUX_PC: out std_logic_vector (1 downto 0);
		MUX_alu: out std_logic_vector(3 downto 0)
	);

end entity;

architecture rtl of controller is

	type state_type is ( INIT, FETCH, DECOD, 
			ADD, SUB, sAND, sOR, sXOR, sNAND, sNOR, sXNOR,
			RTR, RTL, sSLL, sSRL, SWAP, COM, NEG, MOV,
			SBR, CBR, SER, CLR, CFR, MIR, INC, DEC, NOP,
			JMPI, JMPR, ADDI, SUBI, XORI, BEQ, BLT,
			LD, ST, sIN, sOUT, SBI, CBI);
	signal state   : state_type;
	alias OpCode: bit_vector(3 downto 0) is IR(15 downto 12);
	alias OpExt: bit_vector(2 downto 0) is IR(2 downto 0);
	alias RS1: bit_vector(1 downto 0) is IR(9 downto 8);
	alias RS2: bit_vector(1 downto 0) is IR(7 downto 6);
	alias RD: bit_vector(1 downto 0) is IR(11 downto 10);
	signal E, L : std_logic;
begin
	E <= flags(4);
	L <= flags(6);
	process (clk, reset)
	begin
		if reset = '1' then
			state <= INIT;
		elsif (rising_edge(clk)) then
			case state is
				when INIT =>
					state <= FETCH;
				when FETCH =>
					state <= DECOD;
				when DECOD =>
					case OpCode is
						when x"0"=>
							case OpExt is
								when x"0"=>
									state <= ADD;
								when x"1"=>
									state <= SUB;
								when x"2"=>
									state <= sAND;								
								when x"3"=>
									state <= sOR;
								when x"4"=>
									state <= sXOR;
								when x"5"=>
									state <= sNAND;
								when x"6"=>
									state <= sNOR;
								when x"7"=>
									state <= sXNOR;
								end case;
						when x"1"=>
							case OpExt is
								when x"0"=>
									state <= RTR;
								when x"1"=>
									state <= RTL;
								when x"2"=>
									state <= sSLL;								
								when x"3"=>
									state <= sSRL;
								when x"4"=>
									state <= SWAP;
								when x"5"=>
									state <= COM;
								when x"6"=>
									state <= NEG;
								when x"7"=>
									state <= MOV;
								end case;
						when x"2"=>
							case OpExt is
								when x"0"=>
									state <= SBR;
								when x"1"=>
									state <= CBR;
								when x"2"=>
									state <= SER;								
								when x"3"=>
									state <= CLR;
								when x"4"=>
									state <= CFR;
								when x"5"=>
									state <= MIR;
								when x"6"=>
									state <= INC;
								when x"7"=>
									state <= DEC;
								end case;
						when x"3"=>
							case OpExt is
								when x"0"=>
									state <= NOP;
								when x"1"=>
									state <= JMPR;
								end case;
						when x"4"=>
							state <= ADDI;
						when x"5"=> 
							state <= SUBI;
						when x"6"=>
							state <= XORI;
						when x"7"=>
							state <= JUMPI;
						when x"8"=>
							state <= BEQ;
						when x"9"=>
							state <= BLT;
						when x"A"=>
							state <= LD;
						when x"B"=>
							state <= ST;
						when x"C"=>
							state <= sIN;
						when x"D"=>
							state <= sOUT;
						when x"E"=>
							state <= SBI;
						when x"F"=>
							state <= CBI;
					end case;
				when BEQ =>
					if(E) then
						state <= JMPR;
					else
						state <= FETCH;
					end if;
				when BLT =>
					if(L) then
						state <= JMPR;
					else
						state <= FETCH;
					end if;
				when others =>
					state <= FETCH;
			end case;
		end if;
	end process;


	process (state)
	begin
		case state is
			when INIT =>
				PC_clr <= '1';
			when FETCH =>
				PC_clr <= '0';
				I_rd <= '1';
				PC_ld <= '1';
				IR_ld <= '1';
				MUX_PC <= "00";
			when DECOD =>
				PC_clr <= '0';
				I_rd <= '0';
				PC_ld <= '0';
				IR_ld <= '0';
			when ADD =>
				MUX_alu <= x"0";
				MUX_sel <= "11";
				MUX_imm <= "00";
				RS1_add <= R1;
				RS2_add <= R2;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when SUB =>
				MUX_alu <= x"1";
				MUX_sel <= "11";
				MUX_imm <= "00";
				RS1_add <= R1;
				RS2_add <= R2;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when sAND =>
				MUX_alu <= x"2";
				MUX_sel <= "11";
				MUX_imm <= "00";
				RS1_add <= R1;
				RS2_add <= R2;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when sOR =>
				MUX_alu <= x"3";
				MUX_sel <= "11";
				MUX_imm <= "00";
				RS1_add <= R1;
				RS2_add <= R2;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when sXOR =>
				MUX_alu <= x"4";
				MUX_sel <= "11";
				MUX_imm <= "00";
				RS1_add <= R1;
				RS2_add <= R2;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when sNAND =>
				MUX_alu <= x"5";
				MUX_sel <= "11";
				MUX_imm <= "00";
				RS1_add <= R1;
				RS2_add <= R2;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when sNOR =>
				MUX_alu <= x"6";
				MUX_sel <= "11";
				MUX_imm <= "00";
				RS1_add <= R1;
				RS2_add <= R2;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when sXNOR =>
				MUX_alu <= x"7";
				MUX_sel <= "11";
				MUX_imm <= "00";
				RS1_add <= R1;
				RS2_add <= R2;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when RTR =>
				MUX_alu <= x"B";
				MUX_sel <= "11";
				MUX_imm <= "00";
				RS1_add <= R1;
				RS2_add <= R2;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when RTL =>
				MUX_alu <= x"A";
				MUX_sel <= "11";
				MUX_imm <= "00";
				RS1_add <= R1;
				RS2_add <= R2;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when sSLL =>
				MUX_alu <= x"8";
				MUX_sel <= "11";
				MUX_imm <= "00";
				RS1_add <= R1;
				RS2_add <= R2;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when sSRL =>
				MUX_alu <= x"9";
				MUX_sel <= "11";
				MUX_imm <= "00";
				RS1_add <= R1;
				RS2_add <= R2;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when SWAP =>
				MUX_alu <= x"10";
				MUX_sel <= "11";
				MUX_imm <= "00";
				RS1_add <= R1;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when COM =>
				MUX_alu <= x"7";
				MUX_sel <= "11";
				MUX_imm <= "00";
				RS1_add <= R1;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when NEG =>
				MUX_alu <= x"1";
				MUX_sel <= "11";
				MUX_imm <= "00";
				RS1_add <= R1;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when MOV =>
				MUX_alu <= x"0";
				MUX_sel <= "11";
				MUX_imm <= "00";
				RS1_add <= R1;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when SBR =>
				MUX_alu <= x"D";
				MUX_sel <= "11";
				MUX_imm <= "10";
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when CBR =>
				MUX_alu <= x"E";
				MUX_sel <= "11";
				MUX_imm <= "10";
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when SER =>
				MUX_alu <= x"7";
				MUX_sel <= "11";
				MUX_imm <= "00";
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when CLR =>
				MUX_alu <= x"0";
				MUX_sel <= "11";
				MUX_imm <= "00";
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when CFR =>
				SR_clr <= '1';
			when MIR =>
				MUX_alu <= x"C";
				MUX_sel <= "11";
				MUX_imm <= "00";
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when INC =>
				MUX_alu <= x"0";
				MUX_sel <= "11";
				MUX_imm <= "11";
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when DEC =>
				MUX_alu <= x"1";
				MUX_sel <= "11";
				MUX_imm <= "11";
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when NOP =>
			when JMPI =>
				MUX_PC <= "10";
				PC_ld <= '1';
			when JMPR =>
				MUX_PC <= "01";
				PC_ld <= '1';
			when ADDI =>
				MUX_alu <= x"0";
				MUX_sel <= "11";
				MUX_imm <= "01";
				RS1_add <= R1;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when SUBI =>
				MUX_alu <= x"1";
				MUX_sel <= "11";
				MUX_imm <= "01";
				RS1_add <= R1;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when XORI =>
				MUX_alu <= x"4";
				MUX_sel <= "11";
				MUX_imm <= "01";
				RS1_add <= R1;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when BEQ =>
				R1_add <= R1;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when BLT =>
				RS1_add <= R1;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when LD =>
				MUX_alu <= x"0";
				MUX_sel <= "10";
				MUX_imm <= "01";
				RS1_add <= R1;
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when ST =>
				MUX_alu <= x"0";
				MUX_sel <= "11";
				MUX_imm <= "01";
				RS1_add <= IR(11 downto 10);
				RS2_add <= IR(9 downto 8);
				R1_ld <= not(RD(1)) and RD(0);
				R2_ld <= RD(1) and not(RD(0));
				R3_ld <= RD(1) and RD(0);
			when sIN =>
				MUX_sel <= "01"; 
				IN_ld <= '1';
			when sOUT =>
				RS1_add <= IR(11 downto 10);
				OUT_ld <= '1';
			when SBI =>
				MUX_imm <= "10";

			when CBI =>
				MUX_imm <= "10";
				
		end case;
	end process;

	-- port maps
			
	IN_ld <= '0';
	OUT_ld <= '0';
	SR_clr <= '0';
	R1_ld <= '0';
	R2_ld <= '0';
	R3_ld <= '0';
end rtl;
