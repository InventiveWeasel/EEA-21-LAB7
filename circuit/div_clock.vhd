library ieee;
use ieee.std_logic_1164.all;

entity div_clock is
port(
	clk_in 	: in 	std_logic;
    clk_out	: out	std_logic);
end div_clock;

architecture arch of div_clock is
	signal count : integer range 0 to 5 := 1;
	signal clk : std_logic := '0';
begin
	process(clk_in) 
	begin
		if(clk_in'event and clk_in='1') then
			count <= count + 1;
			if(count = 5) then
				clk <= not clk;
				count <= 1;
			end if;
		end if;
	end process;
	clk_out <= clk;
end arch;

