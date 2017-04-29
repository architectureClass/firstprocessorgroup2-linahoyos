
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity PSR is
    Port ( nCwp : in  STD_LOGIC_VECTOR (4 downto 0);
           NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
           rts : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           cwp : out  STD_LOGIC_VECTOR (4 downto 0);
           C : out  STD_LOGIC);
end PSR;

architecture Behavioral of PSR is

signal  cwp_Salida : STD_LOGIC_VECTOR (4 downto 0) := "00000";
signal  c_Salida : STD_LOGIC :='0';

begin
process(NZVC,rts,clk)
	begin
			if(rts = '1') then
				cwp_Salida  <="00000";
				c_Salida <= '0';
			
			else
				if(rising_edge(clk)) then
				cwp_Salida <= nCwp;
				c_Salida <= NZVC(0);
				end if;
			end if;
	end process;
	
cwp <= cwp_Salida;
C <= c_Salida;

end Behavioral;

