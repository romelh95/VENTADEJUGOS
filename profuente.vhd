library ieee;
 
use IEEE.std_logic_1164.all;
 
entity profuente is
port(A,B: in std_logic_vector(10 downto 0);
igual: out std_logic);  --declaración variables de salida
 
END profuente;
 
architecture situacion of profuente is 
 
begin

igual <= '1' when (A=B)else '0'; --A=B, salida igual a 1, resto a 0 
 
END situacion;