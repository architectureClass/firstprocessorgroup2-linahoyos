
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY TB_PSR IS
END TB_PSR;
 
ARCHITECTURE behavior OF TB_PSR IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         nzvc : IN  std_logic_vector(3 downto 0);
         ncwp : IN  std_logic_vector(4 downto 0);
         cwp : OUT  std_logic_vector(4 downto 0);
         c : OUT  std_logic;
         icc : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal nzvc : std_logic_vector(3 downto 0) := (others => '0');
   signal ncwp : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal cwp : std_logic_vector(4 downto 0);
   signal c : std_logic;
   signal icc : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          clk => clk,
          rst => rst,
          nzvc => nzvc,
          ncwp => ncwp,
          cwp => cwp,
          c => c,
          icc => icc
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
     clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		rst <='1';
      wait for 100 ns;	
		rst <='0';
		
		nzvc <="0001";
		ncwp <="00001";
		
		wait for 11 ns;
		nzvc <="0110";
		ncwp <="00000";
		
		wait for 10 ns;
		nzvc <="1100";
		ncwp <="00000";

      wait;
   end process;

END;
