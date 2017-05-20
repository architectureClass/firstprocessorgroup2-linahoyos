LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Mux_RF_TB IS
END Mux_RF_TB;
 
ARCHITECTURE behavior OF Mux_RF_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux_RF
    PORT(
         Rd : IN  std_logic_vector(5 downto 0);
         Ro7 : IN  std_logic_vector(5 downto 0);
         Rfdest : IN  std_logic;
         mRd : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Rd : std_logic_vector(5 downto 0) := (others => '0');
   signal Ro7 : std_logic_vector(5 downto 0) := (others => '0');
   signal Rfdest : std_logic := '0';

 	--Outputs
   signal mRd : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux_RF PORT MAP (
          Rd => Rd,
          Ro7 => Ro7,
          Rfdest => Rfdest,
          mRd => mRd
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Rd <= "000001";
		Ro7 <= "100000";
		Rfdest <= '0';
      wait for 100 ns;	
		
		Rd <= "000001";
		Ro7 <= "100000";
		Rfdest <= '1';
      wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
