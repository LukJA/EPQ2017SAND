library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.array_pack.all;

-- demux - spreads an input over a range of outputs
-- selectable sizes

entity demux is
	generic( 
		size: integer := 64;		-- selects the number of entries
		wide: integer := 8;			-- width of each entry
		adr_wide: integer := 6		-- address width
			);
	port(
		input  : in std_logic_vector(wide - 1 downto 0);		-- input data
		addr   : in std_logic_vector(adr_wide - 1 downto 0);	-- address to send it
		output : out array_p(size-1 downto 0)(wide-1 downto 0) := (others=> (others=>'0'))
		);
end demux;

architecture rtl of demux is	
begin	
	process(all)begin
		for i in 0 to (size - 1) loop
			-- go through each address
			if addr = (std_logic_vector(to_unsigned(i, adr_wide))) then
				output(i) <= input;
				--input;	-- if this one is selected set the output to this address
			else 
				output(i) <= (others => '0');
			end if;			
		end loop;	
	end process;	
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.array_pack.all;

-- stream mux - selects an output from a choice of inputs
-- selectable features

entity mux is
	generic( 
		size: integer := 64;	-- selects the numbers of entries
		wide: integer := 8;		-- selects the width of each entry
		adr_wide: integer := 6	-- width of the address line
			);
	port(
		input  : in array_p(size-1 downto 0)(wide-1 downto 0) := (others=> (others=>'0'));
		addr   : in std_logic_vector(adr_wide-1 downto 0);
		outputs : out std_logic_vector(wide-1 downto 0)
			);
end mux;

architecture rtl of mux is

begin

	process(all) begin
	
		outputs <= (others => '0');
		-- clean the output
		
		for i in 0 to size-1 loop
			-- if the address is matching, copy the output
			if addr = (std_logic_vector(to_unsigned(i, adr_wide))) then
				outputs <= input(i);
			end if;
			
			
		end loop;
		
	end process;
	
end rtl;