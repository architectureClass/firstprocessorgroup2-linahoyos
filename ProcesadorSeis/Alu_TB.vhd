LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Alu_TB IS
END Alu_TB;
 
ARCHITECTURE behavior OF Alu_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Alu
    PORT(
         Op1 : IN  std_logic_vector(31 downto 0);
         Op2 : IN  std_logic_vector(31 downto 0);
         Selector : IN  std_logic_vector(5 downto 0);
         Carry : IN  std_logic;
         Salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Op1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Op2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Selector : std_logic_vector(5 downto 0) := (others => '0');
   signal Carry : std_logic := '0';

 	--Outputs
   signal Salida : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Alu PORT MAP (
          Op1 => Op1,
          Op2 => Op2,
          Selector => Selector,
          Carry => Carry,
          Salida => Salida
        );


   -- Stimulus process
   stim_proc: process
   begin		
      
		Op1 <= x"0000000F";
		Op2 <= x"0000000A";
		Selector <= "000000";
		wait for 100 ns;
		
		Op1 <= x"0000000F";
		Op2 <= x"0000000A";
		Selector <= "000001";
      wait for 100 ns;
		
		Op1 <= x"0000000F";
		Op2 <= x"0000000A";
		Selector <= "000010";
		wait for 100 ns;
		
		Op1 <= x"0000000F";
		Op2 <= x"0000000A";
		Selector <= "000011";
      wait for 100 ns;	
		
		Op1 <= x"0000000F";
		Op2 <= x"0000000A";
		Selector <= "000100";
		wait for 100 ns;
		
		Op1 <= x"0000000F";
		Op2 <= x"0000000A";
		Selector <= "000101";
      wait for 100 ns;
		
		Op1 <= x"0000000F";
		Op2 <= x"0000000A";
		Selector <= "000110";
		wait for 100 ns;
		
		Op1 <= x"0000000F";
		Op2 <= x"0000000A";
		Selector <= "000111";
      wait for 100 ns;
		
		Op1 <= x"0000000F";
		Op2 <= x"00000004";
		Selector <= "010100";
      wait for 100 ns;
		
		Op1 <= x"0000000F";
		Op2 <= x"0000000A";
		Carry <= '1';
		Selector <= "001010";
      wait for 100 ns;
		
		Op1 <= x"0000000F";
		Op2 <= x"0000000A";
		Carry <= '0';
		Selector <= "001010";
      wait for 100 ns;
		
		Op1 <= x"0000000F";
		Op2 <= x"0000000A";
		Carry <= '1';
		Selector <= "001011";
      wait for 100 ns;
		
		Op1 <= x"0000000F";
		Op2 <= x"0000000A";
		Carry <= '1';
		Selector <= "000001";
      wait for 100 ns;
		
      wait;
   end process;

END;
