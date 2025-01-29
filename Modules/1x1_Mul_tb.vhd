LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY tb_Multiplier_1x1 IS
END ENTITY;

ARCHITECTURE BEHAVIORAL OF tb_Multiplier_1x1 IS
    COMPONENT Multiplier_1x1
        PORT (
            A : IN STD_LOGIC;
            B : IN STD_LOGIC;
            P : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL in_A, in_B : STD_LOGIC := '0';
    SIGNAL out_P : STD_LOGIC;

    CONSTANT time_interval : TIME := 10 ns;
BEGIN
    UUT : Multiplier_1x1 PORT MAP(
        A => in_A,
        B => in_B,
        P => out_P
    );

    mul_proc : PROCESS
    BEGIN
        in_A <= '0';
        in_B <= '0';
        WAIT FOR time_interval;
        ASSERT out_P = '0' REPORT "0 * 0 failed" SEVERITY error;

        in_B <= NOT in_B;
        WAIT FOR time_interval;
        ASSERT out_P = '0' REPORT "0 * 1 failed" SEVERITY error;

        in_A <= NOT in_A;
        in_B <= NOT in_B;
        WAIT FOR time_interval;
        ASSERT out_P = '0' REPORT "1 * 0 failed" SEVERITY error;

        in_B <= NOT in_B;
        WAIT FOR time_interval;
        ASSERT out_P = '1' REPORT "1 * 1 failed" SEVERITY error;
        REPORT "All tests completed successfully";
        WAIT;
    END PROCESS;
END BEHAVIORAL;