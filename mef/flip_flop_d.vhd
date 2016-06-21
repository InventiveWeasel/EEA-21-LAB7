library ieee;
use ieee.std_logic_1164.all;

entity flip_flop_d is
port(
    clk	: in 	std_logic;
    rst : in 	std_logic;
    pre : in 	std_logic;
    ce  : in 	std_logic;
    d 	: in 	std_logic;
    q 	: out	std_logic);
end entity flip_flop_d;
 
architecture arch of flip_flop_d is
begin
	process (clk) is
	begin
		if rising_edge(clk) then  
			if (rst = '1') then   
				q <= '0';
			elsif (pre = '1') then
				q <= '1';
			elsif (ce = '1') then
				q <= d;
			end if;
		end if;
	end process;
end arch;

