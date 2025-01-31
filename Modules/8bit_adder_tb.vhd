LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Adder_8Bit_tb IS
END Adder_8Bit_tb;

ARCHITECTURE Behavioral OF Adder_8Bit_tb IS

    COMPONENT Adder_8Bit
        PORT (
            A, B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            Cin : IN STD_LOGIC;
            S : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            Cout : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL A, B : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Cin : STD_LOGIC;
    SIGNAL S : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Cout : STD_LOGIC;

BEGIN

    U : Adder_8Bit PORT MAP(
        A => A,
        B => B,
        Cin => Cin,
        S => S,
        Cout => Cout
    );

    PROCESS
    BEGIN
        -- Test case 1:
        A <= "00000000";
        B <= "00000000";
        Cin <= '0';
        WAIT FOR 10 ns;
        ASSERT S = "00000000" AND Cout = '0' REPORT "Test case 1 failed" SEVERITY ERROR;

        -- Test case 2: 
        A <= "00000000";
        B <= "00000000";
        Cin <= '1';
        WAIT FOR 10 ns;
        ASSERT S = "00000001" AND Cout = '0' REPORT "Test case 2 failed" SEVERITY ERROR;

        -- Test case 3: 
        A <= "11111111";
        B <= "00000001";
        Cin <= '0';
        WAIT FOR 10 ns;
        ASSERT S = "00000000" AND Cout = '1' REPORT "Test case 3 failed" SEVERITY ERROR;

        -- Test case 4: 
        A <= "01010101";
        B <= "10101010";
        Cin <= '0';
        WAIT FOR 10 ns;
        ASSERT S = "11111111" AND Cout = '0' REPORT "Test case 4 failed" SEVERITY ERROR;

        -- Test case 5: 
        A <= "01010101";
        B <= "10101010";
        Cin <= '1';
        WAIT FOR 10 ns;
        ASSERT S = "00000000" AND Cout = '1' REPORT "Test case 5 failed" SEVERITY ERROR;

        -- Test case 6: 
        A <= "11111111";
        B <= "11111111";
        Cin <= '0';
        WAIT FOR 10 ns;
        ASSERT S = "11111110" AND Cout = '1' REPORT "Test case 6 failed" SEVERITY ERROR;

        -- Test case 7:
        A <= "11111111";
        B <= "11111111";
        Cin <= '1';
        WAIT FOR 10 ns;
        ASSERT S = "11111111" AND Cout = '1' REPORT "Test case 7 failed" SEVERITY ERROR;

        -- Test case 8: 
        A <= "00110011";
        B <= "11001100";
        Cin <= '0';
        WAIT FOR 10 ns;
        ASSERT S = "11111111" AND Cout = '0' REPORT "Test case 8 failed" SEVERITY ERROR;

        -- Test case 9: 
        A <= "00110011";
        B <= "11001100";
        Cin <= '1';
        WAIT FOR 10 ns;
        ASSERT S = "00000000" AND Cout = '1' REPORT "Test case 9 failed" SEVERITY ERROR;

        WAIT;
    END PROCESS;
END Behavioral;