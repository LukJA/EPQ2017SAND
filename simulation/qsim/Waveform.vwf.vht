-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "01/24/2018 20:43:24"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          SANDBOX
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY SANDBOX_vhd_vec_tst IS
END SANDBOX_vhd_vec_tst;
ARCHITECTURE SANDBOX_arch OF SANDBOX_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL ALUO : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL ClockIn : STD_LOGIC;
COMPONENT SANDBOX
	PORT (
	ALUO : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	ClockIn : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : SANDBOX
	PORT MAP (
-- list connections between master ports and signals
	ALUO => ALUO,
	ClockIn => ClockIn
	);

-- ClockIn
t_prcs_ClockIn: PROCESS
BEGIN
LOOP
	ClockIn <= '0';
	WAIT FOR 25000 ps;
	ClockIn <= '1';
	WAIT FOR 25000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_ClockIn;
END SANDBOX_arch;
