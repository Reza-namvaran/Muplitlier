LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CLA_adder IS
    PORT (
        A, B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cin: IN STD_LOGIC;
        Sum: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cout: OUT STD_LOGIC
    );
END ENTITY; -- Carry Look Ahead adder

ARCHITECTURE BEHAVIORAL OF CLA_adder IS
    SIGNAL P, G : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL C : STD_LOGIC_VECTOR(4 downto 0);
BEGIN
    -- Propagate and Generate signals
    P_G_gen: FOR i IN 0 TO 3 GENERATE
        P(i) <= A(i) XOR B(i);
        G(i) <= A(i) AND B(i);
    END GENERATE;

    -- Carry computation
    C(0) <= Cin;
    C(1) <= G(0) OR (P(0) AND C(0));
    C(2) <= G(1) OR (P(1) AND G(0)) OR (P(1) AND P(0) AND C(0));
    C(3) <= G(2) OR (P(2) AND G(1)) OR (P(2) AND P(1) AND G(0)) OR (P(2) AND P(1) AND P(0) AND C(0));
    C(4) <= G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR
            (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND C(0));

    -- Sum computation
    Sum_gen: for i in 0 to 3 generate
        Sum(i) <= P(i) XOR C(i);
    end generate;

    Cout <= C(4);

END BEHAVIORAL;