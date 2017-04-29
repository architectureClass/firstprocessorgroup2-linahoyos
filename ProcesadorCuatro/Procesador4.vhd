
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Procesador4 is
    Port ( clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador4;

architecture Behavioral of Procesador4 is
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
COMPONENT windowsManager
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		cwp : IN std_logic_vector(4 downto 0);          
		nRs1 : OUT std_logic_vector(5 downto 0);
		nRs2 : OUT std_logic_vector(5 downto 0);
		nRd : OUT std_logic_vector(5 downto 0);
		nCwp : OUT std_logic_vector(4 downto 0)
		);
	END COMPONENT;
COMPONENT SEU
	PORT(
		Imm13 : IN std_logic_vector(12 downto 0);          
		Salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT RegisterFile
	PORT(
		nrs1 : IN std_logic_vector(5 downto 0);
		nrs2 : IN std_logic_vector(5 downto 0);
		nrd : IN std_logic_vector(5 downto 0);
		rst : IN std_logic;
		DWR : IN std_logic_vector(31 downto 0);          
		CRs1 : OUT std_logic_vector(31 downto 0);
		CRs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT PSR
	PORT(
		nCwp : IN std_logic_vector(4 downto 0);
		NZVC : IN std_logic_vector(3 downto 0);
		rts : IN std_logic;
		clk : IN std_logic;          
		cwp : OUT std_logic_vector(4 downto 0);
		C : OUT std_logic
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
COMPONENT PsrModifier
	PORT(
		Crs1 : IN std_logic_vector(31 downto 0);
		Crs2 : IN std_logic_vector(31 downto 0);
		AluResult : IN std_logic_vector(31 downto 0);
		Aluop : IN std_logic_vector(5 downto 0);          
		NZVC : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
COMPONENT alu
	PORT(
		suma1 : IN std_logic_vector(31 downto 0);
		suma2 : IN std_logic_vector(31 downto 0);
		carry : IN std_logic;
		alu_op : IN std_logic_vector(5 downto 0);          
		salida_alu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
signal sum_npc,npc_pc,pc_im,Sim, rf_alu, rf_mux ,mux_alu, seu_mux,aluResult_Aux: std_logic_vector (31 downto 0) := x"00000000";
signal wm_psr, psr_wm : std_logic_vector (4 downto 0) := "00000";
signal Saluop_alu_psrM, nRs1_Aux,nRs2_Aux,nRd_Aux : std_logic_vector (5 downto 0) := "000000";
signal  psrM_psr : std_logic_vector (3 downto 0);
signal psr_alu : std_logic := '0';
begin
	Inst_Suma: Suma PORT MAP(
		Op1 => "00000000000000000000000000000001",
		Op2 => npc_pc ,
		Result => sum_npc
	);
	Inst_pc: pc PORT MAP(
		Data => npc_pc ,
		rst => Reset,
		clk => clk,
		DataS => pc_im 
	);
	Inst_npc: pc PORT MAP(
		Data => sum_npc,
		rst => Reset ,
		clk => clk ,
		DataS => npc_pc
	);
	Inst_InstructionMemory: InstructionMemory PORT MAP(
		rst => Reset,
		Direccion => pc_im ,
		Salida => Sim
	);
	Inst_SEU: SEU PORT MAP(
		Imm13 => Sim(12 downto 0) ,
		Salida => seu_mux
	);
	Inst_UnidadControl: UnidadControl PORT MAP(
		op3 => Sim(24 downto 19) ,
		op => Sim(31 downto 30),
		salida => Saluop_alu_psrM
	);
	Inst_RegisterFile: RegisterFile PORT MAP(
		nrs1 => nRs1_Aux ,
		nrs2 => nRs2_Aux ,
		nrd => nRd_Aux,
		rst => Reset ,
		DWR => aluResult_Aux,
		CRs1 => rf_alu,
		CRs2 => rf_mux
	);
	Inst_PSR: PSR PORT MAP(
		nCwp => wm_psr ,
		NZVC => psrM_psr,
		rts => Reset,
		clk => clk ,
		cwp => psr_wm,
		C => psr_alu
	);
	Inst_PsrModifier: PsrModifier PORT MAP(
		Crs1 => rf_alu,
		Crs2 => mux_alu,
		AluResult => aluResult_Aux,
		Aluop => Saluop_alu_psrM,
		NZVC => psrM_psr
	);
	Inst_MUX: MUX PORT MAP(
		i => Sim(13) ,
		imm32 => seu_mux,
		Crs2 => rf_mux,
		Salida => mux_alu
	);
	Inst_windowsManager: windowsManager PORT MAP(
		rs1 => Sim (18 downto 14),
		rs2 => Sim (4 downto 0) ,
		rd =>  Sim (29 downto 25),
		op => Sim(31 downto 30) ,
		op3 => Sim (24 downto 19),
		cwp => psr_wm ,
		nRs1 => nRs1_Aux,
		nRs2 => nRs2_Aux,
		nRd => nRd_Aux,
		nCwp => wm_psr 
	);
	Inst_alu: alu PORT MAP(
		suma1 => rf_alu,
		suma2 => mux_alu,
		carry => psr_alu  ,
		alu_op => Saluop_alu_psrM,
		salida_alu => aluResult_Aux
	);

 AluResult <= aluResult_Aux;

end Behavioral;

