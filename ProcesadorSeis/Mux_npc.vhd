
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Mux_npc is
    Port ( Call : in  STD_LOGIC_VECTOR (31 downto 0);
           Branch : in  STD_LOGIC_VECTOR (31 downto 0);
           npc : in  STD_LOGIC_VECTOR (31 downto 0);
           jump : in  STD_LOGIC_VECTOR (31 downto 0);
           pcsc : in  STD_LOGIC_VECTOR (1 downto 0);
           Salida_npc : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux_npc;

architecture Behavioral of Mux_npc is
signal  Salida_aux : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
begin
process(Call,Branch,npc,jump,pcsc )
begin
   case(pcsc) is
		when "00" =>
			Salida_aux <= npc;
		when "01" =>
		   Salida_aux <= Call;
		when "10" =>
			Salida_aux <= Branch;
		when "11" =>
			Salida_aux <= jump;
      when others =>
			Salida_aux <= npc;
	end case;
 end process;
Salida_npc<=Salida_aux;

end Behavioral;

