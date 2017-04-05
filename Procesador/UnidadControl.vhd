
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity UnidadControl is
    Port ( op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           salida : out  STD_LOGIC_VECTOR (5 downto 0));
end UnidadControl;

architecture arq_UnidadControl of UnidadControl is
signal result : std_logic_vector (5 downto 0) := "000000";
begin
	process(op3,op)
		begin
		case(op) is
		
			when "10" =>
				if(op3="000000") then--Add
					result <= "000000";
				end if;
				if(op3="000001") then--	And
					result <= "000001";
				end if;
				if(op3="000100") then--	Sub
					result <= "000101";
				end if;
				if(op3="000010") then--	OR
					result <= "000010";
				end if;
			
				
				if(op3="000011") then--	xor
					result <= "000011";
				end if;
				if(op3="000111") then--	xnor
					result <= "000100";
				end if;
				
			
			when others => result <= "111111";
		end case;

	end process;

end arq_UnidadControl;

