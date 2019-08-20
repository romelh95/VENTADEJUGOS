library ieee;
use ieee.std_logic_1164.all;

Entity decoder_de_bin_a_7segmentos is
	Port(	w: in std_logic_vector(3 downto 0);
			en: in std_logic;
			Q: out std_logic_vector(6 downto 0));
end decoder_de_bin_a_7segmentos;

Architecture sol of decoder_de_bin_a_7segmentos is
Signal F: std_logic_vector(6 downto 0);
Begin
	With w select
		F<=	"1111001" when "0001",
			"0100100" when "0010",
			"0110000" when "0011",
			"0011001" when "0100",
			"0010010" when "0101",
			"0000010" when "0110",
			"1111000" when "0111",
			"0000000" when "1000",
			"0010000" when "1001",
			"1000000" when others;
	Q<=F when en='1' else "0000000";
end sol;
--	With w select
--		F<=	"1111001" when "0001",
--			"0100100" when "0010",
--			"0110000" when "0011",
--			"0011001" when "0100",
--			"0010010" when "0101",
--			"0000010" when "0110",
--			"1111000" when "0111",
--			"0000000" when "1000",
--			"0010000" when "1001",
--			"1000000" when others;
--	Q<=F when en='1' else "0000000";