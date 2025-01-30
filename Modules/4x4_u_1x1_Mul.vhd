LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Multiplier_4x4 IS
    PORT (
        A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        P : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END Multiplier_4x4;

ARCHITECTURE Structural OF Multiplier_4x4 IS
    -- Components Declaration
    COMPONENT Multiplier_1x1
        PORT (
            A, B : IN STD_LOGIC;
            P : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT f_addr
        PORT (
            A, B, Cin : IN STD_LOGIC;
            S, Cout : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Signals for Partial Products (4x4 grid)
    TYPE pp_matrix IS ARRAY (0 TO 3, 0 TO 3) OF STD_LOGIC;
    SIGNAL PP : pp_matrix;

    -- Intermediate Carry and Sum Signals
    SIGNAL C1, C2, C3 : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Carry signals
    SIGNAL S1, S2 : STD_LOGIC_VECTOR(3 DOWNTO 0);     -- Sum signals

BEGIN
    -- Generate all 16 partial products using AND gates
    Gen_PP_Rows: FOR i IN 0 TO 3 GENERATE
        Gen_PP_Cols: FOR j IN 0 TO 3 GENERATE
            U_AND: Multiplier_1x1 PORT MAP (A(i), B(j), PP(i,j));
        END GENERATE Gen_PP_Cols;
    END GENERATE Gen_PP_Rows;

    -- Stage 1: Add B0 and B1 rows (shifted left by 1)
    FA1_1: f_addr PORT MAP (PP(1,0), PP(0,1), '0', P(1), C1(0));
    FA1_2: f_addr PORT MAP (PP(2,0), PP(1,1), C1(0), S1(0), C1(1));
    FA1_3: f_addr PORT MAP (PP(3,0), PP(2,1), C1(1), S1(1), C1(2));
    FA1_4: f_addr PORT MAP ('0',      PP(3,1), C1(2), S1(2), C1(3));

    -- Stage 2: Add B2 row (shifted left by 2)
    FA2_1: f_addr PORT MAP (S1(0),    PP(0,2), '0', P(2), C2(0));
    FA2_2: f_addr PORT MAP (S1(1),    PP(1,2), C2(0), S2(0), C2(1));
    FA2_3: f_addr PORT MAP (S1(2),    PP(2,2), C2(1), S2(1), C2(2));
    FA2_4: f_addr PORT MAP (C1(3),    PP(3,2), C2(2), S2(2), C2(3));

    -- Stage 3: Add B3 row (shifted left by 3)
    FA3_1: f_addr PORT MAP (S2(0),    PP(0,3), '0', P(3), C3(0));
    FA3_2: f_addr PORT MAP (S2(1),    PP(1,3), C3(0), P(4), C3(1));
    FA3_3: f_addr PORT MAP (S2(2),    PP(2,3), C3(1), P(5), C3(2));
    FA3_4: f_addr PORT MAP (C2(3),    PP(3,3), C3(2), P(6), P(7));

    -- Assign Least Significant Bit (LSB)
    P(0) <= PP(0,0);

END Structural;