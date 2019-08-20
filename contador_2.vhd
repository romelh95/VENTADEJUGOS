LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY contador_2 IS
	PORT(clock,inicio,reset : IN STD_LOGIC;
		 dos_seg : OUT STD_LOGIC;
		 Q : Buffer STD_LOGIC_VECTOR (1 downto 0));
END contador_2;

ARCHITECTURE sol OF contador_2 IS
BEGIN

	PROCESS(clock,reset)
	BEGIN
		if reset='0' then Q<="00";dos_seg<='0';
  		elsif (clock'event and clock='1') then
			if inicio='1' then
				if (Q="10") then Q<="00";dos_seg<='0';
				else Q<=Q+1;dos_seg<='1';
				end if;
			end if;
		end if;
	END PROCESS;
END sol;