
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Alu IS
END TB_Alu;
 
ARCHITECTURE behavior OF TB_Alu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu
    PORT(
         suma1 : IN  std_logic_vector(31 downto 0);
         suma2 : IN  std_logic_vector(31 downto 0);
         alu_op : IN  std_logic_vector(5 downto 0);
         salida_alu : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal suma1 : std_logic_vector(31 downto 0) := (others => '0');
   signal suma2 : std_logic_vector(31 downto 0) := (others => '0');
   signal alu_op : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal salida_alu : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu PORT MAP (
          suma1 => suma1,
          suma2 => suma2,
          alu_op => alu_op,
          salida_alu => salida_alu
        );


  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
      suma1 <= x"0000000F";
		suma2 <= x"0000008F";
	   alu_op <= "000000";--AND
		wait for 20 ns;
		
		
		
		suma1 <= x"0000000F";
		suma2 <= x"000000AF";
		alu_op <= "000001";--OR
		wait for 20 ns;
		
		suma1 <= x"00000009";
		suma2 <= x"00000005";
		alu_op <= "000001";--ADD
		wait for 20 ns;
		
		suma1 <= x"00000009";
		suma2 <= x"00000005";
		alu_op <= "001000";--SUB
		wait for 20 ns;
		
		suma1 <= x"00000005";
		suma2 <= x"00000009";
		alu_op <= "001000";--SUB
		wait for 20 ns;

      

      -- insert stimulus here 

      wait;
   end process;

END;
