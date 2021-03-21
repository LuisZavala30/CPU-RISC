-- Library and package declaration--
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;

ENTITY Increm IS
	PORT (
		InA	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		InB	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		Sel	:	IN STD_LOGIC;
		M		:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END Increm;

ARCHITECTURE RTL OF Increm is
BEGIN

-- Mux to select the value of the output M
	WITH Sel SELECT 
	M <=	InA WHEN '0',
			InB WHEN '1',
			InA WHEN OTHERS;

END RTL;