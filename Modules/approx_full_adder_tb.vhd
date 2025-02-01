LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY tb_approx_full_adder IS
END tb_approx_full_adder;

ARCHITECTURE Behavioral OF tb_approx_full_adder IS
    SIGNAL A, B, Cin : STD_LOGIC;
    SIGNAL Sum, Cout : STD_LOGIC;
BEGIN
    uut : ENTITY work.approx_full_adder
        PORT MAP(
            A => A,
            B => B,
            Cin => Cin,
            Sum => Sum,
            Cout => Cout
        );

    PROCESS
    BEGIN
        -- Test case 1: A=0, B=0, Cin=0
        A <= '0';
        B <= '0';
        Cin <= '0';
        WAIT FOR 10 ns;
        ASSERT (Sum = '0' AND Cout = '0') REPORT "Test case 1 failed" SEVERITY error;

        -- Test case 2: A=0, B=1, Cin=0
        A <= '0';
        B <= '1';
        Cin <= '0';
        WAIT FOR 10 ns;
        ASSERT (Sum = '1' AND Cout = '0') REPORT "Test case 2 failed" SEVERITY error;

        -- Test case 3: A=1, B=1, Cin=0
        A <= '1';
        B <= '1';
        Cin <= '0';
        WAIT FOR 10 ns;
        ASSERT (Sum = '0' AND Cout = '1') REPORT "Test case 3 failed" SEVERITY error;

        -- Test case 4: A=1, B=1, Cin=1
        A <= '1';
        B <= '1';
        Cin <= '1';
        WAIT FOR 10 ns;
        ASSERT (Sum = '0' AND Cout = '1') REPORT "Test case 4 failed" SEVERITY error;

        -- Test case 5: A=0, B=0, Cin=1
        A <= '0';
        B <= '0';
        Cin <= '1';
        WAIT FOR 10 ns;
        ASSERT (Sum = '0' AND Cout = '0') REPORT "Test case 5 failed" SEVERITY error;

        -- Test case 6: A=1, B=0, Cin=1
        A <= '1';
        B <= '0';
        Cin <= '1';
        WAIT FOR 10 ns;
        ASSERT (Sum = '1' AND Cout = '0') REPORT "Test case 6 failed" SEVERITY error;

        WAIT;
    END PROCESS;
END Behavioral;