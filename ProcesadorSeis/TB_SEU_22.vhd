
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_SEU_22 IS
END TB_SEU_22;
 
ARCHITECTURE behavior OF TB_SEU_22 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU_22
    PORT(
         Imm_22 : IN  std_logic_vector(21 downto 0);
         Imm_32 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Imm_22 : std_logic_vector(21 downto 0) := (others => '0');

 	--Outputs
   signal Imm_32 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU_22 PORT MAP (
          Imm_22 => Imm_22,
          Imm_32 => Imm_32
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      Imm_22 <="0000000010101001010010";
		
		wait for 20 ns;	
      Imm_22 <="1111100010101001010010";
      

      -- insert stimulus here 

      wait;
   end process;

END;
