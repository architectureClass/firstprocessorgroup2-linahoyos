
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Mux_DM is
Port ( DataMem : in  STD_LOGIC_VECTOR (31 downto 0);
           AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           PC : in  STD_LOGIC_VECTOR (31 downto 0);
           RFSC : in  STD_LOGIC_VECTOR (1 downto 0);
           DWR : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux_DM;

architecture Behavioral of Mux_DM is

begin
process (DataMem,AluResult,PC,RFSC) begin
		case (RFSC) is 
		when "11" => 
		DWR <= DataMem;
		when "00" =>
		DWR <= AluResult;
		when "01" =>
		DWR <= PC;
		when others => 
			DWR <= AluResult;
	end case;
end process;
end Behavioral;

