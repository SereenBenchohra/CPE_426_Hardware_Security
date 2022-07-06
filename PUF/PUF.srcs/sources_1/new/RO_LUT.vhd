----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/08/2021 11:01:23 AM
-- Design Name: 
-- Module Name: RO_LUT - Behavioral
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

entity RO_LUT is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           SEL : in STD_LOGIC;
           Q : out STD_LOGIC);
end RO_LUT;

architecture Behavioral of RO_LUT is

    attribute keep : string;
    attribute s : string;
    
    signal A_LUT : STD_LOGIC;
        attribute keep of A_LUT : signal is "True";
        attribute s of A_LUT : signal is "True";
    signal B_LUT : STD_LOGIC;
        attribute keep of B_LUT : signal is "True";
        attribute s of B_LUT : signal is "True";

    component mux_two_in is
    port(
        A_MUX : in STD_LOGIC;
        B_MUX : in STD_LOGIC;
        SEL_MUX : in STD_LOGIC;
        output : out STD_LOGIC);
    end component;

begin

    A_LUT <= not A;
    B_LUT <= not B;

    mux_lut : mux_two_in port map ( A_MUX => A_LUT,
                                    B_MUX => B_LUT,
                                    SEL_MUX => SEL,
                                    output => Q);


end Behavioral;
