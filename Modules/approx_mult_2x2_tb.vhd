LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY tb_approx_mult_2x2 IS
END tb_approx_mult_2x2;

ARCHITECTURE Behavioral OF tb_approx_mult_2x2 IS
    SIGNAL A, B : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL P : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
    uut : ENTITY work.approx_mult_2x2
        PORT MAP(
            A => A,
            B => B,
            P => P
        );

    PROCESS
    BEGIN
        -- Test case 1: A=00, B=00
        A <= "00";
        B <= "00";
        WAIT FOR 10 ns;
        ASSERT (P = "0000") REPORT "Test case 1 failed" SEVERITY error;

        -- Test case 2: A=01, B=01
        A <= "01";
        B <= "01";
        WAIT FOR 10 ns;
        ASSERT (P = "0001") REPORT "Test case 2 failed" SEVERITY error;

        -- Test case 3: A=10, B=10
        A <= "10";
        B <= "10";
        WAIT FOR 10 ns;
        ASSERT (P = "0100") REPORT "Test case 3 failed" SEVERITY error;

        -- Test case 4: A=11, B=11
        A <= "11";
        B <= "11";
        WAIT FOR 10 ns;
        ASSERT (P = "0001") REPORT "Test case 4 failed" SEVERITY error;

        -- Test case 5: A=01, B=10
        A <= "01";
        B <= "10";
        WAIT FOR 10 ns;
        ASSERT (P = "0010") REPORT "Test case 5 failed" SEVERITY error;

        -- Test case 6: A=11, B=01
        A <= "11";
        B <= "01";
        WAIT FOR 10 ns;
        ASSERT (P = "0011") REPORT "Test case 6 failed" SEVERITY error;

        WAIT;
    END PROCESS;
END Behavioral;