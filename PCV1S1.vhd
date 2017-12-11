/* PC_V1_S1 .vhd */
/* A Program Counter, parametrically designed, with full external control */
/* designed for modular general use under the K1 standard */
/* (c) Luke Andrews 2017 */
/* All software is written under the MIT license */

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity PCV1S1 is 
	generic( 
		bus_wid: integer := 1;	-- width
		edge: integer := 1 -- active edge (1 rising) (0 falling)
	);
	port (
		CLK			: in std_logic := '0';
		address_in	: in bus_wid := (others => '0');
		jump_enable	: in std_logic := '0';
		address_out	: out bus_wid := (others => '0')
	);
		
end PCV1S1;

architecture impl of PCV1S1 is

	signal Registers_D, Registers_Q : bus_wid := (others => '0');

begin 
	-- Main PC Register 16 bits wide
	PC_register_R: entity work.DFFQ generic map (bus_wid, edge) port map (CLK, Registers_D, Registers_Q); 

	-- increment/set logic
	process(all)begin
	
		if jump_enable = '1' then
			Reg_D <= address_in;
		else
			Reg_D <= std_logic_vector(unsigned(Registers_Q) + 1);
		end if;
		
	end process;
	
	-- point the output to the contents of the PC
	address_out <=  Registers_Q;
	
end impl;