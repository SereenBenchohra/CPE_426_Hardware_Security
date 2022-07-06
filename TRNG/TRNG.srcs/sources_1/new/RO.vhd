----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/22/2021 04:26:29 PM
-- Design Name: 
-- Module Name: RO - Behavioral
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

entity RO is
    Port ( output : out STD_LOGIC);
end RO;

architecture Behavioral of RO is

    attribute keep : string;
    attribute s : string;

    signal latch_a_out : std_logic;
        attribute keep of latch_a_out : signal is "True";
        attribute s of latch_a_out : signal is "True";
    signal latch_b_out : std_logic;
        attribute keep of latch_b_out : signal is "True";
        attribute s of latch_b_out : signal is "True";
    signal latch_a_in : std_logic;
        attribute keep of latch_a_in : signal is "True";
        attribute s of latch_a_in : signal is "True";
    signal latch_b_in : std_logic;
        attribute keep of latch_b_in : signal is "True";
        attribute s of latch_b_in : signal is "True";
    
    component latch is
        port ( EN : in STD_LOGIC;
               D : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;

begin

    latch_a_in <= not latch_b_out;

    latch_a : latch port map ( EN => '1',
                               D => latch_b_out,
                               Q => latch_a_out);
                               
    latch_b_in <= not latch_a_out;
                               
    output <= latch_a_out;
    
    latch_b : latch port map ( EN => '1',
                               D => latch_b_in,
                               Q => latch_b_out);
                                


end Behavioral;
