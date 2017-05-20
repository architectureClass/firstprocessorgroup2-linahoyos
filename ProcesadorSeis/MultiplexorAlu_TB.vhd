LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY MultiplexorAlu_TB IS
END MultiplexorAlu_TB;
 
ARCHITECTURE behavior OF MultiplexorAlu_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MultiplexorAlu
    PORT(
         Entrada1 : IN  std_logic_vector(31 downto 0);
         Entrada2 : IN  std_logic_vector(31 downto 0);
         Selector : IN  std_logic;
         Salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Entrada1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Entrada2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Selector : std_logic := '0';

 	--Outputs
   signal Salida : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MultiplexorAlu PORT MAP (
          Entrada1 => Entrada1,
          Entrada2 => Entrada2,
          Selector => Selector,
          Salida => Salida
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      Entrada1 <= x"00000000";
		Entrada2 <= x"0000000F";
		Selector <= '1';
		wait for 100 ns;
		
		Entrada1 <= x"00000000";
		Entrada2 <= x"0000000F";
		Selector <= '0';
		wait for 100 ns;
      wait;
   end process;

END;
