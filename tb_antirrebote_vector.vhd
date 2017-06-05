LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_antirrebote_vector IS
END tb_antirrebote_vector;
 
ARCHITECTURE behavior OF tb_antirrebote_vector IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT antirrebote_vector
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         vector_IN : IN  std_logic_vector(2 downto 0);
         vector_OUT : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal vector_IN : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal vector_OUT : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: antirrebote_vector PORT MAP (
          CLK => CLK,
          RST => RST,
          vector_IN => vector_IN,
          vector_OUT => vector_OUT
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
	
	WAIT FOR 3 ns;
	RST <= '0';
	vector_IN <= "000";
	WAIT FOR 35 ns;
	RST <= '1';
	WAIT FOR 5 ns;
	vector_IN <= "100";
	WAIT FOR 15 ns;
	RST <= '0';
	WAIT FOR 55 ns;
	vector_IN <= "010";
	WAIT FOR 2 ns;
	vector_IN <= "101";
	WAIT FOR 50 ns;
	vector_IN <= "100";
	WAIT FOR 4 ns;
	vector_IN <= "110";
	WAIT FOR 2 ns;
	vector_IN <= "101";
	WAIT FOR 3 ns;
	vector_IN <= "010";
	WAIT FOR 20 ns;
	vector_IN <= "101";
	WAIT FOR 50 ns;
	ASSERT false
			REPORT "Simulación finalizada. Test superado."
			SEVERITY FAILURE;
			
   end process;

END;