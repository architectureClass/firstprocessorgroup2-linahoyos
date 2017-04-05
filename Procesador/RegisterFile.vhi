
-- VHDL Instantiation Created from source file RegisterFile.vhd -- 17:35:11 04/05/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT RegisterFile
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		rst : IN std_logic;
		DWR : IN std_logic_vector(31 downto 0);          
		CRs1 : OUT std_logic_vector(31 downto 0);
		CRs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_RegisterFile: RegisterFile PORT MAP(
		rs1 => ,
		rs2 => ,
		rd => ,
		rst => ,
		DWR => ,
		CRs1 => ,
		CRs2 => 
	);


