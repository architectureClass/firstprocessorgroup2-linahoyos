LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_RF is
    Port ( Rd : in  STD_LOGIC_VECTOR (5 downto 0);
           Ro7 : in  STD_LOGIC_VECTOR (5 downto 0);
           Rfdest : in  STD_LOGIC;
           mRd : out  STD_LOGIC_VECTOR (5 downto 0));
end Mux_RF;

architecture Behavioral of Mux_RF is

begin

process(Rd, Ro7, Rfdest)
begin
	if(Rfdest = '0') then --Rd
		mRd <= Rd;
	else
		mRd <= Ro7; --Registro O7
	end if;
end process;


end Behavioral;

