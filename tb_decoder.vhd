LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY tb_decoder IS
END tb_decoder;
 
ARCHITECTURE behavior OF tb_decoder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoder
    PORT(
			CLK : IN std_logic;
			RST : IN std_logic;
			code : IN std_logic_vector(1 DOWNTO 0);
			action : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
			led : OUT std_logic_vector(6 DOWNTO 0);
			dig_ctrl : OUT  std_logic_vector(3 DOWNTO 0)
			);
    END COMPONENT;
    

   --Inputs
	signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal code : std_logic_vector(1 downto 0) := (others => '0');
	signal action: std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal led : std_logic_vector(6 downto 0);
   signal dig_ctrl : std_logic_vector(3 downto 0);
	
	constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoder PORT MAP (
			 CLK => CLK,
          RST => RST,
          code => code,
			 action => action,
          led => led,
          dig_ctrl => dig_ctrl
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
      -- insert stimulus here 
		RST <= '0';
		code <= "00";
		action <="00";
		WAIT FOR 20 ns;
		code <= "01";
		action <="01";
		WAIT FOR 20 ns;
		RST <= '1';
		code <= "10";
		action <="10";
		WAIT FOR 20 ns;
		code <= "11";
		action <="11";
		WAIT FOR 20 ns;
		RST <= '0';
		code <= "01";
		action <="01";
		WAIT FOR 20 ns;
		
		ASSERT false
			REPORT "Simulación finalizada. Test superado."
			SEVERITY FAILURE;
   end process;

END;