library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity UnidadControl is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           op2 : in  STD_LOGIC_VECTOR (2 downto 0);
           cond : in  STD_LOGIC_VECTOR (3 downto 0);
           icc : in  STD_LOGIC_VECTOR (3 downto 0);
           HabilitadorMemoria : out  STD_LOGIC;
           Rfdest : out  STD_LOGIC;
           Rfsource : out  STD_LOGIC_VECTOR (1 downto 0);
           Pcsource : out  STD_LOGIC_VECTOR (1 downto 0);
           EscrituraMem : out  STD_LOGIC;
           EscrituraRF : out  STD_LOGIC;
           Aluop : out  STD_LOGIC_VECTOR (5 downto 0));
end UnidadControl;

architecture Behavioral of UnidadControl is

begin
	process(op, op3, op2, cond, icc)
begin
	
	if(op = "01") then -- call
		Pcsource <= "01"; --salto disp 30
		EscrituraRF <= '1';
		Rfsource <= "10";
		HabilitadorMemoria <= '0';
		Rfdest <= '1';
		EscrituraMem <= '0';
		Aluop <= "111111";
	else
		if(op = "00") then
			if(op2 = "010") then
				case cond is
					when "1000" => -- Branch Always
						Pcsource <= "10"; -- salto disp 22
						EscrituraRF <= '0';
						HabilitadorMemoria <= '1';
						Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "111111";
					when "1001" => -- Branch on Not Equal
						if(not(icc(2))='1') then -- not z
							Pcsource <= "10"; -- salto disp 22
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						else
							Pcsource <= "11"; -- salto pc
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						end if;
					when "0001" => -- Branch on equal
						if(icc(2) = '1') then -- z
							Pcsource <= "10"; -- salto disp 22
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						else
							Pcsource <= "11"; -- salto pc
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						end if;
					when "1010" => -- Branch in Grester
						if((not(icc(2) or (icc(3) xor icc(1)))) = '1') then --Not (z or (n xor v))
							Pcsource <= "10"; -- salto disp 22
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						else
							Pcsource <= "11"; -- salto pc
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						end if;
					when "0010" => --Branch on Less on Equal
						if((icc(2) or (icc(3) xor icc(1))) = '1') then
							Pcsource <= "10"; -- salto disp 22
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						else
							Pcsource <= "11"; -- salto pc
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						end if;
					when "1011" => -- Branch on Greater or Equal
						 if((not(icc(3) xor icc(1))) = '1') then
							Pcsource <= "10"; -- salto disp 22
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						else
							Pcsource <= "11"; -- salto pc
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						end if;
					when "0011" => -- Branch on Less
						if((icc(3) xor icc(1)) = '1') then
							Pcsource <= "10"; -- salto disp 22
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						else
							Pcsource <= "11"; -- salto pc
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						end if;
					when "1100" => -- Branch on greater unsigned
						if((not(icc(0) or icc(2)))= '1') then
							Pcsource <= "10"; -- salto disp 22
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						else
							Pcsource <= "10"; -- salto pc
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						end if;
					when "0100" => -- Branch on Less Equal Unsigned
						if((icc(0) or icc(2)) = '1') then
							Pcsource <= "10"; -- salto disp 22
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						else
							Pcsource <= "11"; -- salto pc
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						end if;
					when "1101" => -- Branch on carroy clear
						if((not(icc(0))) = '1') then
							Pcsource <= "10"; -- salto disp 22
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						else
							Pcsource <= "11"; -- salto pc
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						end if;
					when "0101" => -- Branch on Carroy Set
						if(icc(0) = '1') then
							Pcsource <= "10"; -- salto disp 22
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						else
							Pcsource <= "11"; -- salto pc
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						end if;
					when "1110" => -- Branch on positive
						if((not(icc(3))) = '1') then
							Pcsource <= "10"; -- salto disp 22
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						else
							Pcsource <= "11"; -- salto pc
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						end if;
					when "0110" => -- Branch on negative
						if(icc(3) = '1') then
							Pcsource <= "10"; -- salto disp 22
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						else
							Pcsource <= "11"; -- salto pc
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						end if;
					when "1111" => -- Branch on overflow carry
						if((not(icc(1))) = '1') then
							Pcsource <= "10"; -- salto disp 22
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						else
							Pcsource <= "11"; -- salto pc
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						end if;
					when "0111" => -- Branch on overflow set
						if(icc(1) = '1') then
							Pcsource <= "10"; -- salto disp 22
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						else
							Pcsource <= "11"; -- salto pc
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
						end if;
					when others =>
							Pcsource <= "00"; -- salto disp 22
							EscrituraRF <= '0';
							HabilitadorMemoria <= '0';
							Rfsource <= "00"; -- No importa este valor ya que no se permite escritura en el Register File
							Rfdest <= '0'; 
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
				end case;
			else
				if(op2 = "100") then
					Pcsource <= "11"; -- salto pc
					EscrituraRF <= '0';
					HabilitadorMemoria <= '0';
					Rfsource <= "01"; -- Resultado operacion
					Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
					EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
					Aluop <= "111111";
				end if;
			end if;
		else
			if(op = "10") then
				case op3 is
					when "000000" => 
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "000000"; --suma
					when "000100" =>
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "000001"; --resta
					when "000001" => 
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "000010"; --and
					when "000010" => 
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "000011"; --or
					when "000011" =>
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "000100"; --xor
					when "000111" =>
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "000101"; --xnor
					when "000101" =>
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "000110"; --nand
					when "000110" => 
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "000111"; --nor
					when "001000" => 
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "001000"; --suma con carry
					when "010000" => 
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "001001"; --sumacc
					when "011000" => 
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "001010"; --suma con carrycc
					when "001100" =>
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "001011"; --resta con carry
					when "010100" => 
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "001100"; --restacc
					when "011100" => 
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "001101"; --resta con carrycc
					when "010001" => 
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "001110"; --andcc
					when "010101" =>
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "001111"; --nandcc
					when "010010" => 
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "010000"; --orcc
					when "010110" =>
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "010001"; --norcc
					when "010011" => 
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "010010"; --xorcc
					when "010111" => 
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "010011"; --xnorcc
					when "100101" =>
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "010100"; --corrimiento izquierdo
					when "100110" =>
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "010101"; --corrimiento derecho
					--Especiales se dejaron igual
					when "111100" => 
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "111100"; --save
					when "111101" => 
						Pcsource <= "11"; -- salto pc
						EscrituraRF <= '1';
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "111101"; --restore
					when "111000" =>
						Pcsource <= "00"; -- salto direccion calculado
						EscrituraRF <= '1'; -- Se guarda en el Register File el valor del PC
						HabilitadorMemoria <= '0';
						Rfsource <= "10"; -- Valor de PC
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "000000";
					when others => 
						Pcsource <= "11"; -- salto direccion calculado
						EscrituraRF <= '0'; -- Se guarda en el Register File el valor del PC
						HabilitadorMemoria <= '0';
						Rfsource <= "01"; -- Resultado operacion
						Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
						EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
						Aluop <= "111111";
				end case;
			else
				if(op = "11") then
					case op3 is
						when "000100" => --store
							Pcsource <= "11"; -- salto pc
							EscrituraRF <= '0';
							HabilitadorMemoria <= '1';
							Rfsource <= "01"; -- No importa porque no se va a guardar en el Register File
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '1'; --  El dato es escrito en Memoria de Datos
							Aluop <= "111111";
						when "000000" => --load
							Pcsource <= "11"; -- salto pc
							EscrituraRF <= '1';
							HabilitadorMemoria <= '1';
							Rfsource <= "00"; -- Se debe guardar lo que se carga de la Memoria de Datos
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; --  El dato no es escrito en Memoria de Datos
							Aluop <= "111111";
						when others =>
							Pcsource <= "11"; -- salto direccion calculado
							EscrituraRF <= '0'; -- Se guarda en el Register File el valor del PC
							HabilitadorMemoria <= '1';
							Rfsource <= "01"; -- Resultado operacion
							Rfdest <= '0'; -- No importa este Valor pues no se permitira escritura en el Register File
							EscrituraMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
							Aluop <= "111111";
					end case;
				end if;
			end if;
		end if;
	end if;
end process;


end Behavioral;

