library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

entity FSM is
	PORT(
	 clock,reset,nivel, abierto, cerrado:  IN std_logic;
	 piso,boton: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
	 boton_memoria: out STD_LOGIC_VECTOR (1 DOWNTO 0);
	 accionador_puerta: out STD_LOGIC;
	 accionador_subir, accionador_bajar: out STD_LOGIC
	 );
end FSM;

architecture Behavioral of FSM is

	TYPE estado IS (inicial,parado,cerrando,marcha,abriendo);
   SIGNAL presente: estado:=inicial;
   SIGNAL bot: std_logic_vector(1 DOWNTO 0); -- Almacena botón pulsado      
   SIGNAL piso_ini: std_logic_vector(1 DOWNTO 0);   -- Piso de partida
	
begin

estados:
PROCESS(reset,clock)
	BEGIN
		IF reset='1' THEN presente<=inicial;
		ELSIF clock='1' AND clock'event THEN
			CASE presente IS
				WHEN inicial=>   -- Estado inicial para que se nivele
					IF nivel='1' then presente<=parado;
					END IF;
				WHEN parado=>    -- Espera la pulsación de un botón
					IF (bot/="00") AND (bot/=piso) THEN presente<=cerrando;
					END IF;
				WHEN cerrando=>  -- Cierra la puerta
					IF cerrado='1' THEN presente<=marcha;
					END IF;
				WHEN marcha=>    -- Lleva el ascensor a su piso
					IF (bot=piso) AND (nivel='1') THEN presente<=abriendo;
					END IF;                                              
				WHEN abriendo=>  -- Abre las puertas
					IF abierto='1' THEN presente<=parado;
					END IF;
			END CASE;
		END IF;
	END PROCESS estados;
	
	
salida:
PROCESS(clock)
BEGIN	
	if rising_edge(clock) then
		boton_memoria<=bot;
		CASE presente IS
		WHEN inicial=>   -- Al encender puede que este entre dos pisos
			IF piso/="01" THEN
					accionador_subir<='0';  -- Bajamos
					accionador_bajar<='1';
			END IF;
			accionador_puerta<='0';     -- Cerrada
		  
		WHEN parado=>
			accionador_subir<='0';  -- Parado
			accionador_bajar<='0';
			accionador_puerta<='1'; -- Abierta
		  
		WHEN cerrando=>
			accionador_subir<='0';  -- Parado
			accionador_bajar<='0';
			accionador_puerta<='0';              
		  		  
		WHEN marcha=>
			IF bot<piso_ini THEN
					accionador_subir<='0';  -- Bajamos
					accionador_bajar<='1';
			ELSE
					accionador_subir<='1';  -- Subimos
					accionador_bajar<='0';
			END IF;
			accionador_puerta<='0';     -- Cerrada
		  
		WHEN abriendo=>
			accionador_subir<='0';  -- Parado
			accionador_bajar<='0';
			accionador_puerta<='1'; -- Abrir
		END CASE;
	end if;
END PROCESS salida; 
		  
memoria:
PROCESS(reset,clock,piso)   -- Captura la pulsación del botón
BEGIN                -- y el piso donde se encuentra
   IF reset='1' THEN
     bot<="00";
     piso_ini<=piso;
   ELSIF clock='1' AND clock'event THEN
     IF presente=parado THEN
       IF (boton="01") OR (boton="10") OR (boton="11") THEN bot<=boton;
       ELSE bot<="00";  -- Cualquier otra combinación no vale
       END IF;
       piso_ini<=piso;
     END IF;
   END IF;
END PROCESS memoria;

end Behavioral;