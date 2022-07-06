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

entity CMP_8_BIT is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           RST_I : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RST : out STD_LOGIC;
           FLIP_FLOP_EN: out STD_LOGIC);
end CMP_8_BIT;

architecture Behavioral of CMP_8_BIT is

    attribute keep : string;
    attribute s : string;
    
    signal EN : std_logic;
        attribute keep of EN : signal is "True";
        attribute s of EN : signal is "True";
    signal A_SIG : std_logic_vector (7 downto 0);
        attribute keep of A_SIG : signal is "True";
        attribute s of A_SIG : signal is "True";
    signal B_SIG : std_logic_vector (7 downto 0);
        attribute keep of B_SIG : signal is "True";
        attribute s of B_SIG : signal is "True";
    signal RST_I_SIG : std_logic;
        attribute keep of RST_I_SIG : signal is "True";
        attribute s of RST_I_SIG : signal is "True";
    signal CLK_SIG : std_logic;
        attribute keep of CLK_SIG : signal is "True";
        attribute s of CLK_SIG : signal is "True";
    signal RST_OUT_SIG : std_logic;
        attribute keep of RST_OUT_SIG : signal is "True";
        attribute s of RST_OUT_SIG : signal is "True";

begin
    
    A_SIG <= A;
    B_SIG <= B;
    CLK_SIG <= CLK;
    RST_I_SIG <= RST_I;
    
    process
    begin
        if (A_SIG /= B_SIG or RST_I_SIG = '1') then
            --wait for 1 ns;
                EN <= '1';
                RST_OUT_SIG <= '1';
                FLIP_FLOP_EN <= EN;
                RST <= RST_OUT_SIG;
            wait for 20 ns;
                RST_OUT_SIG <= '0';
                EN <= '0';
        end if;
    end process;
    
    FLIP_FLOP_EN <= EN;
    RST <= RST_OUT_SIG;

end Behavioral;
