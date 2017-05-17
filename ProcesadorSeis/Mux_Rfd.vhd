
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux_Rfd is
    Port ( RD : in  STD_LOGIC_VECTOR (5 downto 0);
           O7 : in  STD_LOGIC_VECTOR (5 downto 0);
           rfdsc : in  STD_LOGIC;
           nRD : out  STD_LOGIC_VECTOR (5 downto 0));
end Mux_Rfd;

architecture Behavioral of Mux_Rfd is
signal  nRD_aux : STD_LOGIC_VECTOR (5 downto 0) := "000000";
begin
process(RD,O7,rfdsc)
begin
	case(rfdsc) is
		when '0' =>
		  nRD_aux <=RD;
		when '1' =>
		  nRD_aux <=O7;
		 when  others =>
			nRD_aux <= RD;
	end case;	
end process;
nRD <=nRD_aux;

end Behavioral;

