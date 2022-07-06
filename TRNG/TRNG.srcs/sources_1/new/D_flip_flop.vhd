----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/08/2021 10:50:38 AM
-- Design Name: 
-- Module Name: flip-flop - Behavioral
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

entity D_flip_flop is
    Port ( CE : in STD_LOGIC;
           clk : in STD_LOGIC;
           init : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC);
end D_flip_flop;

architecture Behavioral of D_flip_flop is

begin

process (clk, CE) begin
    if (CE = '1') then
        if (rising_edge(clk)) then
            if (init = '1') then
                Q <= '0';
            else
                Q <= D;
            end if;
        end if;
    end if;
end process;


end Behavioral;
