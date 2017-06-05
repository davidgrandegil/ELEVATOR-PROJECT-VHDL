library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

entity dec_piso_seleccion is
    Port ( piso_code : in  STD_LOGIC_VECTOR (1 downto 0);
           piso0 : out  STD_LOGIC;
           piso1 : out  STD_LOGIC;
           piso2 : out  STD_LOGIC);
end entity dec_piso_seleccion;

architecture dataflow of dec_piso_seleccion is

begin

	WITH piso_code SELECT
				piso0 <= '1' WHEN "01",
							'0' WHEN others;
						
	WITH piso_code SELECT						
				piso1 <= '1' WHEN "10",
							'0' WHEN others;
						
	WITH piso_code SELECT						
				piso2 <= '1' WHEN "11",
							'0' WHEN others;

end architecture dataflow;