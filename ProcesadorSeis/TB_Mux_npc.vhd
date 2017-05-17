
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Mux_npc IS
END TB_Mux_npc;
 
ARCHITECTURE behavior OF TB_Mux_npc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux_npc
    PORT(
         Call : IN  std_logic_vector(31 downto 0);
         Branch : IN  std_logic_vector(31 downto 0);
         npc : IN  std_logic_vector(31 downto 0);
         jump : IN  std_logic_vector(31 downto 0);
         pcsc : IN  std_logic_vector(1 downto 0);
         Salida_npc : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Call : std_logic_vector(31 downto 0) := (others => '0');
   signal Branch : std_logic_vector(31 downto 0) := (others => '0');
   signal npc : std_logic_vector(31 downto 0) := (others => '0');
   signal jump : std_logic_vector(31 downto 0) := (others => '0');
   signal pcsc : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Salida_npc : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux_npc PORT MAP (
          Call => Call,
          Branch => Branch,
          npc => npc,
          jump => jump,
          pcsc => pcsc,
          Salida_npc => Salida_npc
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Call <= x"00000101" ;
		Branch <= x"00000100";
		npc <= x"00000001";
		jump <= x"00000010";
		pcsc <= "00";
		wait for 20 ns;	
		Call <= x"00000010" ;
		Branch <= x"00000101";
		npc <= x"00000010";
		jump <= x"00000110";
		pcsc <= "01";
		wait for 20 ns;	
		Call <= x"00000011" ;
		Branch <= x"00000111";
		npc <= x"00001010";
		jump <= x"00000100";
		pcsc <= "10";
		wait for 20 ns;	
		Call <= x"00000010" ;
		Branch<= x"00000011";
		npc <= x"00011000";
		jump <= x"00000110";
		pcsc <= "11";
      
      

      -- insert stimulus here 

      wait;
   end process;

END;
