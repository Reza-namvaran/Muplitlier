LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Multiplier_4x4_u_2x2_tb IS
END Multiplier_4x4_u_2x2_tb;

ARCHITECTURE behavior OF Multiplier_4x4_u_2x2_tb IS
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Multiplier_4x4_u_2x2
        PORT (
            A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            P : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    -- Signals to connect to UUT
    SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL B : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL P : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: Multiplier_4x4_u_2x2
        PORT MAP (
            A => A,
            B => B,
            P => P
        );

    -- Stimulus Process
    stim_proc: PROCESS
    BEGIN
        -- Test Case 1: A = 0001, B = 0011
        A <= "0001"; B <= "0011";
        WAIT FOR 10 ns;
        ASSERT (P = "00000110") REPORT "Test Case 1 Failed" SEVERITY ERROR;

        -- Test Case 2: A = 0010, B = 1011
        A <= "0010"; B <= "1011";
        WAIT FOR 10 ns;
        ASSERT (P = "00100011") REPORT "Test Case 2 Failed" SEVERITY ERROR;

        -- Test Case 3: A = 0000, B = 0000
        A <= "0000"; B <= "0000";
        WAIT FOR 10 ns;
        ASSERT (P = "00000000") REPORT "Test Case 3 Failed" SEVERITY ERROR;

        -- Test Case 4: A = 1111, B = 0001
        A <= "1111"; B <= "0001";
        WAIT FOR 10 ns;
        ASSERT (P = "11100001") REPORT "Test Case 4 Failed" SEVERITY ERROR;

        -- Test Case 5: A = 0100, B = 1000
        A <= "0100"; B <= "1000";
        WAIT FOR 10 ns;
        ASSERT (P = "01001000") REPORT "Test Case 5 Failed" SEVERITY ERROR;

        -- Test Case 6: A = 0001, B = 0001
        A <= "0001"; B <= "0001";
        WAIT FOR 10 ns;
        ASSERT (P = "00010000") REPORT "Test Case 6 Failed" SEVERITY ERROR;

        -- End simulation
        WAIT;
    END PROCESS;
END behavior;
