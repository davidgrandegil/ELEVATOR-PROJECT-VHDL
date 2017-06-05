
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY tb_divisorfrec IS
END tb_divisorfrec;
 
ARCHITECTURE behavior OF tb_divisorfrec IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT divisorfrec
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         salida : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal salida : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: divisorfrec PORT MAP (
          clk => clk,
          reset => reset,
          salida => salida
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
      -- insert stimulus here 
		wait for 50 ns;				--FUNCIONA PERO LA SIMULACION NO SE MANTIENE
		reset <= '1';					--EL TIEMPO NECESARIO. CAMBIAR FRECUENCIA DEL
		wait for 95 ns;				--DIVISOR PARA COMPROBAR.
		reset <= '0';
		wait for 110 ns;
		reset <= '1';
		wait for 25 ns;
		reset <= '0';
		wait;
   end process;

END;
