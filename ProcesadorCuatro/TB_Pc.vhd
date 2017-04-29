
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Pc IS
END TB_Pc;
 
ARCHITECTURE behavior OF TB_Pc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pc
    PORT(
         Data : IN  std_logic_vector(0 to 31);
         rst : IN  std_logic;
         clk : IN  std_logic;
         DataS : OUT  std_logic_vector(0 to 31)
        );
    END COMPONENT;
    

   --Inputs
   signal Data : std_logic_vector(0 to 31) := (others => '0');
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal DataS : std_logic_vector(0 to 31);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pc PORT MAP (
          Data => Data,
          rst => rst,
          clk => clk,
          DataS => DataS
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
	
      begin	
		rst<='1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		rst<='0';
		Data <="00000000000000000000000000000010";

      wait for 100 ns;	
		rst<='0';
		Data <="00000000000000000000000000000100";
		wait for 100 ns;	
		rst<='0';
		Data <="00000000000000000000000000000101";
      -- insert stimulus here 
 

      wait;
   end process;

END;
