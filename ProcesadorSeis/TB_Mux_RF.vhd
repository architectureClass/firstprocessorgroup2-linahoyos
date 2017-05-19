
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Mux_RF IS
END TB_Mux_RF;
 
ARCHITECTURE behavior OF TB_Mux_RF IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux_RF
    PORT(
         Rd : IN  std_logic_vector(5 downto 0);
         O7 : IN  std_logic_vector(5 downto 0);
         RFDEST : IN  std_logic;
         nRD : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Rd : std_logic_vector(5 downto 0) := (others => '0');
   signal O7 : std_logic_vector(5 downto 0) := (others => '0');
   signal RFDEST : std_logic := '0';

 	--Outputs
   signal nRD : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux_RF PORT MAP (
          Rd => Rd,
          O7 => O7,
          RFDEST => RFDEST,
          nRD => nRD
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
   DataMem <= x"00000000";
   AluResult <= x"00000000";
   PC <= x"00000000";
   RFSC <= "00";  
      wait for 100 ns;	
		
	DataMem <= x"00000100";
   AluResult <= x"00803000";
   PC <= x"00F09000";
   RFSC <= "00"; 
		wait for 10 ns;
		
	DataMem <= x"000A0100";
   AluResult <= x"0000300D";
   PC <= x"00E09000";
   RFSC <= "01"; 
		wait for 10 ns;
		
	DataMem <= x"0A000100";
   AluResult <= x"008A3000";
   PC <= x"00F09000";
   RFSC <= "10"; 
		wait for 10 ns;
		
	DataMem <= x"00A00100";
   AluResult <= x"008030B0";
   PC <= x"00F08500";
   RFSC <= "11";
		wait for 10 ns;
      wait;
   end process;

END;
