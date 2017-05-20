library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity WindowsManager is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           cwp : in  STD_LOGIC;
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ncwp : out  STD_LOGIC;
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrd : out  STD_LOGIC_VECTOR (5 downto 0);
           ro7 : out  STD_LOGIC_VECTOR (5 downto 0));
end WindowsManager;

architecture Behavioral of WindowsManager is

signal rs1Int,rs2Int,rdInt: integer range 0 to 39 := 0;
signal aux: STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
begin
process(rs1, rs2, rd, cwp, op, op3, rs1Int, rs2Int, rdInt)
begin
	
	if(cwp = '1') then
		aux <= "010000";
	else
		aux <= "000000";
	end if;
	ro7 <= aux + "01111";
	if(op = "10" and op3 = "111100") then --SAVE
		ncwp <= '0';
	
	else
		if(op = "10" and op3 = "111101") then --RESTORE
			ncwp <= '1';
		end if;
	end if;
	
	if(rs1 >= "00000" and rs1 <= "00111") then
		rs1Int <= conv_integer(rs1);
	
	else
		if(rs1 >= "01000" and rs1 <= "01111") then
			rs1Int <= conv_integer(rs1) + (conv_integer(cwp)*16);
			
		else
			if(rs1 >= "10000" and rs1 <= "10111") then
				rs1Int <= conv_integer(rs1) + (conv_integer(cwp)*16);
				
			else
				if(rs1 >= "11000" and rs1 <= "11111") then
				rs1Int <= conv_integer(rs1) - (conv_integer(cwp)*16);
				end if;
			end if;
		end if;
	end if;
	
	if(rs2 >= "00000" and rs2 <= "00111") then
		rs2Int <= conv_integer(rs2);
	
	else
		if(rs2 >= "01000" and rs2 <= "01111") then
			rs2Int <= conv_integer(rs2) + (conv_integer(cwp)*16);
			
		else
			if(rs2 >= "10000" and rs2 <= "10111") then
				rs2Int <= conv_integer(rs1) + (conv_integer(cwp)*16);
				
			else
				if(rs2 >= "11000" and rs2 <= "11111") then
				rs2Int <= conv_integer(rs2) - (conv_integer(cwp)*16);
				end if;
			end if;
		end if;
	end if;
	
	if(rd >= "00000" and rd <= "00111") then
		rdInt <= conv_integer(rd);
	
	else
		if(rd >= "01000" and rd <= "01111") then
			rdInt <= conv_integer(rd) + (conv_integer(cwp)*16);
			
		else
			if(rd >= "10000" and rd <= "10111") then
				rdInt <= conv_integer(rd) + (conv_integer(cwp)*16);
				
			else
				if(rd >= "11000" and rd <= "11111") then
				rdInt <= conv_integer(rd) - (conv_integer(cwp)*16);
				end if;
			end if;
		end if;
	end if;
end process;
nrs1 <= conv_std_logic_vector(rs1Int,6);
nrs2 <= conv_std_logic_vector(rs2Int,6);
nrd <= conv_std_logic_vector(rdInt,6);
end Behavioral;

