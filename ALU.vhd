-- Library and package declaration--
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;


ENTITY ALU IS
	PORT (
		InA	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		InB	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		Sel	:	IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		Zero	:	OUT STD_LOGIC;
		Oper	:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ALU;

architecture ar of ALU is
signal Oper_temp: std_logic_vector(7 downto 0);
begin
	Oper<=Oper_temp;
	process(InA,InB,Sel)
	begin
		-- if como funcion de mux para las 8 operaciones
		if(Sel="000") then
			Oper_temp<= InA + InB;
		elsif(Sel="001") then
			Oper_temp<= InA - InB;
		elsif(Sel="010") then
			Oper_temp<= InA and InB;
		elsif(Sel="011") then
			Oper_temp<= InA or InB;
		elsif(Sel="100") then
			Oper_temp<= InA xor InB;
		elsif(Sel="101") then
			Oper_temp<= not(InA);
		elsif(Sel="110") then
			Oper_temp<= InA(6 downto 0) & '0';
		elsif(Sel="111") then
			Oper_temp<= '0' & InA(7 downto 1);
		end if;

		-- condiciones en las que se activa o desactiva el zero
		if(Oper_temp="00000000") then
			Zero<='1';
		else Zero<='0';
		end if;
	end process;
end ar;