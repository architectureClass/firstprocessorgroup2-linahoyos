library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexor_Register is
    Port ( DatoMemoria_Out : in  STD_LOGIC_VECTOR (31 downto 0);
           Alu_Out : in  STD_LOGIC_VECTOR (31 downto 0);
           Pc_Out : in  STD_LOGIC_VECTOR (31 downto 0);
           Selector : in  STD_LOGIC_VECTOR (1 downto 0);
           DataToreg : out  STD_LOGIC_VECTOR (31 downto 0));
end Multiplexor_Register;

architecture Behavioral of Multiplexor_Register is

begin
	process(DatoMemoria_Out, Alu_Out, Pc_Out, Selector)
begin
	case Selector is
		
		when "00" => DataToreg <= DatoMemoria_Out;
		when "01" => DataToreg <= Alu_Out;
		when "10" => DataToreg <= Pc_Out;
		when others => DataToreg <= Pc_Out; 
	end case;
end process;

end Behavioral;

