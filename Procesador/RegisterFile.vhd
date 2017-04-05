
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


entity RegisterFile is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           rst : in  STD_LOGIC;
           DWR : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is

type ram is array(31 downto 0) of std_logic_vector(31 downto 0);
signal registers : ram := (others => "00000000000000000000000000000000");

begin

	process(rst, rs1, rs2, rd, DWR)
	begin
		if(rst = '1') then
			registers <= (others => "00000000000000000000000000000000");
			CRs1 <= (others => '0');
			CRs2 <= (others => '0');
		else
			if(rd /= "00000") then
				registers(conv_integer(rd)) <= DWR;
			end if;
			CRs1 <= registers(conv_integer(rs1));
			CRs2 <= registers(conv_integer(rs2)); 
		end if;
	end process;


end Behavioral;

