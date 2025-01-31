LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY tb_Multiplier_4x4_u_2x2 IS
END tb_Multiplier_4x4_u_2x2;

ARCHITECTURE behavior OF tb_Multiplier_4x4_u_2x2 IS
    COMPONENT Multiplier_4x4_u_2x2
        PORT (
            A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            P : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL A, B : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL P : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN
    uut : Multiplier_4x4_u_2x2 PORT MAP(A, B, P);

    s : PROCESS
    BEGIN
        -- Test cases
        A <= "0000";
        B <= "0000";
        WAIT FOR 100 ns;
        ASSERT P = "00000000" REPORT "0*0 Error" SEVERITY ERROR;

        A <= "0011";
        B <= "0010";
        WAIT FOR 100 ns;
        ASSERT P = "00000110" REPORT "3*2 Error" SEVERITY ERROR;

        A <= "1111";
        B <= "1111";
        WAIT FOR 100 ns;
        ASSERT P = "11100001" REPORT "15*15 Error" SEVERITY ERROR;

        A <= "0101";
        B <= "0111";
        WAIT FOR 100 ns;
        ASSERT P = "00100011" REPORT "5*7 Error" SEVERITY ERROR;

        A <= "0100";
        B <= "0100";
        WAIT FOR 100 ns;
        ASSERT P = "00010000" REPORT "4*4 Error" SEVERITY ERROR;

        WAIT;
    END PROCESS;
END behavior;