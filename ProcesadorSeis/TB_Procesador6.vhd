
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Procesador6 IS
END TB_Procesador6;
 
ARCHITECTURE behavior OF TB_Procesador6 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProcesadorFinal6
    PORT(
         Clk : IN  std_logic;
         rst : IN  std_logic;
         AluResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal AluResult : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProcesadorFinal6 PORT MAP (
          Clk => Clk,
          rst => rst,
          AluResult => AluResult
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
     	rst <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;
	   rst <= '0';		
      wait;
   end process;

END;
