
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX is
    Port ( i : in  STD_LOGIC;
           imm32 : in  STD_LOGIC_VECTOR (31 downto 0);
           Crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Salida : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX;

architecture Behavioral of MUX is
begin
process (Crs2,imm32,i) begin
	
	case (i) is 
		when '0' => 
		Salida <= Crs2;
		when '1' =>
		Salida <= imm32;
		when others => null;
	end case;
	
end process;

end Behavioral;

