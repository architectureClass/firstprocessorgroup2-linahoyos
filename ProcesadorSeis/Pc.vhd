library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Pc is
  Port ( Data : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end Pc;

architecture Behavioral of Pc is
signal DataValue : std_logic_vector(31 downto 0) := x"00000000";
begin
process(CLK, rst, Data) begin 
	if(rst = '1') then 
		DataValue <= (others => '0');
	elsif(rising_edge(CLK)) then
		if(Data < 102) then
			DataValue <= Data;
		end if;
	end if;

end process;
DataOut <= DataValue;

end Behavioral;

