
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;


entity Suma is
    Port ( Op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Result : out  STD_LOGIC_VECTOR (31 downto 0));
end Suma;

architecture Behavioral of Suma is
--otra cosa
--gfgff
begin

process(Op1,Op2)
	begin
		Result<= STD_LOGIC_VECTOR(unsigned(Op1)+unsigned(Op2));
end process;

end Behavioral;

