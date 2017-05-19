
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PSR is
   Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           ncwp : in  STD_LOGIC_VECTOR (4 downto 0);
           cwp : out  STD_LOGIC_VECTOR (4 downto 0);
           c : out  STD_LOGIC;
			  icc : out STD_LOGIC_VECTOR (3 downto 0));
end PSR;

architecture Behavioral of PSR is
signal cwp_Aux : STD_LOGIC_VECTOR (4 downto 0) := "00000";
signal c_Aux : STD_LOGIC := '0';
begin
 	process(clk, rst, nzvc, ncwp) begin
		if(rst='1') then
			cwp_Aux<= "00000";
			c_Aux <= '0';
		end if;
		if(rising_edge(clk)) then
			cwp <= nCwp;
			c <= nzvc(0);
			icc <= nzvc;
		end if;
	
	
	end process;


end Behavioral;

