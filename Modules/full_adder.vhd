LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY f_addr IS
    PORT (
        A, B, Cin : IN STD_LOGIC;
        S, Cout : OUT STD_LOGIC
    );
END f_addr;

ARCHITECTURE Dataflow OF f_addr IS
BEGIN
    S <= A XOR B XOR Cin;
    Cout <= (A AND B) OR (A AND Cin) OR (B AND Cin);
END Dataflow;
