library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity antirrebote_vector is
    Port ( CLK : in  STD_LOGIC;
			  RST : in  STD_LOGIC;
           vector_IN : in  STD_LOGIC_VECTOR (2 downto 0);
           vector_OUT : out  STD_LOGIC_VECTOR(2 downto 0));
end antirrebote_vector;

architecture Dataflow of antirrebote_vector is

COMPONENT antirrebote
	PORT (
		CLK : in  STD_LOGIC;
		RST : in  STD_LOGIC;
      logic_IN : in  STD_LOGIC;
      logic_OUT : out  STD_LOGIC);
END COMPONENT;

begin

inst_antirrebote_1:antirrebote port map(
		CLK => CLK,
		RST => RST,
		logic_IN => vector_IN(0),
		logic_OUT => vector_OUT(0)
		);

inst_antirrebote_2:antirrebote port map(
		CLK => CLK,
		RST => RST,
		logic_IN => vector_IN(1),
		logic_OUT => vector_OUT(1)
		);
		
inst_antirrebote_3:antirrebote port map(
		CLK => CLK,
		RST => RST,
		logic_IN => vector_IN(2),
		logic_OUT => vector_OUT(2)
		);

end Dataflow;