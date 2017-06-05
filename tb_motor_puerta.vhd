--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_motor_puerta IS
END tb_motor_puerta;
 
ARCHITECTURE behavior OF tb_motor_puerta IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT motor_puerta
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         nivel : IN  std_logic;
         celula : IN  std_logic;
         accionar_puerta : IN  std_logic;
         actuador_puerta : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal nivel : std_logic := '0';
   signal celula : std_logic := '0';
   signal accionar_puerta : std_logic := '0';

 	--Outputs
   signal actuador_puerta : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: motor_puerta PORT MAP (
          CLK => CLK,
          RST => RST,
          nivel => nivel,
          celula => celula,
          accionar_puerta => accionar_puerta,
          actuador_puerta => actuador_puerta
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
      celula <= '0';
		WAIT FOR 3 ns;
		accionar_puerta <= '0';
		WAIT FOR 20 ns;
		celula <= '0';
		WAIT FOR 5 ns;
		accionar_puerta <= '1';
		WAIT FOR 10 ns;
		RST <= '1';
		WAIT FOR 5 ns;
		RST <= '0';
		WAIT FOR 5 ns;
		celula <= '1';
		WAIT FOR 5 ns;
		accionar_puerta <= '1';
		WAIT FOR 20 ns;
		celula <= '1';
		WAIT FOR 5 ns;
		accionar_puerta <= '0';
		WAIT FOR 10 ns;
		nivel <= '1';
		WAIT FOR 10 ns;
		celula <= '0';
		WAIT FOR 5 ns;
		accionar_puerta <= '0';
		WAIT FOR 5 ns;
		nivel <= '0';
		WAIT FOR 15 ns;
		
		ASSERT false
			REPORT "Simulacion finalizada. Test superado."
			SEVERITY FAILURE;
	
   end process;

END;
