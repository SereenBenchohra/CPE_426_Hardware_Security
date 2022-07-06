library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux8_1 is
    Port ( DIN: in STD_LOGIC_VECTOR (7 downto 0);
           SEL : in STD_LOGIC_VECTOR (2 downto 0);
           DOUT : out STD_LOGIC);
end Mux8_1;

architecture Behavioral of Mux8_1 is

    attribute keep : string;
    attribute s : string;
    
    signal ROclk : std_logic;
        attribute keep of ROclk : signal is "True";
        attribute s of ROclk : signal is "True";
    signal ce : std_logic;
        attribute keep of ce : signal is "True";
        attribute s of ce : signal is "True";
    signal count : std_logic_vector (31 downto 0);
        attribute keep of count : signal is "True";
        attribute s of count : signal is "True";

    component RO is
        Port ( output : out STD_LOGIC);
    end component;
    
    component counter is
        Port ( ce : in STD_LOGIC;
               clk : in std_logic;
               count : out STD_LOGIC_vector (31 downto 0));
    end component;

begin

    CLK : RO port map ( output => ROclk);
    
    count_to_32 : counter port map ( ce => ce,
                                     clk => ROclk,
                                     count => count);    

    process(SEL)
        begin
        if (count >= "01111111111111111111111111111111") then
            DOUT <= '1';
            ce <= '0';
        else
            ce <= '1';
            case SEL is
                when "000"=>
                    DOUT <= DIN(0);
                when "001"=>
                    DOUT <= DIN(1);
                when "010"=>
                    DOUT <= DIN(2);
                when "011"=>
                    DOUT <= DIN(3);
                when "100"=>
                    DOUT <= DIN(4);
                when "101"=>
                    DOUT <= DIN(5);
                when "110"=>
                    DOUT <= DIN(6);
                when "111"=>
                    DOUT <= DIN(7);
                when others => NULL;
            end case;
        end if;
     end process;


end Behavioral;
