LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY tb_CLA_adder IS
END ENTITY;

ARCHITECTURE BEHAVIORAL OF tb_CLA_adder IS
    COMPONENT CLA_adder
        PORT (
            A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            Cin : IN STD_LOGIC;
            Sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            Cout : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL in_A, in_B : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL in_Cin : STD_LOGIC := '0';
    SIGNAL out_Sum : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL out_Cout : STD_LOGIC;

    -- DESCRIPTION: Function to find the expected values for test cases
FUNCTION expected_sum (
    p_A : STD_LOGIC_VECTOR(3 DOWNTO 0);
    p_B : STD_LOGIC_VECTOR(3 DOWNTO 0);
    p_Cin : STD_LOGIC_VECTOR(1 DOWNTO 0)
) RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : INTEGER;
BEGIN
    result := to_integer(unsigned(p_A)) + to_integer(unsigned(p_B)) + to_integer(unsigned("0" & p_Cin));
    RETURN STD_LOGIC_VECTOR(to_unsigned(result, 5));
END FUNCTION;
BEGIN
    DUT : CLA_adder PORT MAP(A => in_A, B => in_B, Cin => in_Cin, Sum => out_Sum, Cout => out_Cout);

    PROCESS
        VARIABLE expected : STD_LOGIC_VECTOR(4 DOWNTO 0);
    BEGIN
        -- Test Case 1: Basic addition (0 + 0 + 0)
        in_A <= "0000";
        in_B <= "0000";
        in_Cin <= '0';
        WAIT FOR 10 ns;
        expected := expected_sum(in_A, in_B, ("0" & in_Cin));
        ASSERT (out_Cout & out_Sum = expected)
        REPORT "TC1 Failed"
            SEVERITY error;

        -- Test Case 2: Carry-in test (0 + 0 + 1)
        in_A <= "0000";
        in_B <= "0000";
        in_Cin <= '1';
        WAIT FOR 10 ns;
        expected := expected_sum(in_A, in_B, ("0" & in_Cin));
        ASSERT (out_Cout & out_Sum = expected)
        REPORT "TC2 Failed"
            SEVERITY error;

        -- Test Case 3: Max value overflow (15 + 15 + 0)
        in_A <= "1111";
        in_B <= "1111";
        in_Cin <= '0';
        WAIT FOR 10 ns;
        expected := expected_sum(in_A, in_B, ("0" & in_Cin));
        ASSERT (out_Cout & out_Sum = expected)
        REPORT "TC3 Failed"
            SEVERITY error;

        -- Test Case 4: Carry propagation (0001 + 0001 + 0)
        in_A <= "0001";
        in_B <= "0001";
        in_Cin <= '0';
        WAIT FOR 10 ns;
        expected := expected_sum(in_A, in_B, ("0" & in_Cin));
        ASSERT (out_Cout & out_Sum = expected)
        REPORT "TC4 Failed"
            SEVERITY error;

        -- Test Case 5: Random value check (1010 + 0101 + 1)
        in_A <= "1010";
        in_B <= "0101";
        in_Cin <= '0';
        WAIT FOR 10 ns;
        expected := expected_sum(in_A, in_B, ("0" & in_Cin));
        ASSERT (out_Cout & out_Sum = expected)
        REPORT "TC5 Failed"
            SEVERITY error;

        REPORT "All tests completed";
        WAIT;
    END PROCESS;
END Behavioral;