
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_ProcesadorFinal IS
END TB_ProcesadorFinal;
 
ARCHITECTURE behavior OF TB_ProcesadorFinal IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProcesadorFinal
    PORT(
         Clk : IN  std_logic;
         rst : IN  std_logic;
         SalidaA : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal SalidaA : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProcesadorFinal PORT MAP (
          Clk => Clk,
          rst => rst,
          SalidaA => SalidaA
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
      -- hold reset state for 100 ns.
		rst<='1';
      wait for 20 ns;	
		rst<='0';
      
      -- insert stimulus here 

      wait;
   end process;

END;
