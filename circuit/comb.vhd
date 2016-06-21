library ieee;
use ieee.std_logic_1164.all;

entity comb is
	port(
		q0 : in std_logic;
		q1 : in std_logic;
		q2 : in std_logic;
		s3 : out std_logic;
		s7 : out std_logic
	);
end comb;

architecture arch of comb is
begin
	s3 <= (not q2) and q1 and q0;
	s7 <= q2 and q1 and q0;
end arch;