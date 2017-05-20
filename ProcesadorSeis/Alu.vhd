library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Alu is
    Port ( Op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Selector : in  STD_LOGIC_VECTOR (5 downto 0);
           Carry : in  STD_LOGIC;
           Salida : out  STD_LOGIC_VECTOR (31 downto 0));
end Alu;

architecture Behavioral of Alu is

begin
	process(Op1, Op2, Selector, Carry)
	begin
		case Selector is
			when "000000" => Salida <= Op1 + Op2;
			when "000001" => Salida <= Op1 - Op2;
			when "000010" => Salida <= Op1 and Op2;
			when "000011" => Salida <= Op1 or Op2;
			when "000100" => Salida <= Op1 xor Op2;
			when "000101" => Salida <= Op1 xnor Op2;
			when "000110" => Salida <= Op1 nand Op2;
			when "000111" => Salida <= Op1 nor Op2;
			when "001000" => Salida <= Op1 + Op2 + Carry;
			when "001001" => Salida <= Op1 + Op2;
			when "001010" => Salida <= Op1 + Op2 + Carry;
			when "001011" => Salida <= Op1 - Op2 - Carry;
			when "001100" => Salida <= Op1 - Op2;
			when "001101" => Salida <= Op1 - Op2 - Carry;
			when "001110" => Salida <= Op1 and Op2;
			when "001111" => Salida <= Op1 nand Op2;
			when "010000" => Salida <= Op1 or Op2;
			when "010001" => Salida <= Op1 nor Op2;
			when "010010" => Salida <= Op1 xor Op2;
			when "010011" => Salida <= Op1 xnor Op2;
			when "010100" => Salida <= to_stdlogicvector(to_bitvector(Op1) sll conv_integer(Op2));
			when "010101" => Salida <= to_stdlogicvector(to_bitvector(Op1) srl conv_integer(Op2));
			when others => Salida <= (others => '0');
		end case;
	end process;
end Behavioral;


