--MSS de la maquina

LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;
entity MSS is
	port	(clock, resetn, start, opcion1, consulta, led_verde, jugoselec,contarconsulta,mezcla,terminar,salirconsulta,fin: in std_logic;
			reset_1,reset_con,resjugo,en_bloquejugo,en_consulta,reset_consulta,clockram,en_ram,mezclar,en_display, reset_todo,seg5,zz,clockbloque,reset_matrix,limpiar: out std_logic);
end MSS;

architecture sol of MSS is
type estado is (ta, tb, tc, td, te,te1, tf, tg,th,ti,ti1, tp,tq,tq1,tr);
signal y: estado;
begin
MSS_transiciones:process(resetn,clock)
	begin
		if (resetn='0') then y<=ta;
		elsif(clock'event and clock='1') then
			case y is
						when ta =>if start='1' then y<=tb;--presiono start
										else y<=ta;end if;
						when tb =>if start='0' then y<=tc;--suelto start
										else y<=tb;end if;
						when tc => y<=td;
						when td => if opcion1='1' then y<=te;--seleccion del menu
										elsif consulta ='1' then y<=tq1;
										else y<=td;end if;
						when te => if jugoselec='1' then y<=te1;--espera a que se selecciones un jugo
										else y<=te;end if;
						when te1 => if jugoselec='0' then y<=tf;
										else y<=te1;end if;
						when tf => if mezcla='1' then y<=tg;--espera a que sueltes el boton de jugo
										elsif terminar='1' then y<=th;
										else y<=tf;end if;
						when tg => y<=te;
						
						when th => if led_verde='1' then y<=ti;
										else y<= th;end if;
						when ti => y<=ti1;
						when ti1 => y<=td;
						when tq1 => y<=tp;
						when tp => if contarconsulta='1' then y<=tq;
										else y<=tp;end if;
						when tq => if salirconsulta='1' then y<=tr;-- cuando sea 10 se sale
										else y<=tp;end if;
						when tr=> y<=tc;--retornar a opcion1/consulta
			end case;
		end if;
end process;

MSS_salidas: process (y)
		begin--poner todas las salidas como cero para poder activar cada bloque en el estado que se desea
				reset_1<='1';reset_con<='1';resjugo<='1';en_bloquejugo<='0';en_ram<='0';clockram<='0';reset_matrix<='1'; limpiar<='0';
				en_ram<='0';mezclar<='0';en_consulta<='0';zz<='0';reset_consulta<='1';en_display<='0';clockbloque<='0'; reset_todo<='1';seg5<='0';
				
			case y is 
				when ta =>
				when tb => reset_todo<='0';reset_matrix<='0';--reset del todos los datos guardados
				when tc =>reset_matrix<='0';
				when td => reset_consulta<='0';reset_1<='0';reset_con<='0';reset_matrix<='0';--menu
				when te => en_display<='1';
				when te1 =>en_bloquejugo<='1';en_display<='1';zz<='1';clockbloque<='1';
				when tf => en_ram<='1';en_display<='1';clockram<='1';
				when tg => mezclar<='1';
				when th => seg5<='1';en_display<='0';en_ram<='1';en_bloquejugo<='1';--
				when ti => en_ram<='1';clockram<='1';en_display<='0';resjugo<='0';
				when ti1 => en_ram<='1';clockram<='1';en_display<='0';limpiar<='1';
				when tq1=> en_consulta<='1';zz<='1';clockram<='1';
				when tp => en_consulta<='1';
				when tq => en_consulta<='1';zz<='1';clockram<='1';
				when tr => 
			
			end case;
end process;
end sol;