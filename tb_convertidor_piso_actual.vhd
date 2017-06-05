LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_convertidor_piso_actual IS
END tb_convertidor_piso_actual;
 
ARCHITECTURE behavior OF tb_convertidor_piso_actual IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT convertidor_piso_actual
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         piso_actual : IN  std_logic_vector(2 downto 0);
         boton_seleccionado : IN  std_logic_vector(2 downto 0);
         piso_actual_convertido : OUT  std_logic_vector(1 downto 0);
         boton_seleccionado_convertido : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal piso_actual : std_logic_vector(2 downto 0) := (others => '0');
   signal boton_seleccionado : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal piso_actual_convertido : std_logic_vector(1 downto 0);
   signal boton_seleccionado_convertido : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: convertidor_piso_actual PORT MAP (
          clk => clk,
          rst => rst,
          piso_actual => piso_actual,
          boton_seleccionado => boton_seleccionado,
          piso_actual_convertido => piso_actual_convertido,
          boton_seleccionado_convertido => boton_seleccionado_convertido
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
	rst <= '0';
	boton_seleccionado <= "000";
	piso_actual <= "100";
	WAIT FOR 40 ns;
	boton_seleccionado <= "100";
	piso_actual <= "100";
	WAIT FOR 10 ns;
	RST <= '1';
	WAIT FOR 10 ns;
	RST <= '0';
	WAIT FOR 45 ns;
	boton_seleccionado <= "010";
	piso_actual  <= "010";
	WAIT FOR 2 ns;
	boton_seleccionado <= "101";
	piso_actual <= "011";
	WAIT FOR 50 ns;
	boton_seleccionado <= "100";
	piso_actual  <= "100";
	WAIT FOR 4 ns;
	boton_seleccionado <= "110";
	piso_actual  <= "010";
	WAIT FOR 2 ns;
	boton_seleccionado <= "101";
	piso_actual  <= "101";
	WAIT FOR 3 ns;
	boton_seleccionado <= "010";
	piso_actual  <= "100";
	WAIT FOR 20 ns;
	boton_seleccionado <= "110";
	piso_actual <= "010";
	WAIT FOR 80 ns;
	
	ASSERT false
			REPORT "Simulación finalizada. Test superado."
			SEVERITY FAILURE;
			
   end process;

END;