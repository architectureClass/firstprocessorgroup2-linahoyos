library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


entity DataMemory is
    Port ( CRD : in  STD_LOGIC_VECTOR (31 downto 0);
           AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           DataResult : out  STD_LOGIC_VECTOR (31 downto 0));
end DataMemory;

architecture Behavioral of DataMemory is
type ram is array(99 downto 0) of std_logic_vector(31 downto 0);
signal registers : ram := (others => "00000000000000000000000000000000");
signal   DataResult_aux : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
begin
process(CRD,AluResult,WE, rst)
begin
	if rst = '1' then
		registers <= (others => "00000000000000000000000000000000");
	else
		if WE ='1' then
		 registers(conv_integer(AluResult)) <= CRD;
		end if;
		DataResult_aux <=registers(conv_integer(AluResult));
	end if;	

end process;
 DataResult <= DataResult_aux;
end Behavioral; 

