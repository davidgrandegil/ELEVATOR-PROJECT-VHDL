LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_motor_ascensor IS
END tb_motor_ascensor;
 
ARCHITECTURE behavior OF tb_motor_ascensor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT motor_ascensor
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         accionar_bajar : IN  std_logic;
         accionar_subir : IN  std_logic;
         motor_subir : OUT  std_logic;
         motor_bajar : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal accionar_bajar : std_logic := '0';
   signal accionar_subir : std_logic := '0';

 	--Outputs
   signal motor_subir : std_logic;
   signal motor_bajar : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: motor_ascensor PORT MAP (
          CLK => CLK,
          RST => RST,
          accionar_bajar => accionar_bajar,
          accionar_subir => accionar_subir,
          motor_subir => motor_subir,
          motor_bajar => motor_bajar
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		
		RST <= '0';
		WAIT FOR 2 ns;
		
      accionar_bajar <= '0';
		accionar_subir<= '0';
		WAIT FOR 5 ns;
		
		accionar_bajar <= '0';
		accionar_subir<= '1';
		WAIT FOR 5 ns;
		
		accionar_bajar <= '1';
		accionar_subir<= '0';
		WAIT FOR 5 ns;
		
		accionar_bajar <= '1';
		accionar_subir<= '1';
		WAIT FOR 5 ns;
		
		RST <= '1';
		WAIT FOR 3 ns;
		RST <= '0';
		WAIT FOR 2 ns;

		accionar_bajar <= '0';
		accionar_subir<= '0';
		WAIT FOR 5 ns;
		
		ASSERT false
			REPORT "Simulación finalizada. Test superado."
			SEVERITY FAILURE;
			
   end process;

END;
