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
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port ( ce : in STD_LOGIC;
           clk : in std_logic;
           count : out STD_LOGIC_vector (31 downto 0));
end counter;

architecture Behavioral of counter is

    attribute keep : string;
    attribute s : string;
    
    signal s_cnt : std_logic_vector (31 downto 0);
        attribute keep of s_cnt : signal is "True";
        attribute s of s_cnt : signal is "True"; 

begin

    process (clk, ce) 
    begin
        if (rising_edge(clk)) then
            if (ce = '1') then
                s_cnt <= (s_cnt + 1);
            end if;
        end if;
    end process;

    count <= s_cnt;

end Behavioral;
