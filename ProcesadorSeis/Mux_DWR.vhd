
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux_DWR is
    Port ( DataM : in  STD_LOGIC_VECTOR (31 downto 0);
           AluR : in  STD_LOGIC_VECTOR (31 downto 0);
           Pc : in  STD_LOGIC_VECTOR (31 downto 0);
           Rfwsc : in  STD_LOGIC_VECTOR (1 downto 0);
           DWR : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux_DWR;

architecture Behavioral of Mux_DWR is
signal  DWR_aux : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
begin
process(DataM,AluR,Pc,Rfwsc)
begin 
	case(Rfwsc) is
		when "10" =>
		 DWR_aux<= DataM;
		when "00" =>
		 DWR_aux<= AluR;
		when "01" =>
		 DWR_aux<= Pc;
		when others =>
		  DWR_aux<= AluR;
	end case;
end process;
DWR <= DWR_aux;

end Behavioral;

