----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/08/2021 11:00:15 AM
-- Design Name: 
-- Module Name: RO_SLICE - Behavioral
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

entity RO_SLICE is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           SEL : in STD_LOGIC;
           BX : in STD_LOGIC;
           Q : out STD_LOGIC;
           nQ : out STD_LOGIC);
end RO_SLICE;

architecture Behavioral of RO_SLICE is

    attribute keep : string;
    attribute s : string;

    signal G_OUT : STD_LOGIC;
        attribute keep of G_OUT : signal is "True";
        attribute s of G_OUT : signal is "True"; 
    signal F_OUT : STD_LOGIC;
        attribute keep of F_OUT : signal is "True";
        attribute s of F_OUT : signal is "True";
    signal MUX_OUT : STD_LOGIC;
        attribute keep of MUX_OUT : signal is "True";
        attribute s of MUX_OUT : signal is "True";

    component RO_LUT is
    port (A : in STD_LOGIC;
          B : in STD_LOGIC;
          SEL : in STD_LOGIC;
          Q : out STD_LOGIC);
    end component;

    component mux_two_in is
    port (A_MUX : in STD_LOGIC;
          B_MUX : in STD_LOGIC;
          SEL_MUX : in STD_LOGIC;
          output : out STD_LOGIC);
    end component;
    
    component latch is
    port (D : in STD_LOGIC;
          Q : out STD_LOGIC);
    end component;

begin

    LUT_G : RO_LUT port map (A => A,
                             B => B,
                             SEL => SEL,
                             Q => G_OUT);
                
    LUT_F : RO_LUT port map (A => A,
                             B => B,
                             SEL => SEL,
                             Q => F_OUT);
    
    MUX : mux_two_in port map (A_MUX => G_OUT,
                               B_MUX => F_OUT,
                               SEL_MUX => BX,
                               output => MUX_OUT);
                       
    Q <= MUX_OUT;
        
    end_latch : latch port map (D => MUX_OUT,
                                Q => nQ);           

end Behavioral;
