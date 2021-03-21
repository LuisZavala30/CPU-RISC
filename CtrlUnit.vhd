-- Library and package declaration--
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;


ENTITY CtrlUnit IS
	PORT (
		Oper				:	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		JiJr_Op			:	OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		Beq_Op			:	OUT STD_LOGIC;
		PCInc_Op			:	OUT STD_LOGIC;
		WriteLEDs_Op	:	OUT STD_LOGIC;
		Write7Seg_Op	:	OUT STD_LOGIC;
		RegWrite_Op		:	OUT STD_LOGIC;
		ALUOp_Op			:	OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		RegSrc_Op		:	OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END CtrlUnit;

	  
ARCHITECTURE RTL OF CtrlUnit is
BEGIN
	PROCESS (Oper) 
	BEGIN
	
	CASE Oper IS
	-- ADD --
	WHEN "0000" =>	RegSrc_Op		<= "10";
						ALUOp_Op			<= "000";
						RegWrite_Op		<= '1';
						Write7Seg_Op	<= '0';
						WriteLEDs_Op	<= '0';
						PCInc_Op			<= '0';
						Beq_Op			<= '0';
						JiJr_Op			<= "00";
	-- SUB --					
	WHEN "0001" =>	RegSrc_Op		<= "10";
						ALUOp_Op			<= "001";
						RegWrite_Op		<= '1';
						Write7Seg_Op	<= '0';
						WriteLEDs_Op	<= '0';
						PCInc_Op			<= '0';
						Beq_Op			<= '0';
						JiJr_Op			<= "00";
	-- AND -- 					
	WHEN "0010" =>	RegSrc_Op		<= "10";
						ALUOp_Op			<= "010";
						RegWrite_Op		<= '1';
						Write7Seg_Op	<= '0';
						WriteLEDs_Op	<= '0';
						PCInc_Op			<= '0';
						Beq_Op			<= '0';
						JiJr_Op			<= "00";
	-- OR --					
	WHEN "0011" =>	RegSrc_Op		<= "10";
						ALUOp_Op			<= "011";
						RegWrite_Op		<= '1';
						Write7Seg_Op	<= '0';
						WriteLEDs_Op	<= '0';
						PCInc_Op			<= '0';
						Beq_Op			<= '0';
						JiJr_Op			<= "00";
	-- XOR --					
	WHEN "0100" =>	RegSrc_Op		<= "10";
						ALUOp_Op			<= "100";
						RegWrite_Op		<= '1';
						Write7Seg_Op	<= '0';
						WriteLEDs_Op	<= '0';
						PCInc_Op			<= '0';
						Beq_Op			<= '0';
						JiJr_Op			<= "00";
	-- NOT --					
	WHEN "0101" =>	RegSrc_Op		<= "10";
						ALUOp_Op			<= "101";
						RegWrite_Op		<= '1';
						Write7Seg_Op	<= '0';
						WriteLEDs_Op	<= '0';
						PCInc_Op			<= '0';
						Beq_Op			<= '0';
						JiJr_Op			<= "00";
	-- SHL -- 					
	WHEN "0110" =>	RegSrc_Op		<= "10";
						ALUOp_Op			<= "110";
						RegWrite_Op		<= '1';
						Write7Seg_Op	<= '0';
						WriteLEDs_Op	<= '0';
						PCInc_Op			<= '0';
						Beq_Op			<= '0';
						JiJr_Op			<= "00";
	-- SHR -- 					
	WHEN "0111" =>	RegSrc_Op		<= "10";
						ALUOp_Op			<= "111";
						RegWrite_Op		<= '1';
						Write7Seg_Op	<= '0';
						WriteLEDs_Op	<= '0';
						PCInc_Op			<= '0';
						Beq_Op			<= '0';
						JiJr_Op			<= "00";
	-- LD --					
	WHEN "1000" =>	RegSrc_Op		<= "00";
						ALUOp_Op			<= "000";
						RegWrite_Op		<= '1';
						Write7Seg_Op	<= '0';
						WriteLEDs_Op	<= '0';
						PCInc_Op			<= '0';
						Beq_Op			<= '0';
						JiJr_Op			<= "00";
	-- SPC --					
	WHEN "1001" =>	RegSrc_Op		<= "01";
						ALUOp_Op			<= "000";
						RegWrite_Op		<= '1';
						Write7Seg_Op	<= '0';
						WriteLEDs_Op	<= '0';
						PCInc_Op			<= '0';
						Beq_Op			<= '0';
						JiJr_Op			<= "00";
	-- BEQ --					
	WHEN "1010" =>	RegSrc_Op		<= "00";
						ALUOp_Op			<= "001";
						RegWrite_Op		<= '0';
						Write7Seg_Op	<= '0';
						WriteLEDs_Op	<= '0';
						PCInc_Op			<= '0';
						Beq_Op			<= '1';
						JiJr_Op			<= "00";
	-- JI -- 					
	WHEN "1011" =>	RegSrc_Op		<= "00";
						ALUOp_Op			<= "000";
						RegWrite_Op		<= '0';
						Write7Seg_Op	<= '0';
						WriteLEDs_Op	<= '0';
						PCInc_Op			<= '0';
						Beq_Op			<= '0';
						JiJr_Op			<= "10";
	-- JR --					
	WHEN "1100" =>	RegSrc_Op		<= "00";
						ALUOp_Op			<= "000";
						RegWrite_Op		<= '0';
						Write7Seg_Op	<= '0';
						WriteLEDs_Op	<= '0';
						PCInc_Op			<= '0';
						Beq_Op			<= '0';
						JiJr_Op			<= "01";
	-- W7SEG --					
	WHEN "1101" =>	RegSrc_Op		<= "00";
						ALUOp_Op			<= "000";
						RegWrite_Op		<= '0';
						Write7Seg_Op	<= '1';
						WriteLEDs_Op	<= '0';
						PCInc_Op			<= '0';
						Beq_Op			<= '0';
						JiJr_Op			<= "00";
	-- WLEDS --					
	WHEN "1110" =>	RegSrc_Op		<= "00";
						ALUOp_Op			<= "000";
						RegWrite_Op		<= '0';
						Write7Seg_Op	<= '0';
						WriteLEDs_Op	<= '1';
						PCInc_Op			<= '0';
						Beq_Op			<= '0';
						JiJr_Op			<= "00";
	-- RSW --					
	WHEN "1111" =>	RegSrc_Op		<= "11";
						ALUOp_Op			<= "000";
						RegWrite_Op		<= '1';
						Write7Seg_Op	<= '0';
						WriteLEDs_Op	<= '0';
						PCInc_Op			<= '0';
						Beq_Op			<= '0';
						JiJr_Op			<= "00";
						
	WHEN OTHERS =>	RegSrc_Op		<= "00";
						ALUOp_Op			<= "000";
						RegWrite_Op		<= '0';
						Write7Seg_Op	<= '0';
						WriteLEDs_Op	<= '0';
						PCInc_Op			<= '0';
						Beq_Op			<= '0';
						JiJr_Op			<= "00";

	END CASE;
	END PROCESS;

END RTL;