LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY MultiplexorPC_TB IS
END MultiplexorPC_TB;
 
ARCHITECTURE behavior OF MultiplexorPC_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MultiplexorPC
    PORT(
         Disp30 : IN  std_logic_vector(31 downto 0);
         Disp22 : IN  std_logic_vector(31 downto 0);
         PC1 : IN  std_logic_vector(31 downto 0);
         Direccion : IN  std_logic_vector(31 downto 0);
         Selector : IN  std_logic_vector(1 downto 0);
         Direccion_Out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Disp30 : std_logic_vector(31 downto 0) := (others => '0');
   signal Disp22 : std_logic_vector(31 downto 0) := (others => '0');
   signal PC1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Direccion : std_logic_vector(31 downto 0) := (others => '0');
   signal Selector : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Direccion_Out : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MultiplexorPC PORT MAP (
          Disp30 => Disp30,
          Disp22 => Disp22,
          PC1 => PC1,
          Direccion => Direccion,
          Selector => Selector,
          Direccion_Out => Direccion_Out
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Selector <= "00";
		Direccion <= "00000000000000000000000000001111";
		Disp30 <= "00000000000000000000000011110000";
		Disp22 <= "00000000000000000000111100000000";
		PC1 <= "00000000000000001111000000000000";
      wait for 100 ns;
		
		Selector <= "01";
		Direccion <= "00000000000000000000000000001111";
		Disp30 <= "00000000000000000000000011110000";
		Disp22 <= "00000000000000000000111100000000";
		PC1 <= "00000000000000001111000000000000";
      wait for 100 ns;
			
		Selector <= "10";
		Direccion <= "00000000000000000000000000001111";
		Disp30 <= "00000000000000000000000011110000";
		Disp22 <= "00000000000000000000111100000000";
		PC1 <= "00000000000000001111000000000000";
      wait for 100 ns;	
		
		Selector <= "11";
		Direccion <= "00000000000000000000000000001111";
		Disp30 <= "00000000000000000000000011110000";
		Disp22 <= "00000000000000000000111100000000";
		PC1 <= "00000000000000001111000000000000";
      wait for 100 ns;	

    
      wait;
   end process;

END;
