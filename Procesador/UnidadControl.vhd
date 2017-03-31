
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity UnidadControl is
    Port ( op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           salida : out  STD_LOGIC_VECTOR (5 downto 0));
end UnidadControl;

architecture arq_UnidadControl of UnidadControl is
begin
	process(op3,op)
		begin
			if(op="10") then
					---case op3 is
								--when "000001" =>  --Add
					 --when others => null
					--end case;
			end if;		
	end process;

end arq_UnidadControl;

