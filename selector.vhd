library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity selector is--seleciona entrre el valor que se juega o el valor almacenado
	port(jugando,almacenado: in std_logic_vector(15 downto 0);
			salida: out  std_logic_vector(15 downto 0);
			modo: in std_logic);
end selector;

architecture sol of selector is
begin
		process(modo)
			begin
				if modo='1' then --jugando
					salida<= jugando;
				else salida<=almacenado;end if;--almacenado
		end process;
end sol;
						