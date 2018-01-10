library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.global.all;

-- register file entity
-- 64 bit register file
-- 16 bt registers
entity register_file is
	generic(
		array_wid	: integer := 16;
		word_wid 	: integer := 8;
		active_edge	: std_logic := '1'
		);
		
	port (	
		
		-- direct access
		regQs	: out	array_p(array_wid-1 downto 0)(word_wid-1 downto 0) := (others=> (others=>'0'));
		regDs	: in 	array_p(array_wid-1 downto 0)(word_wid-1 downto 0) := (others=> (others=>'0'));
		regClock : in std_logic_vector(array_wid-1 downto 0)	
		
		);
end register_file;

-- functional implementation of file
architecture impl of register_file is
		
begin 	

	-- generates a bunch of registers - see names on rtl viewer
	GEN_REG: 
   for k in 0 to array_wid-1 generate
      REGX : work.DFFQ generic map (word_wid) port map (regClock(k), regDs(k), regQs(k), active_edge);
   end generate GEN_REG;
	
	
end impl;