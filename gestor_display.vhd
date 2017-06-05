library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity gestor_display is
    Port ( CLK : in  STD_LOGIC;
           piso_now : in  STD_LOGIC_VECTOR (1 downto 0);
           piso_obj : in  STD_LOGIC_VECTOR (1 downto 0);
			  piso_seleccionado : out STD_LOGIC_VECTOR (1 downto 0);
           piso_actual : out  STD_LOGIC_VECTOR (1 downto 0);
           accion : out  STD_LOGIC_VECTOR (1 downto 0)
			);
end gestor_display;

architecture Behavioral of gestor_display is 

signal piso_act:STD_LOGIC_VECTOR (1 downto 0);

begin

gestor_display:process(clk)
	begin
		if rising_edge(clk) then
		
			if (piso_now/="00") then
				piso_act <= piso_now;
			end if;
			
			piso_seleccionado <= piso_obj;
			piso_actual <= piso_act;
			
			if (piso_obj= "00") then
				accion <= "01";
			elsif (piso_act < piso_obj) then
				accion <= "11";
			elsif (piso_act > piso_obj) then
				accion <= "00";
			else
				accion <= "10";
			end if;
		end if;
	end process;

end Behavioral;