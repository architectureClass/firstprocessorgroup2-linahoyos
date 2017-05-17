
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_SEU_30 IS
END TB_SEU_30;
 
ARCHITECTURE behavior OF TB_SEU_30 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU_30
    PORT(
         Imm_30 : IN  std_logic_vector(29 downto 0);
         Imm_32 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Imm_30 : std_logic_vector(29 downto 0) := (others => '0');

 	--Outputs
   signal Imm_32 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU_30 PORT MAP (
          Imm_30 => Imm_30,
          Imm_32 => Imm_32
        );   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		Imm_30 <="000101010000001001000001001101";
		wait for 20 ns;
		Imm_30 <="111111111100100000100101010100";

  

      -- insert stimulus here 

      wait;
   end process;

END;
