----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/13/2021 11:59:19 AM
-- Design Name: 
-- Module Name: COUNTER - Behavioral
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
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity COUNTER is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           EN : in STD_LOGIC;
           COUNT : out STD_LOGIC_VECTOR (31 downto 0));
end COUNTER;

architecture Behavioral of COUNTER is

    signal t_cnt : std_logic_vector(31 downto 0);

begin

    process (RST, EN, CLK)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                t_cnt <= "00000000000000000000000000000000";
            elsif (EN = '1') then
                t_cnt <= (t_cnt + 1);
            end if;
        end if;
    end process;
    COUNT <= t_cnt;
end Behavioral;
