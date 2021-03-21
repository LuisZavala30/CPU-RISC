-- Library and package declaration--
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;


ENTITY Mux4to1 IS
	PORT (
		InA	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		InB	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		InC	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		InD	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		Sel	:	IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		M		:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END Mux4to1;

ARCHITECTURE RTL OF Mux4to1 is
BEGIN
-- Mux to select the value of the output M

	WITH Sel Select
	M <=	InA WHEN "00",
			InB WHEN "01",
			InC WHEN "10",
			InD WHEN "11",
			InA WHEN OTHERS;
		



END RTL;