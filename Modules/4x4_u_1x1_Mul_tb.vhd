LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL; -- For numeric conversions

ENTITY tb_Multiplier_4x4 IS
END tb_Multiplier_4x4;

ARCHITECTURE Behavioral OF tb_Multiplier_4x4 IS
    COMPONENT Multiplier_4x4
        PORT (
            A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            P : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL A_tb, B_tb : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL P_tb : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL P_expected : INTEGER;

BEGIN
    UUT: Multiplier_4x4 PORT MAP (
        A => A_tb,
        B => B_tb,
        P => P_tb
    );

    STIMULUS: PROCESS
    BEGIN
        -- Test Case 1: 0 * 0
        A_tb <= "0000";
        B_tb <= "0000";
        WAIT FOR 10 ns;
        ASSERT P_tb = "00000000" REPORT "0*0 Error" SEVERITY ERROR;

        -- Test Case 2: 15 * 15 = 225
        A_tb <= "1111";
        B_tb <= "1111";
        WAIT FOR 10 ns;
        ASSERT P_tb = "11100001" REPORT "15*15 Error" SEVERITY ERROR;

        -- Test Case 3: 5 * 5 = 25
        A_tb <= "0101";
        B_tb <= "0101";
        WAIT FOR 10 ns;
        ASSERT P_tb = "00011001" REPORT "5*5 Error" SEVERITY ERROR;

        -- Test Case 4: 10 * 5 = 50
        A_tb <= "1010";
        B_tb <= "0101";
        WAIT FOR 10 ns;
        ASSERT P_tb = "00110010" REPORT "10*5 Error" SEVERITY ERROR;

        -- Test Case 5: 7 * 3 = 21
        A_tb <= "0111";
        B_tb <= "0011";
        WAIT FOR 10 ns;
        ASSERT P_tb = "00010101" REPORT "7*3 Error" SEVERITY ERROR;

        -- Test Case 6: Random check 12 * 4 = 48
        A_tb <= "1100";
        B_tb <= "0100";
        WAIT FOR 10 ns;
        ASSERT P_tb = "00110000" REPORT "12*4 Error" SEVERITY ERROR;

        -- Automatic check for all combinations
        FOR i IN 0 TO 15 LOOP
            FOR j IN 0 TO 15 LOOP
                A_tb <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, 4));
                B_tb <= STD_LOGIC_VECTOR(TO_UNSIGNED(j, 4));
                P_expected <= i * j;
                WAIT FOR 10 ns;
                ASSERT UNSIGNED(P_tb) = TO_UNSIGNED(P_expected, 8)
                    REPORT "Mismatch at " & INTEGER'IMAGE(i) & "*" & INTEGER'IMAGE(j)
                    SEVERITY WARNING;
            END LOOP;
        END LOOP;

        REPORT "Simulation completed";
        WAIT;
    END PROCESS;
END Behavioral;