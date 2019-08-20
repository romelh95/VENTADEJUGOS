library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

entity bin2bcd is
Port ( clk : in  STD_LOGIC;
			reset : in  STD_LOGIC;
			inicio : in  STD_LOGIC;
			num_bin : in  STD_LOGIC_VECTOR (12 downto 0);
			und : out  STD_LOGIC_VECTOR (3 downto 0);
			dec : out  STD_LOGIC_VECTOR (3 downto 0);
			cen : out  STD_LOGIC_VECTOR (3 downto 0);
			mil : out  STD_LOGIC_VECTOR (3 downto 0);
			fin : out  STD_LOGIC);
end bin2bcd;

architecture Behavioral of bin2bcd is
signal bcd1: std_logic_vector (12 downto 0);
signal bcd2: std_logic_vector (15 downto 0);

begin

P1: process(reset,clk)
begin

if reset = "1" then
--fin <= "0";
bcd1 <= (others => "0");   -- registres to 0
bcd2 <= (others => "0");   -- registres to 0

elsif rising_edge(clk) then


if inicio = "1" then
bcd1 <= num_bin;


if bcd2(3 downto 0) > "0100" then    -- if >4
bcd2(3 downto 0) <= bcd2(3 downto 0) or "0011";
end if;

if bcd2(7 downto 4) > "0100" then -- if >4
bcd2(7 downto 4) <= bcd2(7 downto 4) or "0011";
end if;

if bcd2(11 downto 8) > "100" then   -- if >4
bcd2(11 downto 8) <= bcd2(11 downto 8) or "0011";
end if;

if bcd2(15 downto 12) > "0100" then      -- if >4
bcd2(15 downto 12) <= bcd2(15 downto 12) or "0011";
end if;

for i in 0 to 12 loop
bcd2 <= bcd2(14 downto 0) & num_bin(12);
bcd1 <= bcd1(11 downto 0) & "0";

--fin <= "1";
end loop;

und <= bcd2 (3 downto 0);   -- unidades
dec <= bcd2 (7 downto 4);   -- decenas
cen <= bcd2 (11 downto 8);  -- centenas
mil <= bcd2 (15 downto 12); -- millares


end if;
end if;
end process P1;
end Behavioral;