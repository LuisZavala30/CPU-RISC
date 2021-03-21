-- Library and package declaration--
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;

ENTITY Reg8 IS
	PORT (
		Inrs	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		Clk	:	IN STD_LOGIC;
		Cen	:	IN STD_LOGIC;
		Rst	:	IN STD_LOGIC;
		En		:	IN STD_LOGIC;
		OutD	:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END Reg8;


ARCHITECTURE RTL OF Reg8 is
BEGIN

	PROCESS (Clk, Rst)
	BEGIN
		IF(Rst = '0') THEN
			OutD <= "00000000";
		ELSIF (falling_edge(Clk)) THEN
			IF(Cen = '1') THEN
				IF(En = '1') THEN
					OutD <= Inrs;
				END IF;
			END IF;
		END IF;
	END PROCESS;

END RTL;