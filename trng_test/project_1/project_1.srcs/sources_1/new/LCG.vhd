----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2021 02:56:30 PM
-- Design Name: 
-- Module Name: LCG - Behavioral
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

entity LCG is
    Port ( btn : in STD_LOGIC;
           sys_clk : in STD_LOGIC;
           DIS : out STD_LOGIC_VECTOR (3 downto 0);
           SEG : out STD_LOGIC_VECTOR (6 downto 0));
end LCG;

architecture Behavioral of LCG is


    component TRNG is 
    port ( btn : in STD_LOGIC;
           sys_clk : in std_logic;
           rand_num : out std_logic_vector (15 downto 0));
    end component; 

begin

    gen_a : TRNG


end Behavioral;
