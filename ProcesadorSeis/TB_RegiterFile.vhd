
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_RegiterFile IS
END TB_RegiterFile;
 
ARCHITECTURE behavior OF TB_RegiterFile IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegisterFile
    PORT(
         nrs1 : IN  std_logic_vector(5 downto 0);
         nrs2 : IN  std_logic_vector(5 downto 0);
         nrd : IN  std_logic_vector(5 downto 0);
         rst : IN  std_logic;
         DWR : IN  std_logic_vector(31 downto 0);
         WE : IN  std_logic;
         CRs1 : OUT  std_logic_vector(31 downto 0);
         CRs2 : OUT  std_logic_vector(31 downto 0);
         cRd : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal nrs1 : std_logic_vector(5 downto 0) := (others => '0');
   signal nrs2 : std_logic_vector(5 downto 0) := (others => '0');
   signal nrd : std_logic_vector(5 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal DWR : std_logic_vector(31 downto 0) := (others => '0');
   signal WE : std_logic := '0';

 	--Outputs
   signal CRs1 : std_logic_vector(31 downto 0);
   signal CRs2 : std_logic_vector(31 downto 0);
   signal cRd : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile PORT MAP (
          nrs1 => nrs1,
          nrs2 => nrs2,
          nrd => nrd,
          rst => rst,
          DWR => DWR,
          WE => WE,
          CRs1 => CRs1,
          CRs2 => CRs2,
          cRd => cRd
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
     wait for 100 ns;
	   rst <='1';
	   nrs1<="010000";
		nrs2<="010000";
		nrd <="010001";
		DWR <= x"0000000A";
		WE <= '1';
		wait for 20 ns;
	   rst <='0';
		
	   nrs1<="001000";
		nrs2<="100001";
		nrd <="010000";
		DWR <= x"0000000A";
		WE <= '1';
		
		wait for 20 ns;
	   nrs1<="010000";
		nrs2<="100101";
		nrd <="010100";
		DWR <= x"0000000C";
		WE <= '1';
		
		wait for 20 ns;
	   nrs1<="010100";
		nrs2<="010000";
		nrd <="010010";
		DWR <= x"0000000B";
		WE <= '0';
		
		wait for 20 ns;
	   nrs1<="111000";
		nrs2<="000101";
		nrd <="010011";
		DWR <= x"0000000F";
		WE <= '0'; 

      wait;
   end process;

END;
