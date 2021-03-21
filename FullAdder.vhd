-- Library and package declaration--
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;


ENTITY FullAdder IS
	PORT (
		InA	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		InB	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		S		:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END FullAdder;

ARCHITECTURE RTL OF FullAdder is
BEGIN
	S <= InA + InB; -- Sum of InA and InB
	
END RTL; 