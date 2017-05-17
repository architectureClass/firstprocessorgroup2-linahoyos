
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_DataMemory IS
END TB_DataMemory;
 
ARCHITECTURE behavior OF TB_DataMemory IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataMemory
    PORT(
         CRD : IN  std_logic_vector(31 downto 0);
         AluResult : IN  std_logic_vector(31 downto 0);
         WE : IN  std_logic;
         rst : IN  std_logic;
         DataResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CRD : std_logic_vector(31 downto 0) := (others => '0');
   signal AluResult : std_logic_vector(31 downto 0) := (others => '0');
   signal WE : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal DataResult : std_logic_vector(31 downto 0);
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataMemory PORT MAP (
          CRD => CRD,
          AluResult => AluResult,
          WE => WE,
          rst => rst,
          DataResult => DataResult
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		CRD <= x"00000000";
		AluResult <= x"00000000";
		WE <= '0';
		rst <= '1';
      wait for 100 ns;
		rst <='0';
		
		CRD <= x"00000001";
		AluResult <= x"00000001";
		WE <= '1';
      wait for 20 ns;
		CRD <= x"0000000C";
		AluResult <= x"00000010";
		WE <= '1';
		wait for 20 ns;
		CRD <= x"0000000D";
		AluResult <= x"00000001";
		WE <= '0';
      wait for 20 ns;
		CRD <= x"0000000A";
		AluResult <= x"00000010";
		WE <= '0';
		wait for 20 ns;
		CRD <= x"0000000E";
		AluResult <= x"00000001";
		WE <= '0';
      wait for 20 ns;
		CRD <= x"0000000F";
		AluResult <= x"00000010";
		WE <= '0';
      -- insert stimulus here 
 
      wait;
   end process;

END;
