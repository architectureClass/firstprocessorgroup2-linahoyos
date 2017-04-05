
-- VHDL Instantiation Created from source file InstructionMemory.vhd -- 17:32:33 04/05/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT InstructionMemory
	PORT(
		rst : IN std_logic;
		Direccion : IN std_logic_vector(31 downto 0);          
		Salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_InstructionMemory: InstructionMemory PORT MAP(
		rst => ,
		Direccion => ,
		Salida => 
	);


