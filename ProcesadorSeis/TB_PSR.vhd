
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_PSR IS
END TB_PSR;
 
ARCHITECTURE behavior OF TB_PSR IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR
    PORT(
         nCwp : IN  std_logic_vector(4 downto 0);
         NZVC : IN  std_logic_vector(3 downto 0);
         rts : IN  std_logic;
         clk : IN  std_logic;
         cwp : OUT  std_logic_vector(4 downto 0);
         C : OUT  std_logic;
         icc : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal nCwp : std_logic_vector(4 downto 0) := (others => '0');
   signal NZVC : std_logic_vector(3 downto 0) := (others => '0');
   signal rts : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal cwp : std_logic_vector(4 downto 0);
   signal C : std_logic;
   signal icc : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          nCwp => nCwp,
          NZVC => NZVC,
          rts => rts,
          clk => clk,
          cwp => cwp,
          C => C,
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
      -- hold reset state for 100 ns.
		rts <= '1';
      wait for 100 ns;	
		rts <= '0';
		nCwp <="00001";
		NZVC <="0010";
		wait for 5 ns;
		nCwp <="00100";
		NZVC <="1000";
		wait for 5 ns;
		nCwp <="01000";
		NZVC <="0001";
		wait for 7 ns;
		nCwp <="00001";
		NZVC <="0100";
		wait for 5 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
