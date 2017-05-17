
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_PSRModifier IS
END TB_PSRModifier;
 
ARCHITECTURE behavior OF TB_PSRModifier IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PsrModifier
    PORT(
         Crs1 : IN  std_logic_vector(31 downto 0);
         Crs2 : IN  std_logic_vector(31 downto 0);
         AluResult : IN  std_logic_vector(31 downto 0);
         Aluop : IN  std_logic_vector(5 downto 0);
         NZVC : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Crs1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Crs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal AluResult : std_logic_vector(31 downto 0) := (others => '0');
   signal Aluop : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal NZVC : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PsrModifier PORT MAP (
          Crs1 => Crs1,
          Crs2 => Crs2,
          AluResult => AluResult,
          Aluop => Aluop,
          NZVC => NZVC
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		CrS1 <= x"F0000000";
		CrS2 <= x"F0000000";
		AluResult <= x"F0000000";
		AluOp <= "000000";
		
		wait for 20 ns;
		CrS1 <= x"F0000003";
		CrS2 <= x"F0000009";
		AluResult <= x"00000003";
		AluOp <= "001001";--SUBcc
		
		wait for 20 ns;
		CrS1 <= x"A0000002";
		CrS2 <= x"0000000F";
		AluResult <= x"00000020";
		AluOp <= "001001";--SUBcc
		wait for 20 ns;
		
		wait for 20 ns;
		CrS1 <= x"0000000B";
		crS2 <= x"F0000003";
		AluResult <= x"00000020";
		AluOp <= "001001";--SUBcc
		wait for 20 ns;
		
		wait for 20 ns;
		CrS1 <= x"A000002A";
		crS2 <= x"B000003B";
		AluResult <= x"A0000022";
		AluOp <= "001001";--SUBcc
		wait for 20 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
