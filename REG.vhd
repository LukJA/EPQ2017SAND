library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

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

entity DFFQ is
	generic( 
		n: integer := 1	-- width
		);
	port( clk: in std_logic := '0';
			D: in std_logic_vector(n-1 downto 0) := (others => '0');
			Q: out std_logic_vector(n-1 downto 0) := (others => '0');
			E: in std_logic := '1'
			);
end DFFQ;

architecture behavioral of DFFQ is 
begin
	process(clk) begin
		if (rising_edge(clk)) then -- clock rising edge
			if (E) then
				Q <= D;
			end if;
		elsif (falling_edge(clk)) then -- clock falling edge
			if (not E) then
				Q <= D;
			end if;
		end if;
	end process;
end behavioral;