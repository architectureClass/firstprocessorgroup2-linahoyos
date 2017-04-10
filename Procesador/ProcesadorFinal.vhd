
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ProcesadorFinal is
    Port ( Clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           SalidaA : out  STD_LOGIC_VECTOR (31 downto 0));
end ProcesadorFinal;

architecture Behavioral of ProcesadorFinal is
COMPONENT Suma
	PORT(
		Op1 : IN std_logic_vector(31 downto 0);
		Op2 : IN std_logic_vector(31 downto 0);          
		Result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT pc
	PORT(
		Data : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;
		clk : IN std_logic;          
		DataS : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT InstructionMemory
	PORT(
		rst : IN std_logic;
		Direccion : IN std_logic_vector(31 downto 0);          
		Salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
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
COMPONENT SEU
	PORT(
		Imm13 : IN std_logic_vector(12 downto 0);          
		Salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT UnidadControl
	PORT(
		op3 : IN std_logic_vector(5 downto 0);
		op : IN std_logic_vector(1 downto 0);          
		salida : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
COMPONENT MUX
	PORT(
		i : IN std_logic;
		imm32 : IN std_logic_vector(31 downto 0);
		Crs2 : IN std_logic_vector(31 downto 0);          
		Salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT alu
	PORT(
		suma1 : IN std_logic_vector(31 downto 0);
		suma2 : IN std_logic_vector(31 downto 0);
		alu_op : IN std_logic_vector(5 downto 0);          
		salida_alu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;


signal Ssum_npc,Snpc_pc,Spc_IM,SIM_RF,Sseu_Mux,SRf_Mux,SMux_Alu,SRF_Alu,Alu_RF,SIM_Seu,SIM_UC: std_logic_vector (31 downto 0) := X"00000000";
signal salidaUC_Alu: std_logic_vector (5 downto 0) := "000000";
begin
Inst_Suma: Suma PORT MAP(
		Op1 => "00000000000000000000000000000001",
		Op2 =>Snpc_pc ,
		Result =>Ssum_npc 
	);
Inst_npc: pc PORT MAP(
		Data =>Ssum_npc ,
		rst =>rst ,
		clk =>Clk ,
		DataS =>Snpc_pc 
	);
Inst_pc: pc PORT MAP(
		Data =>Snpc_pc ,
		rst =>rst ,
		clk =>Clk ,
		DataS =>Spc_IM 
	);
Inst_InstructionMemory: InstructionMemory PORT MAP(
		rst =>rst ,
		Direccion => Spc_IM,
		Salida => SIM_RF
	);
Inst_RegisterFile: RegisterFile PORT MAP(
		rs1 =>SIM_RF(18 downto 14) ,
		rs2 =>SIM_RF(4 downto 0) ,
		rd =>SIM_RF(29 downto 25) ,
		rst => rst,
		DWR =>Alu_RF ,
		CRs1 =>SRF_Alu ,
		CRs2 =>SRf_Mux 
	);
Inst_SEU: SEU PORT MAP(
		Imm13 =>SIM_RF(12 downto 0) ,
		Salida =>Sseu_Mux
	);
Inst_UnidadControl: UnidadControl PORT MAP(
		op3 =>SIM_RF(24 downto 19) ,
		op =>SIM_RF(31 downto 30) ,
		salida => salidaUC_Alu
	);

Inst_MUX: MUX PORT MAP(
		i =>SIM_RF(13),
		imm32 =>Sseu_Mux ,
		Crs2 =>SRf_Mux  ,
		Salida => SMux_Alu
	);
Inst_alu: alu PORT MAP(
		suma1 =>SRF_Alu ,
		suma2 =>SMux_Alu ,
		alu_op =>salidaUC_Alu ,
		salida_alu => Alu_RF
	);
SalidaA <= Alu_RF;

end Behavioral;

