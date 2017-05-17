
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Mux_DWR IS
END TB_Mux_DWR;
 
ARCHITECTURE behavior OF TB_Mux_DWR IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux_DWR
    PORT(
         DataM : IN  std_logic_vector(31 downto 0);
         AluR : IN  std_logic_vector(31 downto 0);
         Pc : IN  std_logic_vector(31 downto 0);
         Rfwsc : IN  std_logic_vector(1 downto 0);
         DWR : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DataM : std_logic_vector(31 downto 0) := (others => '0');
   signal AluR : std_logic_vector(31 downto 0) := (others => '0');
   signal Pc : std_logic_vector(31 downto 0) := (others => '0');
   signal Rfwsc : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal DWR : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux_DWR PORT MAP (
          DataM => DataM,
          AluR => AluR,
          Pc => Pc,
          Rfwsc => Rfwsc,
          DWR => DWR
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
         DataM  <= x"00005000";
         AluR <= x"00000000";
         Pc <= x"00000001";
         Rfwsc <= "01";
			wait for 20 ns;
			DataM  <= x"00000004";
         AluR <= x"0000000C";
         Pc <= x"00000001";
         Rfwsc <="10";
			
			wait for 20 ns;
			DataM  <= x"0000000A";
         AluR <= x"0000000C";
         Pc <= x"00000010";
         Rfwsc <="00";
         wait for 20 ns;
			DataM  <= x"0000000B";
         AluR <= x"0000000F";
         Pc <= x"00000001";
         Rfwsc <= "11";
		 
		

      -- insert stimulus here 

      wait;
   end process;

END;
