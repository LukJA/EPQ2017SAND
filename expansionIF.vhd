/* expansionIF .vhd */
/* A protoype expansion interface */
/* --designed for modular general use under the K1 standard */
/* (c) Luke Andrews 2017 */
/* All software is written under the MIT license */

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.global.all;

entity expansionIF is 

	port (
		Enable			: in std_logic := '0'; -- active high
		addressData		: in std_logic := '0'; -- 0 address, 1 data
		ReadWrite		: in std_logic := '0'; -- 0 Write, 1 read
		Clock				: in std_logic := '0'; 
		
		dataIn			: in std_logic_vector(7 downto 0) := (others => '0');
		dataOut			: out std_logic_vector(7 downto 0) := (others => '0')
	);

end expansionIF;

architecture func of expansionIF is

	signal bufferIn, bufferOut	: std_logic_vector(7 downto 0) := (others => '0');

begin

	process(enable) begin
		if enable = '0' then 
			dataOut <= dataIn;
		else 
			bufferIn <= dataIn;
			dataOut <= bufferOut;
		end if;
	end process;

end func;
	

