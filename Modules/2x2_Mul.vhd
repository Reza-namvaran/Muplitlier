LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Multiplier_2x2 IS
    PORT (
        A : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        P : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END Multiplier_2x2;

ARCHITECTURE BEHAVIORAL OF Multiplier_2x2 IS
    SIGNAL p0, p1, p2, p3 : STD_LOGIC;
    SIGNAL sum1, carry1, sum2, carry2 : STD_LOGIC;

    COMPONENT f_addr IS
        PORT (
            A : IN STD_LOGIC;
            B : IN STD_LOGIC;
            Cin : IN STD_LOGIC;
            S : OUT STD_LOGIC;
            Cout : OUT STD_LOGIC);
    END COMPONENT;

BEGIN
    p0 <= A(0) AND B(0);
    p1 <= A(0) AND B(1);
    p2 <= A(1) AND B(0);
    p3 <= A(1) AND B(1);

    FA1 : f_addr PORT MAP(p1, p2, '0', sum1, carry1);

    FA2 : f_addr PORT MAP(carry1, p3, '0', sum2, carry2);

    P(0) <= p0;
    P(1) <= sum1;
    P(2) <= sum2;
    P(3) <= carry2;

END BEHAVIORAL;