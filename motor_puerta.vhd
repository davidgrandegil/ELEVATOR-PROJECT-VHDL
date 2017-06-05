library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity motor_puerta is
    Port ( CLK : in  STD_LOGIC;
			  RST : in  STD_LOGIC;
			  nivel : in STD_LOGIC;
			  celula : in  STD_LOGIC;
           accionar_puerta : in  STD_LOGIC;
           actuador_puerta : out  STD_LOGIC);
end motor_puerta;

architecture Behavioral of motor_puerta is

begin
	motor_puerta:process(RST,CLK)
	begin
		if (RST='1') then
			actuador_puerta <= '0';
		elsif rising_edge(CLK) then
			if (accionar_puerta='1') then 
				actuador_puerta <= '1';
			elsif (accionar_puerta='0' AND celula='1' AND nivel='1') then
				actuador_puerta <= '1';
			else actuador_puerta <= '0';
			end if;
		end if;
	end process;
end Behavioral;