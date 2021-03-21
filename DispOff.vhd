-- Library and package declaration--
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;

ENTITY DispOff IS
	PORT (
		Turnoff	:	OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END DispOff;

ARCHITECTURE RTL OF DispOff is
BEGIN 

-- Turn unused leds off --
  Turnoff <= (others => '1');

END RTL;