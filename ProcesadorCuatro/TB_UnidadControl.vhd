
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_UnidadControl IS
END TB_UnidadControl;
 
ARCHITECTURE behavior OF TB_UnidadControl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UnidadControl
    PORT(
         op3 : IN  std_logic_vector(5 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         salida : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UnidadControl PORT MAP (
          op3 => op3,
          op => op,
          salida => salida
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		op <= "10";
		op3 <="000000";
		wait for 20 ns;
		
		op <= "10";
		op3 <="000001";
		wait for 20 ns;
		
		op <= "10";
		op3 <="000010";
		wait for 20 ns;
		
		op <= "10";
		op3 <="000011";
		wait for 20 ns;
		
		op <= "10";
		op3 <="000111";
		wait for 20 ns;
      

 

      wait;
   end process;

END;
