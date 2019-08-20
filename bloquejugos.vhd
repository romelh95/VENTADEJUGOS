library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

entity bloquejugos is
	port(data: in std_logic_vector(9 downto 0);
	enable,reset,clock,mezcla: in std_logic;
	valor_matrix: out  std_logic_vector(4 downto 0);
	q1,q2,q3,q4,q5,q6,q7,q8,q9,q10: out std_logic;
	alarma,q:out std_logic;
	treinta: buffer std_logic_vector(10 downto 0);
	precio: out std_logic_vector(10 downto 0);
	limpiar: in std_logic);
end bloquejugos;
architecture sol of bloquejugos is
signal r1,r2,r3,r4,r5,r6,r7,r8,r9,r10: std_logic_vector(4 downto 0);
signal temp,suma: std_logic_vector(10 downto 0);
begin
	PROCESS(clock,reset)
		BEGIN
		if reset='0' then 
				r1<="10000";q1<='0';
				r2<="10000";q2<='0';
				r3<="10000";q3<='0';
				r4<="10000";q4<='0';
				r5<="10000";q5<='0';
				r6<="10000";q6<='0';
				r7<="10000";q7<='0';
				r8<="10000";q8<='0';
				r9<="10000";q9<='0';
				r10<="10000";q10<='0';
				valor_matrix<="00000";
				temp<="00000000000";
				precio<="00000000000";
				suma<="00000000000";
				treinta<="00000000000";
				q<='0';
				
		elsif (mezcla='1') then treinta<="00000011110";
		elsif (limpiar='1') then precio<="00000000000"; treinta<="00000011110";temp<="00000000000";
		
		elsif (clock'event and clock='1') then
				if(enable='1') then -- se le resta uno cada vez que se activa la entrada y hay un ciclo de reloj
						if (data= "0000000001") then -- en la siguiente linea mira si el dato es cero y en caso de que no lo seale resta 1
							if(r1>"00000") then r1<=r1-1;valor_matrix<=r1-1;
								precio<=temp+70+treinta ; temp<=temp+70+treinta;
							else q1<='1';r1<="00000";end if;-- ademas le damos a valor matrix
						
						elsif (data= "0000000010") then
							if(r2>"00000") then r2<=r2-1;valor_matrix<=r2-1;
								precio<=temp+50+treinta;temp<=temp+50+treinta;
							else q2<='1';r2<="00000";end if;
						
						elsif (data= "0000000100") then
							if(r2>"00000") then r3<=r3-1;valor_matrix<=r3-1;
							precio<=temp+45+treinta;temp<=temp+45+treinta;
							else q3<='1';r3<="00000";end if;
						
						elsif (data= "0000001000") then
							if(r3>"00000") then r4<=r4-1;valor_matrix<=r4-1;
								precio<=temp+80+treinta;temp<=temp+80+treinta;
							else q4<='1';r4<="00000";end if;
						
						elsif (data= "0000010000") then
							if(r4>"00000") then r5<=r5-1;valor_matrix<=r5-1;
								precio<=temp+65+treinta;temp<=temp+65+treinta;
							else q5<='1';r5<="00000";end if;
						
						elsif (data= "0000100000") then
							if(r6>"00000") then r6<=r6-1;valor_matrix<=r6-1;
								precio<=temp+55+treinta;temp<=temp+55+treinta;
							else q6<='1';r6<="00000";end if;
						
						elsif (data= "0001000000") then
							if(r7>"00000") then r7<=r7-1;valor_matrix<=r7-1;
								precio<=temp+30+treinta;temp<=temp+30+treinta;
							else q7<='1';r7<="00000";end if;
						
						elsif (data= "0010000000") then
							if(r8>"00000") then r8<=r8-1;valor_matrix<=r8-1;
								precio<=temp+45+treinta;temp<=temp+45+treinta;
							else q8<='1';r8<="00000";end if;
						
						elsif (data= "0100000000") then
							if(r9>"00000") then r9<=r9-1;valor_matrix<=r9-1;
								precio<=temp+50+treinta;temp<=temp+50+treinta;
							else q9<='1';r9<="00000";end if;
						
						elsif (data= "1000000000") then
							if(r10>"00000") then r10<=r10-1;valor_matrix<=r10-1;
								precio<=temp+60+treinta;temp<=temp+60+treinta;
							else q10<='1';r10<="00000";end if;
						else treinta<="00000000000";
						end if;
						treinta<="00000000000";
						if (suma>"00000010000") then q<='1';end if;--indica cuando se supera los 20 niveles a la mss
						
						if (r1="00000") or (r2="00000") or (r3>"00000") or (r4>"00000") or (r5>"00000") or (r6>"00000") or (r7>"00000") or (r8>"00000") or (r9>"00000") or (r10>"00000")then
							alarma<='1';-- alarma indica que se acaba algun jugo
						else alarma<='0';end if;
						
				end if;
		
		end if;
	end process;
end sol;