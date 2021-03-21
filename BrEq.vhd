-- Library and package declaration--
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;

ENTITY BrEq IS
	PORT (
		InA	:	IN STD_LOGIC;
		InB	:	IN STD_LOGIC;
		Sel	:	IN STD_LOGIC;
		M		:	OUT STD_LOGIC);
END BrEq;

ARCHITECTURE RTL OF BrEq is
BEGIN

-- Mux to select the value of the output M

	WITH Sel SELECT
	M <=	InA WHEN '0',
			InB WHEN '1',
			InA WHEN OTHERS;
	

END RTL;