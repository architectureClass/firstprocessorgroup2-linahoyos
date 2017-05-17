
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Procesaro6 is
    Port ( Clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesaro6;

architecture Behavioral of Procesaro6 is
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
		nCwp : OUT std_logic_vector(4 downto 0);
		O7 : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
COMPONENT Mux_Rfd
	PORT(
		RD : IN std_logic_vector(5 downto 0);
		O7 : IN std_logic_vector(5 downto 0);
		rfdsc : IN std_logic;          
		nRD : OUT std_logic_vector(5 downto 0)
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
		icc : IN std_logic_vector(3 downto 0);
		cond : IN std_logic_vector(3 downto 0);          
		salida : OUT std_logic_vector(5 downto 0);
		R_WE : OUT std_logic;
		D_WE : OUT std_logic;
		rfdsc : OUT std_logic;
		pcsc : OUT std_logic_vector(1 downto 0);
		rfWsc : OUT std_logic_vector(1 downto 0)
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
COMPONENT PSR
	PORT(
		nCwp : IN std_logic_vector(4 downto 0);
		NZVC : IN std_logic_vector(3 downto 0);
		rts : IN std_logic;
		clk : IN std_logic;          
		cwp : OUT std_logic_vector(4 downto 0);
		C : OUT std_logic;
		icc : OUT std_logic_vector(3 downto 0)
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

COMPONENT Mux_npc
	PORT(
		Call : IN std_logic_vector(31 downto 0);
		Branch : IN std_logic_vector(31 downto 0);
		npc : IN std_logic_vector(31 downto 0);
		jump : IN std_logic_vector(31 downto 0);
		pcsc : IN std_logic_vector(1 downto 0);          
		Salida_npc : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT DataMemory
	PORT(
		CRD : IN std_logic_vector(31 downto 0);
		AluResult : IN std_logic_vector(31 downto 0);
		WE : IN std_logic;
		rst : IN std_logic;          
		DataResult : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT Mux_DWR
	PORT(
		DataM : IN std_logic_vector(31 downto 0);
		AluR : IN std_logic_vector(31 downto 0);
		Pc : IN std_logic_vector(31 downto 0);
		Rfwsc : IN std_logic_vector(1 downto 0);          
		DWR : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
signal npc_pc,pc_IM,Salida_IM,sumnpc_muxnpc,S_CRs1,S_CRs2,MUux_Alu,Seu_Mux,S_seu22,S_seu30,S_sumseu22,S_sumseu30,muxnpc_npc,S_AluResult,S_crd,S_MuxDataM,S_DM: std_logic_vector (31 downto 0) := x"00000000";
signal  nzvc_out,icc_Out  : std_logic_vector (3 downto 0);
signal  cwp_out,ncwp_Out  : std_logic_vector (4 downto 0);
signal PCSC_out, rfWsc : STD_LOGIC_VECTOR (1 downto 0) := "00";
signal WE_Out, DWE_Out, rfdsc_Out,carry_out : STD_LOGIC := '0';
signal AluOp_Out,nRs1_Aux,nRs2_Aux,nRd_Aux,nRDMux_out: STD_LOGIC_VECTOR (5 downto 0) := "000000";
begin


end Behavioral;

