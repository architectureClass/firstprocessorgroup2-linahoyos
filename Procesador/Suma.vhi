
-- VHDL Instantiation Created from source file Suma.vhd -- 17:18:53 04/05/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Suma
	PORT(
		Op1 : IN std_logic_vector(31 downto 0);
		Op2 : IN std_logic_vector(31 downto 0);          
		Result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_Suma: Suma PORT MAP(
		Op1 => ,
		Op2 => ,
		Result => 
	);


