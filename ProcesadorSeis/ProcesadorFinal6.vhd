
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ProcesadorFinal6 is
    Port ( Clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end ProcesadorFinal6;

architecture Behavioral of ProcesadorFinal6 is
COMPONENT Suma
	PORT(
		Op1 : IN std_logic_vector(31 downto 0);
		Op2 : IN std_logic_vector(31 downto 0);          
		Result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT Pc
	PORT(
		Data : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;
		CLK : IN std_logic;          
		DataOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT InstructionMemory
	PORT(
		rst : IN std_logic;
		Direccion : IN std_logic_vector(31 downto 0);          
		Salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT WindowsManager
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
COMPONENT RegisterFile
	PORT(
		nrs1 : IN std_logic_vector(5 downto 0);
		nrs2 : IN std_logic_vector(5 downto 0);
		nrd : IN std_logic_vector(5 downto 0);
		rst : IN std_logic;
		DWR : IN std_logic_vector(31 downto 0);
		WE : IN std_logic;          
		CRs1 : OUT std_logic_vector(31 downto 0);
		CRs2 : OUT std_logic_vector(31 downto 0);
		cRd : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT Mux_RF
	PORT(
		Rd : IN std_logic_vector(5 downto 0);
		O7 : IN std_logic_vector(5 downto 0);
		RFDEST : IN std_logic;          
		nRD : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
COMPONENT UnidadControl
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		icc : IN std_logic_vector(3 downto 0);
		Cond : IN std_logic_vector(3 downto 0);          
		AluOp : OUT std_logic_vector(5 downto 0);
		RFDEST : OUT std_logic;
		RFSC : OUT std_logic_vector(1 downto 0);
		WRENMEM : OUT std_logic;
		wre : OUT std_logic;
		PCSC : OUT std_logic_vector(1 downto 0)
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
COMPONENT SEU
	PORT(
		Imm13 : IN std_logic_vector(12 downto 0);          
		Salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT Alu
	PORT(
		CRs1 : IN std_logic_vector(31 downto 0);
		CRs2 : IN std_logic_vector(31 downto 0);
		C : IN std_logic;
		ALUOp : IN std_logic_vector(5 downto 0);          
		AluResult : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT PsrModifier
	PORT(
		crS1 : IN std_logic_vector(31 downto 0);
		crS2 : IN std_logic_vector(31 downto 0);
		AluResult : IN std_logic_vector(31 downto 0);
		AluOp : IN std_logic_vector(5 downto 0);          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
COMPONENT PSR
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		nzvc : IN std_logic_vector(3 downto 0);
		ncwp : IN std_logic_vector(4 downto 0);          
		cwp : OUT std_logic_vector(4 downto 0);
		c : OUT std_logic;
		icc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
COMPONENT DataMemory
	PORT(
		cRD : IN std_logic_vector(31 downto 0);
		AluResult : IN std_logic_vector(31 downto 0);
		WRENMEM : IN std_logic;
		Reset : IN std_logic;          
		DataMem : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT Mux_npc
	PORT(
		CALL : IN std_logic_vector(31 downto 0);
		BRANCH : IN std_logic_vector(31 downto 0);
		nPC : IN std_logic_vector(31 downto 0);
		JUMP : IN std_logic_vector(31 downto 0);
		PCSC : IN std_logic_vector(1 downto 0);          
		nPCOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT SEU_22
	PORT(
		Imm_22 : IN std_logic_vector(21 downto 0);          
		Imm_32 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT SEU_30
	PORT(
		Imm_30 : IN std_logic_vector(29 downto 0);          
		Imm_32 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT Mux_DM
	PORT(
		DataMem : IN std_logic_vector(31 downto 0);
		AluResult : IN std_logic_vector(31 downto 0);
		PC : IN std_logic_vector(31 downto 0);
		RFSC : IN std_logic_vector(1 downto 0);          
		DWR : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
signal npc_pc,pc_IM,Salida_IM,sumnpc_muxnpc,S_CRs1,S_CRs2,Mux_Alu,Seu_Mux,S_seu22,S_seu30,S_sumseu22,S_sumseu30,muxnpc_npc,S_AluResult,S_crd,S_MuxDataM,S_DM: std_logic_vector (31 downto 0) := x"00000000";
signal  nzvc_out,icc_Out  : std_logic_vector (3 downto 0);
signal  cwp_out,ncwp_Out  : std_logic_vector (4 downto 0);
signal PCSC_out, RFsc_out : STD_LOGIC_VECTOR (1 downto 0) := "00";
signal WE_Out, WRENMEM_Out, RfDest_Out,carry_out : STD_LOGIC := '0';
signal AluOp_Out,nRs1_Aux,nRs2_Aux,nRd_Aux,nRDMux_out: STD_LOGIC_VECTOR (5 downto 0) := "000000";
begin
Inst_Suma: Suma PORT MAP(
		Op1 => x"00000001" ,
		Op2 => npc_pc ,
		Result => sumnpc_muxnpc
	);
Inst_Sumaseu22: Suma PORT MAP(
		Op1 => pc_IM ,
		Op2 =>  S_seu22,
		Result => S_sumseu22
	);
Inst_Sumaseu30: Suma PORT MAP(
		Op1 =>  S_seu30,
		Op2 => pc_IM ,
		Result => S_sumseu30
	);
Inst_nPc: Pc PORT MAP(
		Data => muxnpc_npc,
		rst => rst,
		CLK => Clk,
		DataOut => npc_pc 
	);
Inst_Pc: Pc PORT MAP(
		Data => npc_pc,
		rst => rst,
		CLK => Clk,
		DataOut => pc_IM
	);
Inst_InstructionMemory: InstructionMemory PORT MAP(
		rst => rst,
		Direccion => pc_IM ,
		Salida => Salida_IM
	);
Inst_WindowsManager: WindowsManager PORT MAP(
		rs1 => Salida_IM(18 downto 14),
		rs2 => Salida_IM(4 downto 0),
		rd => Salida_IM(29 downto 25),
		op => Salida_IM(31 downto 30),
		op3 => Salida_IM(24 downto 19),
		cwp => cwp_out ,
		nRs1 => nRs1_Aux,
		nRs2 => nRs2_Aux ,
		nRd => nRd_Aux,
		nCwp => ncwp_Out
	);
Inst_RegisterFile: RegisterFile PORT MAP(
		nrs1 => nRs1_Aux,
		nrs2 => nRs2_Aux,
		nrd => nRDMux_out,
		rst => rst ,
		DWR => S_MuxDataM,
		WE => WE_Out,
		CRs1 => S_CRs1,
		CRs2 => S_CRs2,
		cRd => S_crd
	);
Inst_Mux_RF: Mux_RF PORT MAP(
		Rd => nRd_Aux,
		O7 => "001111",
		RFDEST =>RfDest_Out ,
		nRD => nRDMux_out
	);
Inst_UnidadControl: UnidadControl PORT MAP(
		op => Salida_IM(31 downto 30),
		op3 => Salida_IM(24 downto 19),
		icc => icc_Out,
		Cond => Salida_IM(28 downto 25),
		AluOp => AluOp_Out,
		RFDEST =>  RfDest_Out,
		RFSC =>  RFsc_out,
		WRENMEM => WRENMEM_Out,
		wre => WE_Out,
		PCSC => PCSC_out
	);
Inst_MUX: MUX PORT MAP(
		i => Salida_IM(13),
		imm32 => Seu_Mux,
		Crs2 => S_CRs2,
		Salida => Mux_Alu
	);
Inst_SEU: SEU PORT MAP(
		Imm13 => Salida_IM(12 downto 0),
		Salida => Seu_Mux 
	);
Inst_Alu: Alu PORT MAP(
		CRs1 => S_CRs1,
		CRs2 => Mux_Alu,
		C => carry_out,
		ALUOp => AluOp_Out,
		AluResult => S_AluResult
	);
Inst_PsrModifier: PsrModifier PORT MAP(
		crS1 => S_CRs1,
		crS2 => Mux_Alu,
		AluResult => S_AluResult,
		AluOp => AluOp_Out ,
		nzvc => nzvc_out
	);
Inst_PSR: PSR PORT MAP(
		clk => Clk,
		rst => rst,
		nzvc => nzvc_out ,
		ncwp => ncwp_Out,
		cwp => cwp_out ,
		c => carry_out,
		icc => icc_Out
	);

Inst_DataMemory: DataMemory PORT MAP(
		cRD => S_crd,
		AluResult => S_AluResult ,
		WRENMEM => WRENMEM_Out,
		Reset => rst,
		DataMem => S_DM
	);

Inst_Mux_npc: Mux_npc PORT MAP(
		CALL => S_sumseu30,
		BRANCH => S_sumseu22,
		nPC => sumnpc_muxnpc,
		JUMP => S_AluResult,
		PCSC => PCSC_out,
		nPCOut => muxnpc_npc
	);
Inst_SEU_22: SEU_22 PORT MAP(
		Imm_22 => Salida_IM(21 downto 0),
		Imm_32 => S_seu22
	);
Inst_SEU_30: SEU_30 PORT MAP(
		Imm_30 => Salida_IM(29 downto 0),
		Imm_32 => S_seu30
	);
Inst_Mux_DM: Mux_DM PORT MAP(
		DataMem => S_DM ,
		AluResult => S_AluResult ,
		PC => pc_IM,
		RFSC =>  RFsc_out,
		DWR => S_MuxDataM
	);
AluResult <= S_MuxDataM;
end Behavioral;

