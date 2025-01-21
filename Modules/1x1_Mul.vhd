LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Multiplier_1x1 IS
	PORT (
		A : IN STD_LOGIC;
		B : IN STD_LOGIC;
		P : OUT STD_LOGIC
		-- DESCRIPTION: Product term
	);
END ENTITY;

ARCHITECTURE BEHAVIORAL OF Multiplier_1x1 IS
BEGIN
	-- 1x1 multiplier is just an AND gate
	P <= A AND B;

	-- Assertion for input validation
	ASSERT (A = '0' OR A = '1') AND (B = '0' OR B = '1')
		REPORT "Inputs must be either '0' or '1' for 1x1 multiplier" SEVERITY error;

	-- Assert to check the correctness of the output
	ASSERT (P = A * B)
		REPORT "Product does not match expected value" SEVERITY WARNING;
END BEHAVIORAL;
