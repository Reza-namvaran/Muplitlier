LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Multiplier_1x1 IS
	PORT (
		A : IN STD_LOGIC;
		B : IN STD_LOGIC;
		P : OUT STD_LOGIC
	);
END ENTITY;

ARCHITECTURE BEHAVIORAL OF Multiplier_1x1 IS
BEGIN
	P <= A AND B;
END BEHAVIORAL;