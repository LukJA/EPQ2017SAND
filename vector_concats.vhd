/* vector concat procedure */
/* explicity generates concanteneated vector (&) */

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.global.all;

entity vec_concat is

	generic (	
		high_wid		: integer := 8;
		loww_wid		: integer := 8
		);
		
	port(	
		high_word	:	in std_logic_vector(high_wid-1 downto 0);
		loww_word	:	in std_logic_vector(loww_wid-1 downto 0);
		concat		:	out std_logic_vector((high_wid + loww_wid)-1 downto 0)
		);
		
end vec_concat;

architecture impl of vec_concat is

begin

	concat(loww_wid-1 downto 0) <= (loww_word);
	concat((high_wid+loww_wid)-1 downto loww_wid) <= high_word;
	

end impl;