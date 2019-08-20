library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

entity preciojugos is
	port(data: in std_logic_vector(9 downto 0);
	enable,reset,clock,mezcla: in std_logic;
	q: out std_logic;
	precio: out std_logic_vector(10 downto 0));
end preciojugos;
architecture sol of preciojugos is
signal temp,suma: std_logic_vector(10 downto 0);
begin
	PROCESS(clock,reset)
		BEGIN
		if reset='0' then --dar valores de 0 a la salida y buffers
				temp<="00000000000";precio<="00000000000";
				suma<="00000000000";
				q<='0';
		elsif (clock'event and clock='1') then
				if(enable='1') then -- se le suma el precio cada vez que se activa la entrada y hay un ciclo de reloj
						suma<= suma+1;
						if (data= "0000000001") then precio<=temp+70 ; temp<=temp+70;-- se suma el precio
						elsif (data= "0000000010") then precio<=temp+50;temp<=temp+50;
						elsif (data= "0000000100") then precio<=temp+45;temp<=temp+45;
						elsif (data= "0000001000") then precio<=temp+80;temp<=temp+80;
						elsif (data= "0000010000") then precio<=temp+65;temp<=temp+65;
						elsif (data= "0000100000") then precio<=temp+55;temp<=temp+55;
						elsif (data= "0001000000") then precio<=temp+30;temp<=temp+30;
						elsif (data= "0010000000") then precio<=temp+45;temp<=temp+45;
						elsif (data= "0100000000") then precio<=temp+50;temp<=temp+50;
						elsif (data= "1000000000") then precio<=temp+60;temp<=temp+60;
						end if;
						if (mezcla='1') then precio<= temp+30;temp<=temp+30;end if;
						if (suma>"00000010011") then q<='1';end if;--indica cuando se supera los 20 niveles a la mss
				end if;
		end if;
	end process;
end sol;