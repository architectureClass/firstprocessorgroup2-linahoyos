
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity SEU_30 is
    Port ( Imm_30 : in  STD_LOGIC_VECTOR (29 downto 0);
           Imm_32 : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU_30;

architecture Behavioral of SEU_30 is
signal result : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
begin
	process (Imm_30) begin
		if (Imm_30(29)='1') then
			result(31 downto 30) <= (others =>  '1');
			else 
			result(31 downto 29) <= (others =>  '0');
		end if;
		result (29 downto 0) <= Imm_30;
	end process;
	Imm_32 <= result;

end Behavioral;

