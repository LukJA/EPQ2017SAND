library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.global.all;

/* a memory based Peripheral Access Layer */
/* fixed precision */
/* provides an array of registers where each address features both an input and output register */

entity PAL is 
	port( clk: in std_logic := '0';
			Address: in std_logic_vector(15 downto 0) := (others => '0');
			DataIn: in std_logic_vector(7 downto 0) := (others => '0');
			DataOut: out std_logic_vector(7 downto 0) := (others => '0');
			
			strIN1, strIN2, strIN3, strIN4, strIN5 : in std_logic_vector(15 downto 0);
			strOUT1, strOUT2, strOUT3, strOUT4, strOUT5 : out std_logic_vector(15 downto 0)
			);
		
end PAL;

architecture versionone of PAL is 

	signal reg_clocks : array_p(9 downto 0)(0 downto 0);

	signal out_stream_raw : array_p(9 downto 0)(7 downto 0);
	signal in_stream_raw : array_p(9 downto 0)(7 downto 0);
	
	signal in_stream_reg : array_p(9 downto 0)(7 downto 0);

begin

	/* this version uses 10 addresses */
	
	/* create the onehot register mux */ 
	clockmux: entity work.demux generic map (10,1,16) port map ("1", Address, reg_clocks);
	
	/* outputting registers */
	GEN_REG_sOut: 
   for k in 0 to 9 generate
      REGX : work.DFF_Rising generic map (8) port map (reg_clocks(k)(0), DataIn, out_stream_raw(k));
   end generate GEN_REG_sOut;
	/* wire up the double width outputs */
	strOUT1 <= out_stream_raw(1) & out_stream_raw(0);
	strOUT2 <= out_stream_raw(3) & out_stream_raw(2);
	strOUT3 <= out_stream_raw(5) & out_stream_raw(4);
	strOUT4 <= out_stream_raw(7) & out_stream_raw(6);
	strOUT5 <= out_stream_raw(9) & out_stream_raw(8);
	
	/* inputting registers */
	/* input registers */
	GEN_REG_sIn: 
   for k in 0 to 9 generate
      REGX : work.DFF_Rising generic map (8) port map (clk, in_stream_raw(k), in_stream_reg(k));
   end generate GEN_REG_sIn;
	/* wire up the double width inputs */
	in_stream_raw(0) <= strIN1(7 downto 0);
	in_stream_raw(1) <= strIN1(15 downto 8);
	in_stream_raw(2) <= strIN2(7 downto 0);
	in_stream_raw(3) <= strIN2(15 downto 8);
	in_stream_raw(4) <= strIN3(7 downto 0);
	in_stream_raw(5) <= strIN3(15 downto 8);
	in_stream_raw(6) <= strIN4(7 downto 0);
	in_stream_raw(7) <= strIN4(15 downto 8);
	in_stream_raw(8) <= strIN5(7 downto 0);
	in_stream_raw(9) <= strIN5(15 downto 8);
	
	/* setup the selection mux for ths data */
	
	outputmux: entity work.mux generic map (10,8,16) port map (in_stream_reg, Address, DataOut);

end versionone;