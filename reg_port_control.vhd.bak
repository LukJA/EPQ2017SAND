/* reg_port_control .vhd */
/* A register clock controller, parametrically designed, with full external control */
/* designed for modular general use under the K1 standard */
/* (c) Luke Andrews 2017 */
/* All software is written under the MIT license */

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity R_P_control is 
	generic( 
		size: integer := 64;		-- selects the number of entries
		wide: integer := 8;			-- width of each entry
		adr_wide: integer := 6		-- address width
			);
	port(	addr_P1	: in std_logic_vector(adr_wide-1 downto 0) := (others => '0');
			clk_1 	: in std_logic := '0';
			addr_P2	: in std_logic_vector(adr_wide-1 downto 0) := (others => '0');
			clk_2		: in std_logic := '0';
			clkout	: out std_logic_vector(size-1 downto 0) := (others => '0')
			);
end R_P_control;

architecture behavioral of R_P_control is 
begin
	process(all) begin
		-- process to combine clock signals
		for i in 0 to size-1 loop
			-- if this registers address is selected and the corrosponding clock is pulsed
			if ((to_integer(unsigned(addr_P1)) = i) and (clk_P1)) or ((to_integer(unsigned(addr_P2)) = i) and to_bool(clk_P2)) then
				-- high the registers clock
				clocks(i) <= '1';
			else 
				clocks(i) <= '0';
			end if;		
		end loop;
	end process;
end behavioral;