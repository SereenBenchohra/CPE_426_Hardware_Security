----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/25/2021 06:14:28 PM
-- Design Name: 
-- Module Name: controller - Behavioral
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

entity controller is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : out STD_LOGIC;
           sample : out STD_LOGIC);
end controller;

architecture Behavioral of controller is

begin

    process (clk, rst)
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then
                en <= '0';
                sample <= '0';
            else
                en <= '1';
                sample <= '1';
            end if;
        end if;
    end process;

end Behavioral;
