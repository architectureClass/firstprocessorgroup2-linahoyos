
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Suma IS
END TB_Suma;
 
ARCHITECTURE behavior OF TB_Suma IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Suma
    PORT(
         Op1 : IN  std_logic_vector(31 downto 0);
         Op2 : IN  std_logic_vector(31 downto 0);
         Result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Op1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Op2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Result : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Suma PORT MAP (
          Op1 => Op1,
          Op2 => Op2,
          Result => Result
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	      -- insert stimulus here 
      Op1<="00000000000000000000000000000001";
		Op2<="00000000000000000000000000000101";
      wait for 20 ns;
      Op1<="00000000000000000000000000000011";
		Op2<="00000000000000000000000000000111";
      wait for 20 ns;	
      wait;
   end process;

END;
