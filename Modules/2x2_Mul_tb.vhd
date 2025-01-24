LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY tb_Multiplier_2x2 IS
END tb_Multiplier_2x2;

ARCHITECTURE BEHAVIORAL OF tb_Multiplier_2x2 IS
    COMPONENT Multiplier_2x2
        PORT (
            A : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            P : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;

    SIGNAL A : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL B : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL P : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

    mul : Multiplier_2x2
    PORT MAP(
        A => A,
        B => B,
        P => P
    );

    PROCESS
    BEGIN
        -- Test case 1: 00 * 00 = 0000
        A <= "00";
        B <= "00";
        WAIT FOR 10 ns;

        -- Test case 2: 00 * 01 = 0000
        A <= "00";
        B <= "01";
        WAIT FOR 10 ns;

        -- Test case 3: 00 * 10 = 0000
        A <= "00";
        B <= "10";
        WAIT FOR 10 ns;

        -- Test case 4: 00 * 11 = 0000
        A <= "00";
        B <= "11";
        WAIT FOR 10 ns;

        -- Test case 5: 01 * 00 = 0000
        A <= "01";
        B <= "00";
        WAIT FOR 10 ns;

        -- Test case 6: 01 * 01 = 0001
        A <= "01";
        B <= "01";
        WAIT FOR 10 ns;

        -- Test case 7: 01 * 10 = 0010
        A <= "01";
        B <= "10";
        WAIT FOR 10 ns;

        -- Test case 8: 01 * 11 = 0011
        A <= "01";
        B <= "11";
        WAIT FOR 10 ns;

        -- Test case 9: 10 * 00 = 0000
        A <= "10";
        B <= "00";
        WAIT FOR 10 ns;

        -- Test case 10: 10 * 01 = 0010
        A <= "10";
        B <= "01";
        WAIT FOR 10 ns;

        -- Test case 11: 10 * 10 = 0100
        A <= "10";
        B <= "10";
        WAIT FOR 10 ns;

        -- Test case 12: 10 * 11 = 0110
        A <= "10";
        B <= "11";
        WAIT FOR 10 ns;

        -- Test case 13: 11 * 00 = 0000
        A <= "11";
        B <= "00";
        WAIT FOR 10 ns;

        -- Test case 14: 11 * 01 = 0011
        A <= "11";
        B <= "01";
        WAIT FOR 10 ns;

        -- Test case 15: 11 * 10 = 0110
        A <= "11";
        B <= "10";
        WAIT FOR 10 ns;

        -- Test case 16: 11 * 11 = 1001
        A <= "11";
        B <= "11";
        WAIT FOR 10 ns;

        WAIT;
    END PROCESS;

END BEHAVIORAL;