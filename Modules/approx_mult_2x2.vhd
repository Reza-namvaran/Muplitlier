LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY approx_mult_2x2 IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        P : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END approx_mult_2x2;

ARCHITECTURE Behavioral OF approx_mult_2x2 IS
    SIGNAL A0B0, A1B0, A0B1, A1B1 : STD_LOGIC;
    SIGNAL sum_mid, carry_mid : STD_LOGIC;
BEGIN
    A0B0 <= A(0) AND B(0);
    A1B0 <= A(1) AND B(0);
    A0B1 <= A(0) AND B(1);
    A1B1 <= A(1) AND B(1);

    sum_mid <= A1B0 XOR A0B1;
    carry_mid <= A1B0 AND A0B1;

    P(0) <= A0B0;
    P(1) <= sum_mid;
    P(2) <= A1B1 XOR carry_mid;
    P(3) <= '0';
END Behavioral;