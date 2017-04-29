
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity PsrModifier is
    Port ( Crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           Aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           NZVC : out  STD_LOGIC_VECTOR (3 downto 0));
end PsrModifier;

architecture Behavioral of PsrModifier is
signal nzvc_Salida : STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin
process(Crs1,Crs2,AluResult,Aluop)
	begin
		if((Aluop="001000") or (Aluop="010010")) then ---Addcc - Addxcc
			nzvc_Salida(3) <= AluResult(31);
			if(AluResult=x"00000000") then
				nzvc_Salida(2)<='1'; 
			else
					nzvc_Salida(2)<='0';
			end if;
			if((Crs1(31)='1' and Crs2(31)='1' and AluResult(31)='0') or (Crs1(31)='0' and Crs2(31)='0' and AluResult(31)='1')) then
				nzvc_Salida(1)<='1';
			end if;
			if((Crs1(31)='1' and Crs2(31)='1') or (AluResult(31)='0' and (Crs1(31)='1' or Crs2(31)='1')))then
				nzvc_Salida(0)<='1';
			end if;
		end if;
		if(Aluop="001001" or Aluop ="010100")then --Subcc -Subxcc
			nzvc_Salida(3)<='1';
			if(AluResult=x"00000000") then
				nzvc_Salida(2)<='1';
			else
					nzvc_Salida(2)<='0';
			end if;
			if((Crs1(31)='1' and Crs2(31)='0' and AluResult(31)='0') or (Crs1(31)='0' and Crs2(31)='1' and AluResult(31)='1')) then
				nzvc_Salida(1)<='1';
			end if;
			if((Crs1(31)='0' and Crs2(31)='1') or (AluResult(31)='1' and (Crs1(31)='0' or Crs2(31)='1')))then
				nzvc_Salida(0)<='1';
			end if;
		end if;
		if(Aluop="001010" or Aluop= "001011" or Aluop ="001100" or  Aluop="001101" or Aluop="010101" or Aluop="010101" )then --andcc-andncc-orcc-orncc-xorcc-xnorcc
				nzvc_Salida(3)<='1';
				if(AluResult=x"00000000") then
					nzvc_Salida(2)<='1';
				else
					nzvc_Salida(2)<='0';
				end if;
				nzvc_Salida(1)<='0';
				nzvc_Salida(0)<='0';
		end if;
				

end process;
 NZVC <= nzvc_Salida;

end Behavioral;

