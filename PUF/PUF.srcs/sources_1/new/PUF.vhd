----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/13/2021 11:38:22 AM
-- Design Name: 
-- Module Name: PUF - Behavioral
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

entity PUF is
    Port ( CH : in STD_LOGIC_VECTOR (7 downto 0);
           HASH : in STD_LOGIC_VECTOR (3 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           DIS : out STD_LOGIC_VECTOR(3 downto 0);
           SEG : out STD_LOGIC_VECTOR(6 downto 0);
           DONE : out STD_LOGIC;
           H_DONE : out STD_LOGIC);
end PUF;

architecture Behavioral of PUF is

    attribute keep : string;
    attribute s : string;

    signal SEL : STD_LOGIC_VECTOR(2 downto 0);
        attribute keep of SEL : signal is "True";
        attribute s of SEL : signal is "True";
    signal BX : STD_LOGIC_VECTOR(2 downto 0);
        attribute keep of BX : signal is "True";
        attribute s of BX : signal is "True";
    signal MUX_SEL : STD_LOGIC_VECTOR(1 downto 0);
        attribute keep of MUX_SEL : signal is "True";
        attribute s of MUX_SEL : signal is "True";
    signal SCLK : STD_LOGIC;
        attribute keep of SCLK : signal is "True";
        attribute s of SCLK : signal is "True";
    signal ROPUF_A_OUT : STD_LOGIC;
        attribute keep of ROPUF_A_OUT : signal is "True";
        attribute s of ROPUF_A_OUT : signal is "True";
    signal ROPUF_B_OUT : STD_LOGIC;
        attribute keep of ROPUF_B_OUT : signal is "True";
        attribute s of ROPUF_B_OUT : signal is "True";
    signal ROPUF_C_OUT : STD_LOGIC;
        attribute keep of ROPUF_C_OUT : signal is "True";
        attribute s of ROPUF_C_OUT : signal is "True";
    signal ROPUF_D_OUT : STD_LOGIC;
        attribute keep of ROPUF_D_OUT : signal is "True";
        attribute s of ROPUF_D_OUT : signal is "True";
    signal MUX_OUT : STD_LOGIC;
        attribute keep of MUX_OUT : signal is "True";
        attribute s of MUX_OUT : signal is "True";
    signal TIME_CNT_OUT : STD_LOGIC_VECTOR(31 downto 0);
        attribute keep of TIME_CNT_OUT : signal is "True";
        attribute s of TIME_CNT_OUT : signal is "True";
    signal RO_CNT_OUT : STD_LOGIC_VECTOR(31 downto 0);
        attribute keep of RO_CNT_OUT : signal is "True";
        attribute s of RO_CNT_OUT : signal is "True";
    signal RO_CNT_OUT_UP : STD_LOGIC_VECTOR(15 downto 0);
        attribute keep of RO_CNT_OUT_UP : signal is "True";
        attribute s of RO_CNT_OUT_UP : signal is "True";
    signal CMP_OUT : STD_LOGIC;
        attribute keep of CMP_OUT : signal is "True";
        attribute s of CMP_OUT : signal is "True";
    signal CNT_EN : STD_LOGIC;
        attribute keep of CNT_EN : signal is "True";
        attribute s of CNT_EN : signal is "True";
    signal CH_EN : STD_LOGIC;
        attribute keep of CH_EN : signal is "True";
        attribute s of CH_EN : signal is "True";
    signal PUF_DONE : STD_LOGIC;
        attribute keep of PUF_DONE : signal is "True";
        attribute s of PUF_DONE : signal is "True";
    signal CH_REG_IN : STD_LOGIC_VECTOR (15 downto 0);
        attribute keep of CH_REG_IN : signal is "True";
        attribute s of CH_REG_IN : signal is "True";
    signal CH_REG_OUT : STD_LOGIC_VECTOR (15 downto 0);
        attribute keep of CH_REG_OUT : signal is "True";
        attribute s of CH_REG_OUT : signal is "True";
    signal CH_PREV : STD_LOGIC_VECTOR (7 downto 0);
        attribute keep of CH_PREV : signal is "True";
        attribute s of CH_PREV : signal is "True";    
    signal CNT_RST : STD_LOGIC;
        attribute keep of CNT_RST : signal is "True";
        attribute s of CNT_RST : signal is "True";
    signal FINAL_COUNT: STD_LOGIC_VECTOR(15 downto 0);
        attribute keep of FINAL_COUNT : signal is "True";
        attribute s of FINAL_COUNT : signal is "True";
    signal HASH_OUT: STD_LOGIC_VECTOR(127 downto 0);
        attribute keep of HASH_OUT : signal is "True";
        attribute s of HASH_OUT : signal is "True";
    signal SSEG_IN: STD_LOGIC_VECTOR(15 downto 0);
        attribute keep of SSEG_IN : signal is "True";
        attribute s of SSEG_IN : signal is "True";
    signal HASH_IN: STD_LOGIC_VECTOR(15 downto 0);
        attribute keep of HASH_IN : signal is "True";
        attribute s of HASH_IN : signal is "True";

    component ROPUF is
    port ( SEL : in STD_LOGIC_VECTOR (2 downto 0);
           BX : in STD_LOGIC_VECTOR (2 downto 0);
           Q_PUF : out STD_LOGIC);
    end component;
    
    component MUX_4_IN is
    port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           SEL : in STD_LOGIC_VECTOR (1 downto 0);
           Q : out STD_LOGIC);
    end component;
    
    component COUNTER is
    port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           EN : in STD_LOGIC;
           COUNT : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component CMP is
    port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           EQ_GTR : out STD_LOGIC);
    end component;
    
    component flip_flop is
    port ( EN : in STD_LOGIC;
           clk : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (15 downto 0);
           Q : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component CLK_DIV is
    port ( clk : in std_logic;
           sclk : out std_logic);
    end component;
    
    component sseg_des is
    port (        COUNT : in std_logic_vector(15 downto 0); 				  
                    CLK : in std_logic;
				  VALID : in std_logic;
                DISP_EN : out std_logic_vector(3 downto 0);
               SEGMENTS : out std_logic_vector(6 downto 0)); -- Decimal Point is never used
    end component;
    
    component sha128_simple is
    port ( CLK : in STD_LOGIC;
           DATA_IN : in STD_LOGIC_VECTOR (15 downto 0);
           RESET : in STD_LOGIC;
           START : in STD_LOGIC;
           READY : out STD_LOGIC;
           DATA_OUT : out STD_LOGIC_VECTOR (127 downto 0));
    end component;
    
    --component CMP_8_BIT is
    --port ( A : in STD_LOGIC_VECTOR (7 downto 0);
    --       B : in STD_LOGIC_VECTOR (7 downto 0);
    --       RST_I : in STD_LOGIC;
    --       CLK : in STD_LOGIC;
    --       RST : out STD_LOGIC;
    --       FLIP_FLOP_EN : out STD_LOGIC);
    --end component;

begin

    SEL <= CH(2 downto 0);
    BX <= CH(5 downto 3);
    MUX_SEL <= CH(7 downto 6);
    
    CLK_D : CLK_DIV port map (clk => CLK,
                              sclk => SCLK);
    
    RO_A : ROPUF port map (SEL => SEL,
                           BX => BX,
                           Q_PUF => ROPUF_A_OUT);
                           
    RO_B : ROPUF port map (SEL => SEL,
                           BX => BX,
                           Q_PUF => ROPUF_B_OUT);
    
    RO_C : ROPUF port map (SEL => SEL,
                           BX => BX,
                           Q_PUF => ROPUF_C_OUT);
    
    RO_D : ROPUF port map (SEL => SEL,
                           BX => BX,
                           Q_PUF => ROPUF_D_OUT);

    MUX : MUX_4_IN port map (A => ROPUF_A_OUT,
                             B => ROPUF_B_OUT,
                             C => ROPUF_C_OUT,
                             D => ROPUF_D_OUT,
                             SEL => MUX_SEL,
                             Q => MUX_OUT);
                             
    CH_REG_IN <= "00000000" & CH;
                             
    PREV_CH : FLIP_FLOP port map (EN => CH_EN, 
                                  CLK => SCLK,
                                  D => CH_REG_IN,
                                  Q => CH_REG_OUT);
                                  
    CH_PREV <= CH_REG_OUT(7 downto 0);
    --process(CH, CH_PREV, RST, SCLK, CH)
    process(SCLK, CH, CH_PREV, RST, CNT_RST, CH_EN)
    begin
        if (rising_edge(SCLK)) then
            if (CH /= CH_PREV) then
                CH_EN <= '1';
                CNT_RST <= '1';
            elsif (RST = '1') then
                CH_EN <= '1';
                CNT_RST <= '1';
            else
                CH_EN <= '0';
                CNT_RST <= '0';
            end if;
        end if;
    end process;
                             
    --EN_SIGNAL : CMP_8_BIT port map (A => CH,
    --                                B => CH_PREV,
    --                                RST_I => RST,
    --                                CLK => SCLK,
    --                                RST => CNT_RST,
    --                                FLIP_FLOP_EN => CH_EN);
    
    STD_CNTR : COUNTER port map (CLK => SCLK,
                                 RST => CNT_RST,
                                 EN => CNT_EN,
                                 COUNT => TIME_CNT_OUT);
                                 
    RO_CNTR : COUNTER port map (CLK => MUX_OUT,
                                RST => CNT_RST,
                                EN => CNT_EN,
                                COUNT => RO_CNT_OUT);
                                
    RO_CNT_OUT_UP <= RO_CNT_OUT(31 downto 16);
                                
    IS_MAX : CMP port map (A => TIME_CNT_OUT,
                           EQ_GTR => CMP_OUT);
                           
    process (CMP_OUT)
    begin
        if (CMP_OUT = '1') then
            DONE <= '1';
            PUF_DONE <= '1';
        else 
            DONE <= '0';
            PUF_DONE <= '0';
        end if;
    end process;  
                         
    CNT_EN <= (not CMP_OUT and '1');
    
    PUF_CNT : flip_flop port map (EN => CNT_EN,
                                  CLK => SCLK,
                                  D => RO_CNT_OUT_UP,
                                  Q => FINAL_COUNT);
                                
    HASH_IN <= CH & FINAL_COUNT(7 downto 0);
                                
    SHA : sha128_simple port map (CLK => SCLK,
                                  DATA_IN => HASH_IN,
                                  RESET => '0',
                                  START => PUF_DONE,
                                  READY => H_DONE,
                                  DATA_OUT => HASH_OUT);
                                   
    process(HASH, SSEG_IN, HASH_OUT, FINAL_COUNT)
    begin
        case HASH is
            when "0000" =>
                SSEG_IN <= FINAL_COUNT;
            when "0001" =>
                SSEG_IN <= HASH_OUT(15 downto 0);
            when "0010" =>
                SSEG_IN <= HASH_OUT(31 downto 16);
            when "0011" =>
                SSEG_IN <= HASH_OUT(47 downto 32);
            when "0100" =>
                SSEG_IN <= HASH_OUT(63 downto 48);
            when "0101" =>
                SSEG_IN <= HASH_OUT(79 downto 64);
            when "0110" =>
                SSEG_IN <= HASH_OUT(95 downto 80);
            when "0111" =>
                SSEG_IN <= HASH_OUT(111 downto 96);
            when "1000" =>
                SSEG_IN <= HASH_OUT(127 downto 112);
            when others =>
                SSEG_IN <= "0000000000000000";
            end case;
        end process;
    
    sseg : sseg_des port map (COUNT => SSEG_IN,
                              CLK => CLK,
                              valid => '1',
                              DISP_EN => DIS,
                              SEGMENTS => SEG);

end Behavioral;

-- use flip flop to save ch bits when current bits don't match 
-- flip flop send reset then enable then reset low
