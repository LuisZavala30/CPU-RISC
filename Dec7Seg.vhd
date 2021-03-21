-- Library and package declaration--
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;

ENTITY Dec7Seg IS
	PORT (
		InR	:	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		seg	:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END Dec7Seg;


ARCHITECTURE RTL OF Dec7Seg is
BEGIN

	seg <=	"10000001" when InR = "0000" else -- 00
				"11001111" when InR = "0001" else -- 01
				"10010010" when InR = "0010" else -- 02
				"10000110" when InR = "0011" else -- 03
				"11001100" when InR = "0100" else -- 04
				"10100100" when InR = "0101" else -- 05
				"10100000" when InR = "0110" else -- 06
				"10001111" when InR = "0111" else -- 07
				"10000000" when InR = "1000" else -- 08
				"10000100" when InR = "1001" else -- 09
				"10001000" when InR = "1010" else -- A
				"11100000" when InR = "1011" else -- B
				"10110001" when InR = "1100" else -- C
				"11000010" when InR = "1101" else -- D
				"10110000" when InR = "1110" else -- E
				"10111000" when InR = "1111" else -- F
				
				"11111110";

END RTL;