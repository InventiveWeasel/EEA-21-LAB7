library ieee;
use ieee.std_logic_1164.all;

entity counter is
	port(
		clc : in std_logic;
		clk : in std_logic;
		q0 : out std_logic;
		q1 : out std_logic;
		q2 : out std_logic
	);
end counter;

architecture arch of counter is
	
--	component div_clock is
--		port(
--			clk_in 	: in 	std_logic;
--			clk_out	: out	std_logic
--		);
--	end component;
	
	component flip_flop_d is
		port(
			clk	: in 	std_logic;
			rst : in 	std_logic;
			pre : in 	std_logic;
			ce  : in 	std_logic;
			d 	: in 	std_logic;
			q 	: out	std_logic
		);
	end component;
	
	signal clkdiv : std_logic;
	signal d0, d1, d2 : std_logic;
	signal K0, K1, K2 : std_logic;
begin
q0 <= K0;
q1 <= K1;
q2 <= K2;
d0 <= (not K0) or clc;
d1 <= (K1 and (not K0) and (not clc)) or ((not K1) and K0 and (not clc));
d2 <= (K2 and (not K0) and (not clc)) or (K2 and (not K1) and (not clc)) or ((not K2) and K1 and K0 and (not clc));
--div : div_clock port map(clk, clkdiv);
ff0 : flip_flop_d port map(clk, '0', '0', '1', d0, K0);
ff1 : flip_flop_d port map(clk, '0', '0', '1', d1, K1);
ff2 : flip_flop_d port map(clk, '0', '0', '1', d2, K2);
end arch;