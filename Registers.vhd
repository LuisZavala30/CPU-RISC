-- Library and package declaration--
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;



ENTITY Registers IS
   

	 
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
END Registers;

	  
ARCHITECTURE RTL OF Registers is
--  type type_ROM is array (0 to 7) of STD_LOGIC_VECTOR (7 downto 0);
--  --signal Reg : type_registers := (others => "00000000");
--  signal Reg : type_ROM := (others => "00000000");
--
--BEGIN
--
--  
--  OutA <= Reg(conv_integer(SelA));
--  OutB <= Reg(conv_integer(SelB));
--  
--  	PROCESS (Clk, Rst)
--	BEGIN
--		IF(Rst = '0') THEN
--			Reg <= (others => "00000000");
--		ELSIF (falling_edge(Clk)) THEN
--			IF(Cen = '1') THEN
--				IF(WE = '1') THEN
--					Reg(conv_integer(SelWR)) <= Data;
--				END IF;
--			END IF;
--		END IF;
--	END PROCESS;
 
 signal R0,R1,R2,R3,R4,R5,R6,R7: std_logic_vector(7 downto 0);
signal OutA_temp,OutB_temp: std_logic_vector(7 downto 0);
begin
	OutA <= OutA_temp;
	OutB <= OutB_temp;
	process(Clk,Rst)
	begin
		if (Rst = '0') then
			R0<="00000000";R1<="00000000";R2<="00000000";R3<="00000000";
			R4<="00000000";R5<="00000000";R6<="00000000";R7<="00000000";
		elsif falling_edge(Clk) then
			if ((Cen = '1') and (WE = '1')) then
				if (SelWR = "000")    then R0 <= Data;
				elsif (SelWR = "001") then R1 <= Data;
				elsif (SelWR = "010") then R2 <= Data;
				elsif (SelWR = "011") then R3 <= Data;
				elsif (SelWR = "100") then R4 <= Data;
				elsif (SelWR = "101") then R5 <= Data;
				elsif (SelWR = "110") then R6 <= Data;
				elsif (SelWR = "111") then R7 <= Data;
				end if;
			end if;
		end if;
	end process;
	
	process(SelA,SelB)
	begin
		-- selector de entrada a
		if(SelA="000") then
			OutA_temp <= R0;
		elsif(SelA="001") then
			OutA_temp <= R1;
		elsif(SelA="010") then
			OutA_temp <= R2;
		elsif(SelA="011") then
			OutA_temp <= R3;
		elsif(SelA="100") then
			OutA_temp <= R4;
		elsif(SelA="101") then
			OutA_temp <= R5;
		elsif(SelA="110") then
			OutA_temp <= R6;
		elsif(SelA="111") then
			OutA_temp <= R7;
		end if;
		-- selector de entrada b
		if(SelB="000") then
			OutB_temp <= R0;
		elsif(SelB="001") then
			OutB_temp <= R1;
		elsif(SelB="010") then
			OutB_temp <= R2;
		elsif(SelB="011") then
			OutB_temp <= R3;
		elsif(SelB="100") then
			OutB_temp <= R4;
		elsif(SelB="101") then
			OutB_temp <= R5;
		elsif(SelB="110") then
			OutB_temp <= R6;
		elsif(SelB="111") then
			OutB_temp <= R7;
		end if;
	end process;
		
  


END RTL; 