library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

entity bloqueconsulta is
	port(escritura,lectura,resetescritura,resetlectura,clock: in std_logic;
	add: in std_logic_vector(10 downto 0);
	q: out std_logic_vector(10 downto 0));
end bloqueconsulta;
architecture sol of bloqueconsulta is
signal r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,tempes,tempmuestra: std_logic_vector(10 downto 0);
begin
	PROCESS(clock,resetescritura,resetlectura)
		BEGIN
		if resetescritura='0' then --dar valores de 0 a la salida y buffers
				tempes<="00000000000";
				r1<="00000000000";r2<="00000000000";
				r3<="00000000000";r4<="00000000000";
				r5<="00000000000";r6<="00000000000";
				r7<="00000000000";r8<="00000000000";
				r9<="00000000000";r10<="00000000000";
		elsif resetlectura='0' then --dar valores de 0 a la salida y buffers
				tempmuestra<="00000000000";		
		elsif (clock'event and clock='1') then
				if(escritura='1') then--guardar
					tempes<=tempes+"00000000001";
					if (tempes="00000000001")then r1<=add;
					elsif (tempes="00000000010")then r2<=add;
					elsif (tempes="00000000011")then r3<=add;
					elsif (tempes="00000000100")then r4<=add;
					elsif (tempes="00000000101")then r5<=add;
					elsif (tempes="00000000110")then r6<=add;
					elsif (tempes="00000000111")then r7<=add;
					elsif (tempes="00000001000")then r8<=add;
					elsif (tempes="00000001001")then r9<=add;
					elsif (tempes="00000001010")then r10<=add;end if;
					
				elsif(lectura='1') then--mostrar
					tempmuestra<=tempmuestra+"00000000001";
					if (tempmuestra="00000000001")then q<=r1;
					elsif (tempmuestra="00000000010")then q<=r2;
					elsif (tempmuestra="00000000011")then q<=r3;
					elsif (tempmuestra="00000000100")then q<=r4;
					elsif (tempmuestra="00000000101")then q<=r5;
					elsif (tempmuestra="00000000110")then q<=r6;
					elsif (tempmuestra="00000000111")then q<=r7;
					elsif (tempmuestra="00000001000")then q<=r8;
					elsif (tempmuestra="00000001001")then q<=r9;
					elsif (tempmuestra="00000001010")then q<=r10;end if;
				end if;
		end if;

		if (tempes>"00000001010") then tempes<="00000000000";end if;
			
	end process;
		
					
end sol;