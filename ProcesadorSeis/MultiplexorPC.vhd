library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MultiplexorPC is
    Port ( Disp30 : in  STD_LOGIC_VECTOR (31 downto 0);
           Disp22 : in  STD_LOGIC_VECTOR (31 downto 0);
           PC1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Direccion : in  STD_LOGIC_VECTOR (31 downto 0);
           Selector : in  STD_LOGIC_VECTOR (1 downto 0);
			  Direccion_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end MultiplexorPC;

architecture Behavioral of MultiplexorPC is

begin
	process(Disp30, Disp22, PC1, Direccion, Selector)
begin
	case Selector is
		
		when "00" => Direccion_Out <= Direccion;
		when "01" => Direccion_Out <= Disp30;
		when "10" => Direccion_Out <= Disp22;
		when "11" => Direccion_Out <= PC1;
		when others => Direccion_Out <= PC1;
		
	end case;
end process;

end Behavioral;

