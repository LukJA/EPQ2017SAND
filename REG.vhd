library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.core_pack.all;

entity DFF_Rising is 
	generic( n: integer := 1);	-- width
	port( clk: in std_logic := '0';
			D: in std_logic_vector(n-1 downto 0) := (others => '0');
			Q: out std_logic_vector(n-1 downto 0) := (others => '0')
			);
end DFF_Rising;

architecture behavioral of DFF_Rising is 
begin
	process(clk) begin
		if rising_edge(clk) then -- clock rising edge
			Q <= D;
		end if;
	end process;
end behavioral;

-- register generation -- falling edge
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.core_pack.all;

entity DFF_Falling is 
	generic( n: integer := 1);	-- width
	port( clk: in std_logic := '0';
			D: in std_logic_vector(n-1 downto 0) := (others => '0');
			Q: out std_logic_vector(n-1 downto 0) := (others => '0')
			);
end DFF_Falling;

architecture behavioral of DFF_Falling is 
begin
	process(clk) begin
		if falling_edge(clk) then -- clock falling edge
			Q <= D;
		end if;
	end process;
end behavioral;

/* DFF both */

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.core_pack.all;

entity DFFQ is
	generic( 
		n: integer := 1;	-- width
		e: integer := 1 -- edge
		);
	port( clk: in std_logic := '0';
			D: in std_logic_vector(n-1 downto 0) := (others => '0');
			Q: out std_logic_vector(n-1 downto 0) := (others => '0')
			);
end DFFQ;

architecture behavioral of DFFQ is 
begin
	process(clk) begin
		if (rising_edge(clk) and e) then -- clock rising edge
			Q <= D;
		elsif (falling_edge(clk) and (not e)) then -- clock falling edge
			Q <= D;
		end if;
	end process;
end behavioral;