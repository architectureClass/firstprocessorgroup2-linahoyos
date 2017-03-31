
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_RegisterFile IS
END TB_RegisterFile;
 
ARCHITECTURE behavior OF TB_RegisterFile IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegisterFile
    PORT(
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         rst : IN  std_logic;
         DWR : IN  std_logic_vector(31 downto 0);
         CRs1 : OUT  std_logic_vector(31 downto 0);
         CRs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal DWR : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal CRs1 : std_logic_vector(31 downto 0);
   signal CRs2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
	constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          rst => rst,
          DWR => DWR,
          CRs1 => CRs1,
          CRs2 => CRs2
        );


   -- Stimulus process
   stim_proc: process
   begin		
      rs1 <= "00001";
		rs2 <= "00010";
		rd <= "00000";
		DWR <= "00000000000000000000000000000100";
		wait for 20 ns;

		rs1 <= "00000";
		rs2 <= "00010";
		rd <= "00001";
		DWR <= "00000000000000000000000000000100";
      wait for 20 ns;	

		rs1 <= "00001";
		rs2 <= "00010";
		rd <= "00101";
		DWR <= "00000000000000000000000000000100";

      wait;
   end process;

END;
