----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/08/2021 10:40:44 AM
-- Design Name: 
-- Module Name: mux_two_in - Behavioral
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

entity mux_two_in is
    Port ( A_MUX : in STD_LOGIC;
           B_MUX : in STD_LOGIC;
           SEL_MUX : in STD_LOGIC;
           output : out STD_LOGIC);
end mux_two_in;

architecture Behavioral of mux_two_in is

begin

    output <= A_MUX when (SEL_MUX = '1') else B_MUX;

end Behavioral;
