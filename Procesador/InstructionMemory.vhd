
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;

entity InstructionMemory is
    Port ( rst : in  STD_LOGIC;
           Direccion : in  STD_LOGIC_VECTOR (31 downto 0);
           Salida : out  STD_LOGIC_VECTOR (31 downto 0));
end InstructionMemory;

architecture Behavioral of InstructionMemory is


type memory is array(63 downto 0) of std_logic_vector(31 downto 0);
signal dato : memory:=(others => "00000000000000000000000000000000");

begin
	process(rst,Direccion)
	begin
		if rst='1' then
			dato<=(others => "00000000000000000000000000000000");
			else
				salida<= dato(conv_integer(Direccion));
			
		end if;
	end process;
end Behavioral;

