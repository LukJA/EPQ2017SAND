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
		dataOut			: out std_logic_vector(7 downto 0) := (others => '0');
		AddressIn		: in std_logic_vector(15 downto 0) := (others => '0');
		
		streamIn			: in std_logic_vector(7 downto 0) := (others => '0');
		streamOut		: out std_logic_vector(7 downto 0) := (others => '0');
		AddressOut		: out std_logic_vector(15 downto 0) := (others => '0');
		clkO				: out std_logic := '0'
	);

end expansionIF;

architecture func of expansionIF is

	signal bufferIn, bufferOut	: std_logic_vector(7 downto 0) := (others => '0');
	signal outClockEn	:	std_logic := '0';
	signal Addr_plus_one, AddressR : std_logic_vector(15 downto 0);

begin

	-- setup the offset output clock
	clkO <= (not Clock) and outClockEn;
	
	-- setup the address register combinationally
	addressStorage: entity work.DFF_rising generic map (16) port map (not((not addressData) and Clock and enable), AddressR, AddressOut);
	Addr_plus_one <= std_logic_vector(unsigned(AddressOut) + 1);
	
	-- connect buffer lines to memory bus
	streamOut <= bufferIn;
	bufferOut <= streamIn;

	-- enabling data paths
	process(enable) begin
		if enable = '0' then 
			-- ignore data paths
			dataOut <= dataIn;
		else 
			bufferIn <= dataIn;
			dataOut <= bufferOut;
		end if;
	end process;
	
	process(Clock)begin
		if rising_edge(Clock) then
		-- this is the clock edge where we control data
		if outClockEn = '1' then outClockEn <= '0'; end if;
		-- reset the address input
		AddressR <= (others => '0');
		if addressData = '1' then
			-- its data
			-- connect add one to address
			AddressR <= Addr_plus_one;
			
			if ReadWrite = '0' then 
				-- its write
				-- enable the clock
				outClockEn <= '1';
			end if;
		else 
			-- its address so conect in the address line
			AddressR <= AddressIn;
		end if;
		end if;
				
	end process;
	
	
end func;
	

