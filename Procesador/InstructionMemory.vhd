library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use std.textio.all;

entity InstructionMemory is
    Port ( --rst : in  STD_LOGIC;
           Direccion : in  STD_LOGIC_VECTOR (31 downto 0);
           Salida : out  STD_LOGIC_VECTOR (31 downto 0));
end InstructionMemory;

architecture Behavioral of InstructionMemory is
type rom_type is array (0 to 63) of std_logic_vector (31 downto 0);
--signal instructions : rom_type := InitRomFromFile("prueba.data");

		
impure function InitRomFromFile (RomFileName : in string) return rom_type is
	FILE RomFile : text open read_mode is RomFileName;
	variable RomFileLine : line;
	variable temp_bv : bit_vector(31 downto 0);
	variable temp_mem : rom_type;
	begin
		for I in rom_type'range loop
			readline (RomFile, RomFileLine);
			read(RomFileLine, temp_bv);
			temp_mem(i) := to_stdlogicvector(temp_bv);
		end loop;
	return temp_mem;
end function;
	
signal instructions : rom_type := InitRomFromFile("testJMPL.data");

	
begin
	--process(rst,Direccion)
	--begin
		--if rst='1' then
			--instructions<=(others => "00000000000000000000000000000000");
			--else
				salida<= instructions(conv_integer(Direccion(5 downto 0)));
			
		--end if;
	--end process;
end Behavioral;

