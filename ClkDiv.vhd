-- Library and package declaration--
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;



ENTITY ClkDiv IS
	PORT (
		Clkin		:	IN STD_LOGIC;
		Rst		:	IN STD_LOGIC;
		Clkout	:	OUT STD_LOGIC);
END ClkDiv;

ARCHITECTURE RTL OF ClkDiv is
  -- Embedded signals declaration
  -- Used by Frequency Divider (FreqDiv)
  
  -- Define a value that contains the desired Frequency
  constant DesiredFreq : natural := 50_000_000;  -- Once per second changes in the FSM
  -- Frequency for a DE2-Lite board is 50MHz
  constant BoardFreq   : natural := 50_000_000;
  -- Calculate the value the counter should reach to obtain desired Freq.
  constant MaxOscCount : natural := BoardFreq / DesiredFreq;
  -- Pulse counter for the oscillator
  signal OscCount      : natural range 0 to MaxOscCount;


Begin
	Freq_Div : Process(Rst, Clkin)
	Begin
		if(Rst = '0') then
			OscCount <= 0;
		elsif (rising_edge(Clkin)) then
			if(OscCount = MaxOscCount) then
				ClkOut <= '1';
				OscCount <= 0;
			else
				ClkOut <= '0';
				OscCount <= OscCount + 1;
			end if;
		end if;
	End Process Freq_Div;

END RTL;