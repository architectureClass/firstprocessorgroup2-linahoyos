
-- VHDL Instantiation Created from source file UnidadControl.vhd -- 17:47:22 04/05/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT UnidadControl
	PORT(
		op3 : IN std_logic_vector(5 downto 0);
		op : IN std_logic_vector(1 downto 0);          
		salida : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	Inst_UnidadControl: UnidadControl PORT MAP(
		op3 => ,
		op => ,
		salida => 
	);


