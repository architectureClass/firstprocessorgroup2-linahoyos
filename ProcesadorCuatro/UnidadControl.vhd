
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity UnidadControl is
    Port ( op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           salida : out  STD_LOGIC_VECTOR (5 downto 0));
end UnidadControl;

architecture arq_UnidadControl of UnidadControl is
signal result : std_logic_vector (5 downto 0) := "000000";
begin
	process(op3,op)
		begin
		case(op) is
		
			when "10" =>
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
				
				when others => result <= "111111";
				end case;
				
				when others => result <= "111111";
		end case;

	end process;
 salida<=result;
end arq_UnidadControl;

