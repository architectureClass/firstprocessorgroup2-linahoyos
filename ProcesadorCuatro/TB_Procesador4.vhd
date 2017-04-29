
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Procesador4 IS
END TB_Procesador4;
 
ARCHITECTURE behavior OF TB_Procesador4 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Procesador4
    PORT(
         clk : IN  std_logic;
         Reset : IN  std_logic;
         AluResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal AluResult : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Procesador4 PORT MAP (
          clk => clk,
          Reset => Reset,
          AluResult => AluResult
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
      -- hold reset state for 100 ns.

      reset<='1';
      wait for 100 ns;	
		reset<='0';

      -- insert stimulus here 

      wait;
   end process;

END;
