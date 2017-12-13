/* this file hold useful vector and array functions such as bus oring, anding etc */

/* some types have to be implemeted for the array functionality */
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
package array_pack is
  type array_p is array (natural range <>) of std_logic_vector;
end package;


/* array or procedure */
/* explicity generates a whole bunch of or gates */
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.array_pack.all;

entity array_or is

	generic (	
		array_wid 	: integer := 32;
		word_wid		: integer := 16
		);
		
	port(	
		output: out array_p(array_wid-1 downto 0)(word_wid-1 downto 0) := (others=> (others=>'0'));
		inOne	: in 	array_p(array_wid-1 downto 0)(word_wid-1 downto 0) := (others=> (others=>'0'));
		inTwo	: in 	array_p(array_wid-1 downto 0)(word_wid-1 downto 0) := (others=> (others=>'0'))
		);
		
end array_or;

architecture behavioral of array_or is 
begin
	process(all) begin

		-- process to combine arrays on input 
		for j in 0 to array_wid-1 loop
			output(j) <= inOne(j) or inTwo(j);
		end loop;
		
	end process;
end behavioral;


/* vector or procedure */ 
/* explicity generates a bunch or or gates */
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity vector_or is
 
	generic( 
		n: integer := 1
		);
		
	port(	
		output	: out std_logic_vector(n-1 downto 0) := (others => '0');
		inOne 	: in std_logic_vector(n-1 downto 0) := (others => '0');
		inTwo		: in std_logic_vector(n-1 downto 0) := (others => '0')
		);
end vector_or;

architecture behavioral of vector_or is 
begin
	process(all) begin

		-- process to combine arrays on input 
		for j in 0 to n-1 loop
			output(j) <= inOne(j) or inTwo(j);
		end loop;
		
	end process;
end behavioral;

/* array and procedure */
/* explicity generates a whole bunch of or gates */
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.array_pack.all;

entity array_and is

	generic (	
		array_wid 	: integer := 32;
		word_wid		: integer := 16
		);
		
	port(	
		output: out array_p(array_wid-1 downto 0)(word_wid-1 downto 0) := (others=> (others=>'0'));
		inOne	: in 	array_p(array_wid-1 downto 0)(word_wid-1 downto 0) := (others=> (others=>'0'));
		inTwo	: in 	array_p(array_wid-1 downto 0)(word_wid-1 downto 0) := (others=> (others=>'0'))
		);
		
end array_and;

architecture behavioral of array_and is 
begin
	process(all) begin

		-- process to combine arrays on input 
		for j in 0 to array_wid-1 loop
			output(j) <= inOne(j) and inTwo(j);
		end loop;
		
	end process;
end behavioral;


/* vector and procedure */ 
/* explicity generates a bunch or or gates */
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity vector_and is
 
	generic( 
		n: integer := 1
		);
		
	port(	
		output	: out std_logic_vector(n-1 downto 0) := (others => '0');
		inOne 	: in std_logic_vector(n-1 downto 0) := (others => '0');
		inTwo		: in std_logic_vector(n-1 downto 0) := (others => '0')
		);
end vector_and;

architecture behavioral of vector_and is 
begin
	process(all) begin

		-- process to combine arrays on input 
		for j in 0 to n-1 loop
			output(j) <= inOne(j) and inTwo(j);
		end loop;
		
	end process;
end behavioral;
	
	