
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Rfd IS
END TB_Rfd;
 
ARCHITECTURE behavior OF TB_Rfd IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux_Rfd
    PORT(
         RD : IN  std_logic_vector(5 downto 0);
         O7 : IN  std_logic_vector(5 downto 0);
         rfdsc : IN  std_logic;
         nRD : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RD : std_logic_vector(5 downto 0) := (others => '0');
   signal O7 : std_logic_vector(5 downto 0) := (others => '0');
   signal rfdsc : std_logic := '0';

 	--Outputs
   signal nRD : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux_Rfd PORT MAP (
          RD => RD,
          O7 => O7,
          rfdsc => rfdsc,
          nRD => nRD
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		RD <= "000000";
		O7 <="000000";
		rfdsc<= '1';
		wait for 20 ns;	
		RD <= "000010";
		O7 <="000001";
		rfdsc <='1';
		wait for 20 ns;
		RD <= "000001";
		O7 <="000011";
		rfdsc <='1';
		wait for 20 ns;	
		RD <= "000010";
		O7 <="000100";
		rfdsc <='0';
		wait for 20 ns;	
		RD <= "000110";
		O7 <="000101";
		rfdsc <='0';
		
   

      -- insert stimulus here 

      wait;
   end process;

END;
