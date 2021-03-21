-- Library and package declaration--
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;


ENTITY ProgCounter IS
  PORT ( 
	  PCIn	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	  Clk		:	IN STD_LOGIC;
	  Cen		:	IN	STD_LOGIC;
	  Rst		:	IN	STD_LOGIC;
	  PCOut	:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ProgCounter;	  
	  
ARCHITECTURE RTL OF ProgCounter is
BEGIN

	PROCESS (Clk, Rst)
	BEGIN
		IF(Rst = '0') THEN
			PCOut <= "00000000";
		ELSIF (rising_edge(Clk)) THEN
			IF(Cen = '1') THEN
				PCOut <= PCIn;
			END IF;
		END IF;
	END PROCESS;


END RTL;