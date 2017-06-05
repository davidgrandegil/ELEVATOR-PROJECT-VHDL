library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

entity divisorfrec is
PORT (
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		salida:out STD_LOGIC
	);
end divisorfrec;

architecture Behavioral of divisorfrec is
	signal temporal: std_logic;
	signal contador: integer range 0 to 299999 :=0; --De 50Mhz a 83Hz
begin
	divisorfrec:process(clk,reset)
	begin
		if (reset='1') then
			temporal <='0';
			contador <=0;
		elsif rising_edge(clk) then
			if (contador=299999) then
				temporal<= NOT (temporal);
				contador <=0;
			else
				contador <= contador+1;
			end if;
		end if;
	end process;
	salida <=temporal;
end Behavioral;