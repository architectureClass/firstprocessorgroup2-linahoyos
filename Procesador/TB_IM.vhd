--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_IM IS
END TB_IM;
 
ARCHITECTURE behavior OF TB_IM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InstructionMemory
    PORT(
         rst : IN  std_logic;
         Direccion : IN  std_logic_vector(31 downto 0);
         Salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal Direccion : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Salida : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InstructionMemory PORT MAP (
          rst => rst,
          Direccion => Direccion,
          Salida => Salida
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      Direccion <= x"00000000";
		rst <='0';
		
		wait for 20 ns;
		 Direccion <= x"00000001";
		rst <='0';
		
		wait for 20 ns;
		 Direccion <= x"00000002";
		rst <='0';
		
		wait for 5 ns;
		rst <='1';
		
		wait for 5 ns;
		rst <= '0';
		wait for 10 ns;
		
		Direccion <= x"00000000";
		rst <='0';
		wait for 20 ns;


      wait;
   end process;

END;
