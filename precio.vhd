-- este bloque suma 
LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Std_logic_arith.all; 
use IEEE.std_logic_unsigned.all; 
use IEEE.numeric_std.all; 

ENTITY precio IS
	PORT(q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,mezcla: in std_logic_vector(10 downto 0);
			precio: out std_logic_vector(10 downto 0));
end precio;


ARCHITECTURE sol OF precio IS

BEGIN
	process(q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,mezcla) is
		begin
			precio<= (q1*70)+(q2*50)+(q3*45)+(q4*80)+(q5*65)+(q6*55)+(q7*30)+(q8*50)+(q9*60)+(q10*30)+(mezcla*30);

	end process;
	
end sol;