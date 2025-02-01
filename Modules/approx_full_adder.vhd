LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY approx_full_adder IS
    PORT (
        A, B, Cin : IN STD_LOGIC;
        Sum, Cout : OUT STD_LOGIC
    );
END approx_full_adder;

ARCHITECTURE Behavioral OF approx_full_adder IS
BEGIN
    -- Approximate Sum (ignores Cin)
    Sum <= A XOR B;

    -- Approximate Carry-Out (ignores Cin)
    Cout <= A AND B; -- Simplified: Ignores (A XOR B) AND Cin
END Behavioral;