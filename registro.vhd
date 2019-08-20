LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY resgisto IS
	PORT(clock,enable,reset : IN STD_LOGIC;
			entrada: in std_logic_vector(9 downto 0);
		 sal : OUT std_logic_vector(9 downto 0));
END registro;

ARCHITECTURE sol OF registro IS
BEGIN

	PROCESS(clock,reset)
	BEGIN
		if reset='0' then Q<="0000";dos_seg<='0';
  		elsif (clock'event and clock='1') then
			if enable='1' then
				sal<= entrada;
			end if;
		end if;
	END PROCESS;
END sol;