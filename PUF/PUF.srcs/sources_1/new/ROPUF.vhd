----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/08/2021 09:15:25 AM
-- Design Name: 
-- Module Name: ROPUF - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROPUF is
    Port ( SEL : in STD_LOGIC_VECTOR (2 downto 0);
           BX : in STD_LOGIC_VECTOR (2 downto 0);
           Q_PUF : out STD_LOGIC);
end ROPUF;

architecture Behavioral of ROPUF is
    attribute keep : string;
    attribute s : string;
    
    signal SLICE_1_OUT_A : STD_LOGIC;
        attribute keep of SLICE_1_OUT_A : signal is "True";
        attribute s of SLICE_1_OUT_A : signal is "True";
    signal SLICE_1_OUT_B : STD_LOGIC;
        attribute keep of SLICE_1_OUT_B : signal is "True";
        attribute s of SLICE_1_OUT_B : signal is "True";
    signal SLICE_2_OUT_A : STD_LOGIC;
        attribute keep of SLICE_2_OUT_A : signal is "True";
        attribute s of SLICE_2_OUT_A : signal is "True";
    signal SLICE_2_OUT_B : STD_LOGIC;
        attribute keep of SLICE_2_OUT_B : signal is "True";
        attribute s of SLICE_2_OUT_B : signal is "True";
    signal SLICE_3_OUT_A : STD_LOGIC;
        attribute keep of SLICE_3_OUT_A : signal is "True";
        attribute s of SLICE_3_OUT_A : signal is "True";
    signal SLICE_3_OUT_B : STD_LOGIC;
        attribute keep of SLICE_3_OUT_B : signal is "True";
        attribute s of SLICE_3_OUT_B : signal is "True";
    signal SEL0 : STD_LOGIC := SEL(0);
        attribute keep of SEL0 : signal is "True";
        attribute s of SEL0 : signal is "True";
    signal SEL1 : STD_LOGIC := SEL(1);
        attribute keep of SEL1 : signal is "True";
        attribute s of SEL1 : signal is "True";
    signal SEL2 : STD_LOGIC := SEL(2);
        attribute keep of SEL2 : signal is "True";
        attribute s of SEL2 : signal is "True";
    signal BX0 : STD_LOGIC := BX(0);
        attribute keep of BX0 : signal is "True";
        attribute s of BX0 : signal is "True";
    signal BX1 : STD_LOGIC := BX(1);
        attribute keep of BX1 : signal is "True";
        attribute s of BX1 : signal is "True";
    signal BX2 : STD_LOGIC := BX(2);
        attribute keep of BX2 : signal is "True";
        attribute s of BX2 : signal is "True";
        
    component RO_SLICE is
    port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           SEL : in STD_LOGIC;
           BX : in STD_LOGIC;
           Q : out STD_LOGIC;
           nQ : out STD_LOGIC);
    end component;

begin

    SLICE_1 : RO_SLICE port map (A => SLICE_3_OUT_A,
                                 B => SLICE_3_OUT_B,
                                 SEL => SEL0,
                                 BX => BX0,
                                 Q => SLICE_1_OUT_A,
                                 nQ => SLICE_1_OUT_B);
    
    
    SLICE_2 : RO_SLICE port map (A => SLICE_1_OUT_A,
                                 B => SLICE_1_OUT_B,
                                 SEL => SEL1,
                                 BX => BX1,
                                 Q => SLICE_2_OUT_A,
                                 nQ => SLICE_2_OUT_B);
                                 
    SLICE_3 : RO_SLICE port map (A => SLICE_2_OUT_A,
                                 B => SLICE_2_OUT_B,
                                 SEL => SEL2,
                                 BX => BX2,
                                 Q => SLICE_3_OUT_A,
                                 nQ => SLICE_3_OUT_B);

    Q_PUF <= SLICE_3_OUT_A;
 
end Behavioral;
