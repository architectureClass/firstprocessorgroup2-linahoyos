
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( suma1 : in  STD_LOGIC_VECTOR (31 downto 0);
           suma2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  carry :  in  STD_LOGIC;
           alu_op : in  STD_LOGIC_VECTOR (5 downto 0);
           salida_alu : out  STD_LOGIC_VECTOR (31 downto 0));
end alu;

architecture Behavioral of alu is


signal result : std_logic_vector (31 downto 0) := x"00000000";
begin 
process (suma1,suma2,alu_op)
begin
		case (alu_op) is
                  when "000000" => -- add 
								result <= suma1 + suma2;
						
                  when "000001" =>--AND
								result <= suma1 and suma2;
						when "000010" =>--OR
								result <= suma1 or suma2;
						when "000011" =>--xor
								result <= suma1 xor suma2;
						when "000100" =>--xnor
								result <= suma1 xnor suma2;
						when  "000101"=>--Sub
								result <= suma1 - suma2;
						
						when "000110"=>--Nand
								result<=suma1 and not suma2;
						when "000111"=>--nor
								result<= suma1 or not suma2;
						when "001000"=>--addcc
								result <= suma1 + suma2;
						when "001001"=>--subcc
								result <= suma1 - suma2;
						when "001010" =>--andcc
								result<= suma1 and suma2;
						when "001011" =>--andncc
								result<= suma1 and not suma2;
						when "001100" => --orcc
								result <= suma1 or suma2;
						when "001101" =>--orncc
								result <= suma1 or not suma2;
						
						when "010001"=>--addx
								result <= suma1 + suma2 + carry;
						when "010010" =>--addxcc
								result <= suma1 + suma2 + carry;
						when "010011" => --subx
								result <= suma1 - suma2 - carry;
						when "010100" => --subxcc
								result <= suma1 - suma2 - carry;
								
						when "010101" => --xorcc
								result <=  suma1 xor suma2;
						when "011010" => --jump and link
						    result <= suma1 + suma2;
						when "011011"=> --load
							 result <= suma1+ suma2;
						when "011100"=> --store
							 result <= suma1+ suma2;
						
						
					
				    	when others => --nops
				          result<= x"00000000";
	
				end case;	
	  end process; 
	 salida_alu <= result;	
				
end Behavioral;

