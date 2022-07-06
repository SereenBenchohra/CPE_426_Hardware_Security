----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/13/2021 11:41:01 AM
-- Design Name: 
-- Module Name: MUX_4_IN - Behavioral
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

entity MUX_4_IN is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           SEL : in STD_LOGIC_VECTOR (1 downto 0);
           Q : out STD_LOGIC);
end MUX_4_IN;

architecture Behavioral of MUX_4_IN is
    
begin

    process (SEL, A, B, C, D)
    begin
        case SEL is
            when "00" => 
                Q <= A;
            when "01" => 
                Q <= B;
            when "10" => 
                Q <= C;
           when "11" => 
                Q <= D;
        end case;
    end process;
    
end Behavioral;
