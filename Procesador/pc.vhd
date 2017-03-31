
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity pc is
    Port ( Data : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           DataS : out  STD_LOGIC_VECTOR (31 downto 0));
end pc;

architecture Behavioral of pc is

begin

process(Data,rst,clk)

 begin 

	if rising_edge(clk) then
			if rst= '1' then
					DataS <= "00000000000000000000000000000000";
			else
					DataS <= Data;
			end if;
	end if;
end process;
		
end Behavioral;

