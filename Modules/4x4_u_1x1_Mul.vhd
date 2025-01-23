LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Multiplier_4x4 IS
    PORT (
        A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        P : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        -- Product term would have 8 bits;
    );
END Multiplier_4x4;

ARCHITECTURE STRUCTURAL OF Multiplier_4x4 IS
    -- NOTE: Declaring components of previous designs
    COMPONENT Multiplier_1x1
        PORT (
            A : IN STD_LOGIC;
            B : IN STD_LOGIC;
            P : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT f_addr
        PORT (
            A, B, Cin : IN STD_LOGIC;
            S, Cout : OUT STD_LOGIC
        );
    END COMPONENT;

    TYPE partials_arr IS ARRAY (0 TO 3, 0 TO 3) OF STD_LOGIC;
    -- DESCRIPTION: declaring signals to hold the partial products
    SIGNAL partials : partials_arr;

BEGIN
    -- Generating partial products
    ROWS: FOR i IN 0 TO 3 GENERATE
        COLS: FOR j IN 0 TO 3 GENERATE
            MUL_UNIT: Multiplier_1x1 PORT MAP (
                A => A(i),
                B => B(j),
                P => partials(i, j)
            );
        END GENERATE COLS;
    END GENERATE ROWS;
END STRUCTURAL;