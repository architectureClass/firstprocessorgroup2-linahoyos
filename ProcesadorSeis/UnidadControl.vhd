
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity UnidadControl is
    Port ( op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
			  icc : in  STD_LOGIC_VECTOR (3 downto 0);
			  cond :in  STD_LOGIC_VECTOR (3 downto 0);
           salida : out  STD_LOGIC_VECTOR (5 downto 0);
			  R_WE :out STD_LOGIC;
			  D_WE : out STD_LOGIC;
			  rfdsc : out STD_LOGIC;
			  pcsc: out  STD_LOGIC_VECTOR (1 downto 0);
			  rfWsc : out  STD_LOGIC_VECTOR (1 downto 0)
			  
			  );
end UnidadControl;

architecture arq_UnidadControl of UnidadControl is
signal result : std_logic_vector (5 downto 0) := "000000";
signal pcsc_Aux : std_logic_vector (1 downto 0) := "00";
signal R_WE_Aux : std_logic :='0';
signal D_WE_Aux : std_logic :='0';
signal rfdsc_Aux : std_logic :='0';
signal rfWsc_Aux : std_logic_vector (1 downto 0) := "00";

begin
	process(op3,op,icc,cond)
		begin
		case(op) is
			when "00" =>--BRANCH
			
				R_WE_Aux <= '0';
				D_WE_Aux <= '0';
				--salida <= "000000";
				pcsc_Aux<= "00";
				if(op3(5 downto 3 )="010")then
					case(cond) is
						when "1000" =>--BA
							pcsc_Aux <="10";
						when "0000" =>--BN
							pcsc_Aux<="00";
						when "1001"=>--BNE
							if icc(2)= '0' then
								pcsc_Aux <= "10";
							end if;
						when "0001" => --BE
							if icc(2)='1' then
								pcsc_Aux <= "10";
							end if;
						when "1010" => --BG
							if (icc(2) or (icc(3) xor icc(1)))= '0' then
								pcsc_Aux <="10";
							end if;
						when "0010" =>--BLE
							if (icc(2) or (icc(3)xor icc(1)))='1' then
								pcsc_Aux <= "10";
							end if;
						when "1011" => --BGE
							if(icc(3)xor icc(1))='0' then
							 pcsc_Aux <="10";
							end if;
						when "0011" => --Bl
							if (icc(3) xor icc(1)) ='1' then
							pcsc_Aux <="10";
							end if;
						when "1100" => --BGU
							if (icc(0) xor icc(2)) ='0' then
							pcsc_Aux <="10";
							end if;
						when "0100" => --BLEU
							if (icc(0) xor icc(2)) ='1' then
							pcsc_Aux <="10";
							end if;
						when "1101" => --BCC
							if (icc(0)) ='0' then
								pcsc_Aux <="10";
							end if;
						when "0101" => --BCS
							if (icc(0)) ='1' then
								pcsc_Aux <="10";
							end if;
						when "1110" => --BPOS
							if (icc(3)) ='0' then
								pcsc_Aux <="10";
							end if;
						when "0110" => --BNEG
							if (icc(3)) ='1' then
								pcsc_Aux <="10";
							end if;
					  when "1111" => --BVC
							if (icc(1)) ='0' then
								pcsc_Aux <="10";
							end if;
						when "0111" => --BVS
							if (icc(1)) ='1' then
								pcsc_Aux <="10";
							end if;
						when others =>
							pcsc_Aux<= "00";	
					end case;
				end if;
			when "01" =>--CALL
					R_WE_Aux <= '1';
					D_WE_Aux <='0';
					pcsc_Aux <= "01";
					rfdsc_Aux <='1';
					rfWsc_Aux <= "01";---escribe lo que es pc
					
					--salida<="000000";
			
			
			when "10" =>
				R_WE_Aux <='1';
				D_WE_Aux <='0';
				pcsc_Aux <="00";
				rfdsc_Aux <='0';
				rfWsc_Aux<= "00";--resultado de la alu 
				
				
				
				case op3 is
					when "000000" =>--Add
						result <= "000000";
					
					when "000001" =>--	And
						result <= "000001";
				
					when "000100" =>--	Sub
						result <= "000101";
				
					when "000010" =>--	OR
						result <= "000010";
				
					when "000011" =>--	xor
						result <= "000011";
					
					when "000111" => --	xnor
						result <= "000100";
					when "010000" => --addcc
						result <= "001000";
					when "001000" => --addx
						result <= "010001";
					when "011000" => --addxcc
						result <= "010010";
					when "010100" => --subcc
						result <= "001001";
					when "001100" =>-- subx
						result <="010011";
					when "011100" => --subxcc
						result <= "010100";
					when "010001" => --andcc
						result <= "001010";
					when "010010" => --orcc
						result <= "001100";
					when "010101" => --andncc
						result <= "001011";
					when "010110" => --orncc
						result <= "001101";
					when "010011" => --xorcc
						result <= "010101";
					when "111000"=> --jump an link
						result <= "011010";
						pcsc_Aux <= "11";
						rfWsc_Aux <="01";
						
					
					when others => result <= "111111";
					end case;
					
					
			when "11" => -- load and store
			      rfWsc_Aux <= "10";--seltado de data memory
					rfdsc_Aux <='0';
					pcsc_Aux <="00";
				  case(op3) is
					when"000000" => --load
					 R_WE_Aux <='1';
					 D_WE_Aux <='0';
					 result <="011011";
					when "000100" => --store
						R_WE_Aux<='0';
						D_WE_Aux <='1';
						result <="011100";
					when others =>
						R_WE_Aux<='0';
						D_WE_Aux <='0';
						
				  end case;
			
		
			when others => null;
		end case;

	end process;
 salida<=result;
 R_WE <= R_WE_Aux;
 D_WE <= D_WE_Aux;
 pcsc <= pcsc_Aux;
 rfdsc <= rfdsc_Aux;
 rfWsc <= rfWsc_Aux;
end arq_UnidadControl;

