LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY WindowsManager_TB IS
END WindowsManager_TB;
 
ARCHITECTURE behavior OF WindowsManager_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WindowsManager
    PORT(
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         cwp : IN  std_logic;
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         ncwp : OUT  std_logic;
         nrs1 : OUT  std_logic_vector(5 downto 0);
         nrs2 : OUT  std_logic_vector(5 downto 0);
         nrd : OUT  std_logic_vector(5 downto 0);
         ro7 : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal cwp : std_logic := '0';
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal ncwp : std_logic;
   signal nrs1 : std_logic_vector(5 downto 0);
   signal nrs2 : std_logic_vector(5 downto 0);
   signal nrd : std_logic_vector(5 downto 0);
   signal ro7 : std_logic_vector(5 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WindowsManager PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          cwp => cwp,
          op => op,
          op3 => op3,
          ncwp => ncwp,
          nrs1 => nrs1,
          nrs2 => nrs2,
          nrd => nrd,
          ro7 => ro7
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		op <= "10";
		op3 <= "111100";
		rs1 <= "00011";
		rs2 <= "00100";
		rd <= "10010";
		cwp <= '1';
      wait for 100 ns;	
		
		op3 <= "111101";
		rs1 <= "00011";
		rs2 <= "00100";
		rd <= "10010";
		cwp <= '0';
      wait for 100 ns;
		
		op3 <= "111100";
		rs1 <= "01011";
		rs2 <= "01100";
		rd <= "10010";
		cwp <= '0';
      wait for 100 ns;
		
		op3 <= "111101";
		rs1 <= "00111";
		rs2 <= "01100";
		rd <= "10010";
		cwp <= '1';
      wait for 100 ns;	

      wait;
   end process;

END;
