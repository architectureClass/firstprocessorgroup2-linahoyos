
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_UnidadControl IS
END TB_UnidadControl;
 
ARCHITECTURE behavior OF TB_UnidadControl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UnidadControl
    PORT(
         op3 : IN  std_logic_vector(5 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         icc : IN  std_logic_vector(3 downto 0);
         cond : IN  std_logic_vector(3 downto 0);
         salida : OUT  std_logic_vector(5 downto 0);
         R_WE : OUT  std_logic;
         D_WE : OUT  std_logic;
         rfdsc : OUT  std_logic;
         pcsc : OUT  std_logic_vector(1 downto 0);
         rfWsc : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal icc : std_logic_vector(3 downto 0) := (others => '0');
   signal cond : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(5 downto 0);
   signal R_WE : std_logic;
   signal D_WE : std_logic;
   signal rfdsc : std_logic;
   signal pcsc : std_logic_vector(1 downto 0);
   signal rfWsc : std_logic_vector(1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UnidadControl PORT MAP (
          op3 => op3,
          op => op,
          icc => icc,
          cond => cond,
          salida => salida,
          R_WE => R_WE,
          D_WE => D_WE,
          rfdsc => rfdsc,
          pcsc => pcsc,
          rfWsc => rfWsc
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
       wait for 100 ns;	
		op <= "10";
		op3 <="000000";
		
		wait for 20 ns;
		
		op <= "10";
		op3 <="000001";
		wait for 20 ns;
		
		op <= "10";
		op3 <="000010";
		
		wait for 20 ns;
		
		op <= "10";
		op3 <="000011";
		wait for 20 ns;
		
		op <= "00"; --BA
		op3 <="010101";
		icc <="1001";
      cond <="1000";
		wait for 20 ns;
		
		op <= "00";--BGE
		op3 <="010100";
		icc <="1000";
      cond <="1011";
		wait for 20 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
