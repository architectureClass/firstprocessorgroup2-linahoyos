
-- VHDL Instantiation Created from source file pc.vhd -- 17:25:20 04/05/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT pc
	PORT(
		Data : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;
		clk : IN std_logic;          
		DataS : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_pc: pc PORT MAP(
		Data => ,
		rst => ,
		clk => ,
		DataS => 
	);


