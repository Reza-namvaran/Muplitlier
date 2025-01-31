LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Adder_8Bit IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        Cin : IN STD_LOGIC;
        S : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        Cout : OUT STD_LOGIC
    );
END Adder_8Bit;

ARCHITECTURE Structural OF Adder_8Bit IS
    COMPONENT f_addr IS
        PORT (
            A, B, Cin : IN STD_LOGIC;
            S, Cout : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL carry : STD_LOGIC_VECTOR(8 DOWNTO 0);

BEGIN
    carry(0) <= Cin;
    GEN : FOR i IN 0 TO 7 GENERATE
        FA : f_addr PORT MAP(A(i), B(i), carry(i), S(i), carry(i + 1));
    END GENERATE;
    Cout <= carry(8);
END Structural;