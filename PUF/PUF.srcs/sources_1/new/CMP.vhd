----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/13/2021 12:10:59 PM
-- Design Name: 
-- Module Name: CMP - Behavioral
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

entity CMP is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           EQ_GTR : out STD_LOGIC);
end CMP;

architecture Behavioral of CMP is

    constant MAX : std_logic_vector(31 downto 0) := "00000000000000000000000111111111";

begin

    process (A)
    begin
        if (A >= MAX) then
            EQ_GTR <= '1';
        else 
            EQ_GTR <= '0';
        end if;
    end process;

end Behavioral;
