LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY tb_dec_flechas IS
END tb_dec_flechas;
 
ARCHITECTURE behavior OF tb_dec_flechas IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dec_flechas
    PORT(
         action : IN  std_logic_vector(1 downto 0);
         led_flechas : OUT  std_logic_vector(6 downto 0);
         flecha_ctrl : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal action : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal led_flechas : std_logic_vector(6 downto 0);
   signal flecha_ctrl : std_logic;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dec_flechas PORT MAP (
          action => action,
          led_flechas => led_flechas,
          flecha_ctrl => flecha_ctrl
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- insert stimulus here 
		action <= "00";
		WAIT FOR 20 ns;
		action <= "01";
		WAIT FOR 20 ns;
		action <= "10";
		WAIT FOR 20 ns;
		action <= "11";
		WAIT FOR 20 ns;
		action <= "01";
		WAIT FOR 20 ns;
		
		ASSERT false
			REPORT "Simulación finalizada. Test superado."
			SEVERITY FAILURE;
      wait;
   end process;

END;
