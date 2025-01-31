LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Multiplier_4x4_u_2x2 IS
    PORT (
        A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        P : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END Multiplier_4x4_u_2x2;

ARCHITECTURE Structural OF Multiplier_4x4_u_2x2 IS
    COMPONENT Multiplier_2x2 IS
        PORT (
            A : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            P : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT adder_8bit IS
        PORT (
            A, B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            Cin : IN STD_LOGIC;
            S : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            Cout : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL P0, P1, P2, P3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL P0_8bit, P1_8bit, P2_8bit, P3_8bit : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL sum1, sum2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL cout1, cout2, cout3 : STD_LOGIC;

BEGIN
    M1 : Multiplier_2x2 PORT MAP(A(1 DOWNTO 0), B(1 DOWNTO 0), P0);
    M2 : Multiplier_2x2 PORT MAP(A(1 DOWNTO 0), B(3 DOWNTO 2), P1);
    M3 : Multiplier_2x2 PORT MAP(A(3 DOWNTO 2), B(1 DOWNTO 0), P2);
    M4 : Multiplier_2x2 PORT MAP(A(3 DOWNTO 2), B(3 DOWNTO 2), P3);

    P0_8bit <= "0000" & P0;
    P1_8bit <= "00" & P1 & "00";
    P2_8bit <= "00" & P2 & "00";
    P3_8bit <= P3 & "0000";

    ADDER1 : adder_8bit PORT MAP(P0_8bit, P1_8bit, '0', sum1, cout1);
    ADDER2 : adder_8bit PORT MAP(sum1, P2_8bit, '0', sum2, cout2);
    ADDER3 : adder_8bit PORT MAP(sum2, P3_8bit, '0', P, cout3);
END Structural;