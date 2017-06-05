LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_dec_piso_seleccion IS
END tb_dec_piso_seleccion;
 
ARCHITECTURE behavior OF tb_dec_piso_seleccion IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dec_piso_seleccion
    PORT(
         piso_code : IN  std_logic_vector(1 downto 0);
         piso0 : OUT  std_logic;
         piso1 : OUT  std_logic;
         piso2 : OUT  std_logic
         );
    END COMPONENT;
    

   --Inputs
   signal piso_code : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal piso0 : std_logic;
   signal piso1 : std_logic;
   signal piso2 : std_logic;
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dec_piso_seleccion PORT MAP (
          piso_code => piso_code,
          piso0 => piso0,
          piso1 => piso1,
          piso2 => piso2
         );

   -- Stimulus process
   stim_proc: process
   begin	
	
		piso_code <= "01";
		WAIT FOR 20 ns;
		piso_code <= "10";
		WAIT FOR 20 ns;
		piso_code <= "11";
		WAIT FOR 20 ns;
		piso_code <= "00";
		WAIT FOR 20 ns;
				
		ASSERT false
			REPORT "Simulación finalizada. Test superado."
			SEVERITY FAILURE;
			
   end process;

END;