LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY f_addr_tb IS
END f_addr_tb;

ARCHITECTURE Behavioral OF f_addr_tb IS

    COMPONENT f_addr
        PORT (
            A, B, Cin : IN STD_LOGIC;
            S, Cout : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL A, B, Cin : STD_LOGIC;
    SIGNAL S, Cout : STD_LOGIC;

BEGIN

    U : f_addr PORT MAP(
        A => A,
        B => B,
        Cin => Cin,
        S => S,
        Cout => Cout
    );

    PROCESS
    BEGIN

        A <= '0';
        B <= '0';
        Cin <= '0';
        WAIT FOR 10 ns;
        A <= '0';
        B <= '0';
        Cin <= '1';
        WAIT FOR 10 ns;
        A <= '0';
        B <= '1';
        Cin <= '0';
        WAIT FOR 10 ns;
        A <= '0';
        B <= '1';
        Cin <= '1';
        WAIT FOR 10 ns;
        A <= '1';
        B <= '0';
        Cin <= '0';
        WAIT FOR 10 ns;
        A <= '1';
        B <= '0';
        Cin <= '1';
        WAIT FOR 10 ns;
        A <= '1';
        B <= '1';
        Cin <= '0';
        WAIT FOR 10 ns;
        A <= '1';
        B <= '1';
        Cin <= '1';
        WAIT FOR 10 ns;

        WAIT;
    END PROCESS;
END Behavioral;