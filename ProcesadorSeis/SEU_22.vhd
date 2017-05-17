
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SEU_22 is
    Port ( Imm_22 : in  STD_LOGIC_VECTOR (21 downto 0);
           Imm_32 : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU_22;

architecture Behavioral of SEU_22 is
signal result : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
begin
	process (Imm_22 ) begin
		if (Imm_22 (21)='1') then
			result(31 downto 22) <= (others =>  '1');
			else 
			result(31 downto 22) <= (others =>  '0');
		end if;
		result (21 downto 0) <= Imm_22 ;
	end process;
	Imm_32 <= result;


end Behavioral;

