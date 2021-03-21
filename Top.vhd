----------------------------------------------------------------------------------
-- Company: 		ITESM Campus Qro
-- Engineers: 		Luis Angel Zavala Robles	
-- 					Misael Jimenez
--						Misael Resendiz
--
-- Create Date:    03/07/2021 
-- Design Name: 
-- Module Name:    Top - Behavioral 
-- Project Name: 	 Risc CPU Challenge
-- Target Devices: MAX DE10-LITE FPGA BOARD
-- Tool versions:  Quartus Prime Lite 18.1
-- Description: 
--
-- Dependencies: 
--
-- Revision: 		v1.0
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------


-- Library and package declaration--
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;


ENTITY Top IS
	PORT(
			Switches :	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			Clk50MHz	:	IN STD_LOGIC;
			Clr		:	IN STD_LOGIC;
			SegH		:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			SegL		:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			LEDs		:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			Turnoff	:	OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			LEDsoff	:	OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END Top;


ARCHITECTURE RTL OF Top is

COMPONENT ProgCounter
  PORT ( 
	  PCIn	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	  Clk		:	IN STD_LOGIC;
	  Cen		:	IN	STD_LOGIC;
	  Rst		:	IN	STD_LOGIC;
	  PCOut	:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT ProgCounter;

COMPONENT Mem
	PORT (
		Addr		:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		DataOp	:	OUT STD_LOGIC_vECTOR(3 DOWNTO 0);
		Datars	:	OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		Datart	:	OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		Datard	:	OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		Datai		:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT Mem;

COMPONENT CtrlUnit
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
END COMPONENT CtrlUnit;

COMPONENT Registers
	PORT (
		SelA	:	IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		SelB	:	IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		SelWR	:	IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		Data	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		Clk	:	IN STD_LOGIC;
		Cen	:	IN STD_LOGIC;
		Rst	:	IN STD_LOGIC;
		WE		:	IN STD_LOGIC;
		OutA	:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		OutB	:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT Registers;

COMPONENT ALU
	PORT (
		InA	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		InB	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		Sel	:	IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		Zero	:	OUT STD_LOGIC;
		Oper	:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT ALU;

COMPONENT FullAdder
	PORT (
		InA	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		InB	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		S		:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT FullAdder;

COMPONENT Increm
	PORT (
		InA	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		InB	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		Sel	:	IN STD_LOGIC;
		M		:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT Increm;

COMPONENT BrEq
	PORT (
		InA	:	IN STD_LOGIC;
		InB	:	IN STD_LOGIC;
		Sel	:	IN STD_LOGIC;
		M		:	OUT STD_LOGIC);
END COMPONENT BrEq;

COMPONENT Mux4to1
	PORT (
		InA	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		InB	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		InC	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		InD	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		Sel	:	IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		M		:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT Mux4to1;

COMPONENT Reg8
	PORT (
		Inrs	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		Clk	:	IN STD_LOGIC;
		Cen	:	IN STD_LOGIC;
		Rst	:	IN STD_LOGIC;
		En		:	IN STD_LOGIC;
		OutD	:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT Reg8;

COMPONENT Dec7Seg
	PORT (
		InR	:	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		seg	:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT Dec7Seg;

COMPONENT ClkDiv
	PORT (
		Clkin		:	IN STD_LOGIC;
		Rst		:	IN STD_LOGIC;
		Clkout	:	OUT STD_LOGIC);
END COMPONENT ClkDiv;

COMPONENT DispOff
	PORT (
		Turnoff	:	OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END COMPONENT DispOff;


------ Embedded signal declaration ------ 
SIGNAL PC			: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL rs			: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL rt			: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL rd			: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL opcode		: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL imm			: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL RegSrc		: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL ALUOp		: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL RegWrite	: STD_LOGIC;
SIGNAL Write7Seg	: STD_LOGIC;
SIGNAL WriteLEDs	: STD_LOGIC;
SIGNAL PCInc		: STD_LOGIC;
SIGNAL Beq			: STD_LOGIC;
SIGNAL JiJr			: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL rsd			: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL rtd			: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL ALUOper		: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL ALUZero		: STD_LOGIC;
SIGNAL AdderS		: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL IncremM		: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL BrEqM		: STD_LOGIC;
SIGNAL DataM		: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL BrJiJrM		: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL D				: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL ClkEn		: STD_LOGIC;


BEGIN

------Instantiate Components ------- 
	
	C01 : ProgCounter
	PORT MAP(
		PCIn	=> BrJiJrM,
		Clk	=> Clk50MHz,
		Cen	=> ClkEn,
		Rst	=>	Clr,
		PCOut	=>	PC);
	
	C02 : Mem
	PORT MAP(
		Addr		=> PC,
		DataOp	=>	opcode,
		Datars	=>	rs,
		Datart	=>	rt,
		Datard	=> rd,
		Datai		=> imm);
		
	C03 : CtrlUnit
	PORT MAP(
		Oper				=>	opcode,
		JiJr_Op			=> JiJr,
		Beq_Op			=> Beq,
		PCInc_Op			=> PCInc,
		WriteLEDs_Op	=> WriteLEDs,
		Write7Seg_Op	=> Write7Seg,
		RegWrite_Op		=> RegWrite,
		ALUOp_Op			=> ALUOp,
		RegSrc_Op		=> RegSrc);
	
	C04 : Registers
	PORT MAP (
		SelA	=> rs,
		SelB	=> rt,
		SelWR => rd,
		Data	=> DataM,
		Clk	=> Clk50MHz,
		Cen	=> ClkEn,
		Rst	=> Clr,
		WE		=> RegWrite,
		OutA	=> rsd,
		OutB	=> rtd);
		
	C05 : ALU
	PORT MAP (
		InA	=> rsd,
		InB	=> rtd,
		Sel	=> ALUOp,
		Zero	=> ALUZero,
		Oper	=> ALUOper);
	
	C06 : FullAdder
	PORT MAP (
		InA	=> PC,
		InB	=> IncremM,
		S		=> AdderS);
		
	C07 : Increm
	PORT MAP ( 
		InA	=> "00000001",
		InB	=> imm,
		Sel	=> BrEqM,
		M		=> IncremM);

	C08 : BrEq
	PORT MAP (
		InA	=> PCInc,
		InB	=>	ALUZero,
		Sel	=> Beq,
		M		=> BrEqM);
	
	C09 : Mux4to1
	PORT MAP (
		InA	=> imm,
		InB	=> PC,
		InC	=> ALUOper,
		InD	=> Switches,
		Sel	=> RegSrc,
		M 		=> DataM);
		
	C10 : Mux4to1
	PORT MAP (
		InA	=> AdderS,
		InB	=> rsd,
		InC	=> imm,
		InD	=> "00000000",
		Sel	=> JiJr,
		M		=> BrJiJrM);
	
	C11 : Reg8
	PORT MAP (
		Inrs	=> rsd,
		Clk	=> Clk50MHz,
		Cen	=> ClkEn,
		Rst	=> Clr,
		En		=> Write7Seg,
		OutD	=> D);

	C12 : Reg8
	PORT MAP (
		Inrs	=> rsd,
		Clk	=> Clk50MHz,
		Cen	=> ClkEn,
		Rst	=> Clr,
		En		=> WriteLEDs,
		OutD	=> LEDs);
	
	C13 : Dec7Seg
	PORT MAP (
		InR	=> D(7 DOWNTO 4),
		Seg	=> SegH);
	
		
	C14 : Dec7Seg
	PORT MAP (
		InR	=> D(3 DOWNTO 0),
		Seg	=> SegL);
	
	C15 : ClkDiv
	PORT MAP (
		Clkin		=> Clk50MHz,
		Rst		=> Clr,
		Clkout	=> ClkEn);
		
	C16 : DispOff
	PORT MAP (
		Turnoff => Turnoff);
		
	LEDsoff <= "00";
		
END RTL;