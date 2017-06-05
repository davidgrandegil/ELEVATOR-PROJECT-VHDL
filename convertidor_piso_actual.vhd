LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

entity convertidor_piso_actual is
	PORT(
		clk : in STD_LOGIC;
		rst : in  STD_LOGIC;
		piso_actual: IN std_logic_vector(2 DOWNTO 0);
		boton_seleccionado: IN std_logic_vector(2 DOWNTO 0);
		
		piso_actual_convertido: OUT std_logic_vector(1 DOWNTO 0);
		boton_seleccionado_convertido: OUT std_logic_vector(1 DOWNTO 0)
		);
end convertidor_piso_actual;

architecture dataflow of convertidor_piso_actual is

COMPONENT antirrebote_vector
	PORT (
		CLK : in  STD_LOGIC;
		RST : in  STD_LOGIC;
      vector_IN : in  STD_LOGIC_VECTOR (2 downto 0);
		vector_OUT : out  STD_LOGIC_VECTOR (2 downto 0));
 END COMPONENT;
 
 signal boton_selec_antirrebote:std_logic_vector(2 DOWNTO 0);

begin

inst_antirrebote_vector:antirrebote_vector port map(
		CLK => clk,
		RST => rst,
		vector_IN => boton_seleccionado,
		vector_OUT => boton_selec_antirrebote
		);
		
	WITH piso_actual SELECT
				piso_actual_convertido <=  "01" WHEN "001",
													"10" WHEN "010",
													"11" WHEN "100",
													"00" WHEN others;
	WITH boton_selec_antirrebote SELECT
				boton_seleccionado_convertido <= "01" WHEN "001",
															"10" WHEN "010",
															"11" WHEN "100",
															"00" WHEN others;
end dataflow;