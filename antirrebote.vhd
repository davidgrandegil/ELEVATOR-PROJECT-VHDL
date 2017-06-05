library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity antirrebote is
    Port ( CLK : in  STD_LOGIC;					--Entrada de reloj sin pasar por el divisor
			  RST : in  STD_LOGIC;
           logic_IN : in  STD_LOGIC;
           logic_OUT : out  STD_LOGIC);
end antirrebote;

architecture Behavioral of antirrebote is

constant contador_SIZE : integer := 20;		--tamaño del contador (Para 50MHz: 19, 10ms - 20, 20ms - 21, 42ms - 22, 84ms)

signal logic_prev   : std_logic := '0';		--almacena estado del boton, se usa como variable de transicion
signal contador    : std_logic_vector(contador_SIZE downto 0) := (others => '0');	--vector contador para que pase el tiempo antirrebote
	 
begin
    process(CLK,RST,logic_IN)
    begin
	 if (RST='1') then
		logic_OUT <= logic_IN;
	 elsif (CLK'event and CLK='1') then									--Si hay flanco de reloj
		 if (logic_prev XOR logic_in)='1' then							--Si 	la entrada es diferente al estado previo almacenado
			 contador <= (others => '0');										--Contador a cero
		 	 logic_prev <= logic_in;											--La entrada pasa a la variable de transicion
		 elsif (contador(contador_SIZE) = '0') then					--Si la entrada es igual a la variable de transicion y el contador no esta lleno
			 contador <= std_logic_vector(UNSIGNED(contador) + 1);	--Sumamos 1 al contador
       else																		--Si la entrada es igual a la variable de transicion y el contador esta lleno
			 logic_out <= logic_prev;										--Pasamos la variable de transicion a la salida
		 end if;
	 end if;
	 
    end process;

end Behavioral;

--El tiempo antirrebote dependerá del tamaño n del contador y de la frecuencia f segun (2^n)/f