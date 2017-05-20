LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
 
ENTITY UnidadControl_TB IS
END UnidadControl_TB;
 
ARCHITECTURE behavior OF UnidadControl_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UnidadControl
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         op2 : IN  std_logic_vector(2 downto 0);
         cond : IN  std_logic_vector(3 downto 0);
         icc : IN  std_logic_vector(3 downto 0);
         HabilitadorMemoria : OUT  std_logic;
         Rfdest : OUT  std_logic;
         Rfsource : OUT  std_logic_vector(1 downto 0);
         Pcsource : OUT  std_logic_vector(1 downto 0);
         EscrituraMem : OUT  std_logic;
         EscrituraRF : OUT  std_logic;
         Aluop : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal op2 : std_logic_vector(2 downto 0) := (others => '0');
   signal cond : std_logic_vector(3 downto 0) := (others => '0');
   signal icc : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal HabilitadorMemoria : std_logic;
   signal Rfdest : std_logic;
   signal Rfsource : std_logic_vector(1 downto 0);
   signal Pcsource : std_logic_vector(1 downto 0);
   signal EscrituraMem : std_logic;
   signal EscrituraRF : std_logic;
   signal Aluop : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UnidadControl PORT MAP (
          op => op,
          op3 => op3,
          op2 => op2,
          cond => cond,
          icc => icc,
          HabilitadorMemoria => HabilitadorMemoria,
          Rfdest => Rfdest,
          Rfsource => Rfsource,
          Pcsource => Pcsource,
          EscrituraMem => EscrituraMem,
          EscrituraRF => EscrituraRF,
          Aluop => Aluop
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      op <= "10";
		op2 <= "000";
		op3 <= "000000" ;
		cond <= "0000";
		icc <= "0000";		
      wait for 100 ns;
		op <= "10";
		op2 <= "000";
		op3 <= "010000" ;
		cond <= "0000";
		icc <= "0000";		
      wait for 100 ns;
		op <= "00";
		op2 <= "010";
		op3 <= "000000" ;
		cond <= "1000";
		icc <= "0000";		
      wait;
   end process;

END;
