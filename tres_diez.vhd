LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;
--q10 salir consulta
--q3 cambioconsulta
ENTITY tres_diez IS
	PORT(clock,enable,reset : IN STD_LOGIC;
		 tres,diez : OUT STD_LOGIC;
		 Q3,q10 : Buffer STD_LOGIC_VECTOR (3 downto 0));
END tres_diez;

ARCHITECTURE sol OF tres_diez IS
BEGIN

	PROCESS(clock,reset)
	BEGIN
		if reset='0' then Q3<="0000";tres<='0';diez<='0';q10<="0000";
  		elsif (clock'event and clock='1') then
			if enable='1' then
				
				if (Q10="1011")  then q10<="0000"; diez<='1';
				elsif (Q3="0010") then Q3<="0000";tres<='1';q10<=q10+1;
				else Q3<=Q3+1;tres<='0';diez<='0';
				end if;
			end if;
		end if;
	END PROCESS;
END sol;