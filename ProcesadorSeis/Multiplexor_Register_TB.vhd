LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Multiplexor_Register_TB IS
END Multiplexor_Register_TB;
 
ARCHITECTURE behavior OF Multiplexor_Register_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Multiplexor_Register
    PORT(
         DatoMemoria_Out : IN  std_logic_vector(31 downto 0);
         Alu_Out : IN  std_logic_vector(31 downto 0);
         Pc_Out : IN  std_logic_vector(31 downto 0);
         Selector : IN  std_logic_vector(1 downto 0);
         DataToreg : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DatoMemoria_Out : std_logic_vector(31 downto 0) := (others => '0');
   signal Alu_Out : std_logic_vector(31 downto 0) := (others => '0');
   signal Pc_Out : std_logic_vector(31 downto 0) := (others => '0');
   signal Selector : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal DataToreg : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplexor_Register PORT MAP (
          DatoMemoria_Out => DatoMemoria_Out,
          Alu_Out => Alu_Out,
          Pc_Out => Pc_Out,
          Selector => Selector,
          DataToreg => DataToreg
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Selector <= "00";
		DatoMemoria_Out <= "00000000000000000000000000001111";
		Alu_Out <= "00000000000000000000000011110000";
		Pc_Out <= "00000000000000000000111100000000";
      wait for 100 ns;
		
		Selector <= "10";
		DatoMemoria_Out <= "00000000000000000000000000001111";
		Alu_Out <= "00000000000000000000000011110000";
		Pc_Out <= "00000000000000000000111100000000";
      wait for 100 ns;
		
		Selector <= "01";
		DatoMemoria_Out <= "00000000000000000000000000001111";
		Alu_Out <= "00000000000000000000000011110000";
		Pc_Out <= "00000000000000000000111100000000";
      wait for 100 ns; 

      -- insert stimulus here 

      wait;
   end process;

END;
