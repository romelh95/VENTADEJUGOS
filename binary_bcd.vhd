LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
ENTITY BinBCD IS
 PORT(
 B : IN std_logic_vector (15 DOWNTO 0);
 centenas : OUT std_logic_vector (3 DOWNTO 0);
 decenas : OUT std_logic_vector (3 DOWNTO 0);
 millares : OUT std_logic_vector (3 DOWNTO 0);
 unidades : OUT std_logic_vector (3 DOWNTO 0)
 );
END BinBCD ;
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
ARCHITECTURE struct OF BinBCD IS
 SIGNAL P : std_logic_vector(15 DOWNTO 0);
BEGIN
 bcd1: process(B)
 variable z: STD_LOGIC_VECTOR (31 downto 0);
 begin
 for i in 0 to 31 loop
 z(i) := '0';
 end loop;
 z(18 downto 3) := B;
 for i in 0 to 12 loop
 if z(19 downto 16) > 4 then
 z(19 downto 16) := z(19 downto 16) + 3;
 end if;
 if z(23 downto 20) > 4 then
 z(23 downto 20) := z(23 downto 20) + 3;
 end if;
 if z(27 downto 24) > 4 then
 z(27 downto 24) := z(27 downto 24) + 3;
 end if;
 if z(31 downto 28) > 4 then
 z(31 downto 28) := z(31 downto 28) + 3;
 end if;
 
 z(31 downto 1) := z(30 downto 0);
 end loop;
 P <= z(31 downto 16);
 end process bcd1;

 unidades <= P(3 downto 0);
 decenas <= P(7 downto 4);
 centenas <= P(11 downto 8);
 millares <= P(15 downto 12);
 END struct;
