/* ALUV1S1_unsigned.vhd */
/* a first level fully parametric ALU */
/* designed for modular use within the K1 standard */
/* based on a standard OP code set for unsigned work */
/* (c) Luke Andrews 2017 */
/* All software is written under the MIT license */

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.global.all;

entity ALUV1S1_unsigned is 

	generic( 
		data_width: integer := 1;	-- q port width
		op_width: integer := 1;		-- opertaion port width
		active_v : std_logic := '1' -- what active level for the status IQ
	);
	
	port (	
		Q1, Q2	: in std_logic_vector(data_width-1 downto 0);	-- data ports input
		OP			: in std_logic_vector(op_width-1 downto 0);		-- operation port
		output	: out std_logic_vector(data_width-1 downto 0);	-- data ports output
		overflow : buffer std_logic;	-- overflow
		zero		: out std_logic;	-- Zero	
		EQ			: out std_logic;	-- Equal 
		Greater	: out std_logic	-- 1 Greater than 2
	);
		
end ALUV1S1_unsigned;

architecture behavioral of ALUV1S1_unsigned is

	signal overbus: std_logic_vector(data_width downto 0);

begin


	process(all) begin
		
		-- vector for calculations that overflow 
		overbus <= (others => '0');
		-- vector for overflowing value 
	
		case to_integer(unsigned(OP)) is
			when 0 =>
				-- Follow through operation (access to data bus from reg file)(default)
				output <= Q1;
				-- reset overfloe
				overflow <= '0';
				
			when 1 =>
				-- ADD operation
				overbus <= std_logic_vector(unsigned('0' & Q1) + unsigned('0' & Q2));
				output <= overbus(data_width-1 downto 0);
				overflow <= overbus(data_width);
				
			when 2 => 
				-- SUB operation
				if unsigned(Q1) < unsigned(Q2) then 
					overflow <= '1';
				end if;
				output <= std_logic_vector(unsigned(Q1) - unsigned(Q2));
				
			when 3 => 
				-- AND operation
				output <= Q1 and Q2;
				overflow <= '0';
				
			when 4 => 
				-- NOT operation
				output <= not Q1;
				overflow <= '0';
				
			when 5 => 
				-- XOR operation
				output <= Q1 xor Q2;
				overflow <= '0';
				
			when 6 => 
				-- OR operation
				output <= Q1 or Q2;
				overflow <= '0';
				
			when 7 => 
				-- INC operation
				output <= std_logic_vector(unsigned(Q1) + 1);
				overflow <= '0';
				
				
			when others => 
				-- Follow through operation (access to data bus from reg file)(default)
				output <= Q1;
		end case;
		
		if output = (others => '0') then 
			zero <= active_v;
		else 
			zero <= not active_v;
		end if;
		
		if Q1 = Q2 then
			EQ <= active_v;
		else
			EQ <= not active_v;
		end if;
		
	end process;
end behavioral;