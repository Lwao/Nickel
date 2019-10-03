library ieee;
use ieee.std_logic_1164.all;

entity controller is

	port(
		clk, reset: in	std_logic;
		IR: in std_logic_vector(15 downto 0);
		R1_ld, R2_ld, R3_ld, D_rd, D_wr: out std_logic;
		PC_clr, PC_ld, I_ld, IR_ld, OUT_ld, IN_ld: out std_logic;
		RS1_add, RS2_add, MUX_imm, MUX_sel, MUX_PC: out std_logic_vector (2 downto 0);
		MUX_alu: out std_logic_vector(3 downto 0);
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

begin
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
					end case;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when s0 =>
				output <= "00";
			when s1 =>
				output <= "01";
			when s2 =>
				output <= "10";
			when s3 =>
				output <= "11";
		end case;
	end process;

end rtl;
