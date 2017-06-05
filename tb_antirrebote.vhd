LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_antirrebote IS
END tb_antirrebote;
 
ARCHITECTURE behavior OF tb_antirrebote IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT antirrebote
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         logic_IN : IN  std_logic;
         logic_OUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal logic_IN : std_logic := '0';

 	--Outputs
   signal logic_OUT : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: antirrebote PORT MAP (
          CLK => CLK,
          RST => RST,
          logic_IN => logic_IN,
          logic_OUT => logic_OUT
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
	logic_IN <= '0';
	WAIT FOR 40 ns;
	logic_IN <= '1';
	WAIT FOR 10 ns;
	RST <= '1';
	WAIT FOR 10 ns;
	logic_IN <= '0';
	WAIT FOR 2 ns;
	logic_IN <= '1';
	WAIT FOR 3 ns;
	RST <= '0';
	WAIT FOR 47 ns;
	logic_IN <= '0';
	WAIT FOR 4 ns;
	logic_IN <= '1';
	WAIT FOR 2 ns;
	logic_IN <= '0';
	WAIT FOR 3 ns;
	logic_IN <= '1';
	WAIT FOR 20 ns;
	logic_IN <= '0';
	WAIT FOR 50 ns;
	ASSERT false
			REPORT "Simulación finalizada. Test superado."
			SEVERITY FAILURE;
			
   end process;

END;
