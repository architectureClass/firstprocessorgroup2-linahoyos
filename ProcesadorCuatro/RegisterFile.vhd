library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


entity RegisterFile is
    Port ( nrs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           nrd : in  STD_LOGIC_VECTOR (5 downto 0);
           rst : in  STD_LOGIC;
           DWR : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is

type ram is array(39 downto 0) of std_logic_vector(31 downto 0);
signal registers : ram := (others => "00000000000000000000000000000000");

begin

	process(rst, nrs1, nrs2, nrd, DWR)
	begin
		if(rst = '1') then
			registers <= (others => "00000000000000000000000000000000");
			CRs1 <= (others => '0');
			CRs2 <= (others => '0');
		else
			if(nrd /= "00000") then
				registers(conv_integer(nrd)) <= DWR;
			end if;
			CRs1 <= registers(conv_integer(nrs1));
			CRs2 <= registers(conv_integer(nrs2)); 
		end if;
	end process;


end Behavioral;

