library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec_flechas is
    Port ( action : in  STD_LOGIC_VECTOR (1 DOWNTO 0);
           led_flechas : out  STD_LOGIC_VECTOR (6 downto 0);
           flecha_ctrl : out  STD_LOGIC);
end dec_flechas;

architecture dataflow of dec_flechas is

begin

	flecha_ctrl <= '0';
	WITH action SELECT
			led_flechas <= "0011101" WHEN "11",	--Subiendo
								"1100011" WHEN "00",	--Bajando
								"1111110" WHEN others;	--Parado
END ARCHITECTURE dataflow;