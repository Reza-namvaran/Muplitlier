LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY seven_seg_display IS 
	 PORT (
	 	CLK : IN STD_LOGIC;
	 	Reset : IN STD_LOGIC;
	 	Balance : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	 	Seg_a : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	 	Seg_b : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	   Anode_ctrl : OUT STD_LOGIC_VECTOR(1 DOWNTO 0) -- Anode control for displays
    );
END seven_seg_display;
