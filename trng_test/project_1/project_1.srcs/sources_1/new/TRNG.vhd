----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/25/2021 06:15:03 PM
-- Design Name: 
-- Module Name: TRNG - Behavioral
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

entity TRNG is
  Port ( rst : in STD_LOGIC;
         sys_clk : in std_logic;
         rand_num : out std_logic_vector(15 downto 0));
  end TRNG;

architecture Behavioral of TRNG is

    attribute keep : string;
    attribute s : string;

    signal RO0_out : std_logic;
        attribute keep of RO0_out : signal is "True";
        attribute s of RO0_out : signal is "True";
    signal RO1_out : std_logic;
        attribute keep of RO1_out : signal is "True";
        attribute s of RO1_out : signal is "True";
    signal con_sam_out : std_logic;
        attribute keep of con_sam_out : signal is "True";
        attribute s of con_sam_out : signal is "True";
    signal con_en_out : std_logic;
        attribute keep of con_en_out : signal is "True";
        attribute s of con_en_out : signal is "True";
    signal sam_rst_out : std_logic;
        attribute keep of sam_rst_out : signal is "True";
        attribute s of sam_rst_out : signal is "True";
    signal bit_strm_bit : std_logic;
        attribute keep of bit_strm_bit : signal is "True";
        attribute s of bit_strm_bit : signal is "True"; 
    signal sam_bitReady : std_logic;
        attribute keep of sam_bitReady : signal is "True";
        attribute s of sam_bitReady : signal is "True"; 
    signal cnt_readAwk : std_logic;
        attribute keep of cnt_readAwk : signal is "True";
        attribute s of cnt_readAwk : signal is "True"; 
    signal fertig : std_logic;
        attribute keep of fertig : signal is "True";
        attribute s of fertig : signal is "True";
    signal rand_num_out : std_logic_vector (15 downto 0);
        attribute keep of rand_num_out : signal is "True";
        attribute s of rand_num_out : signal is "True";
    signal sclk : std_logic;
        attribute keep of sclk : signal is "True";
        attribute s of sclk : signal is "True";

    component RO is
    port ( output : out STD_LOGIC);
    end component;
    
    component sampler is
    port ( sample : in STD_LOGIC;
           en : in STD_LOGIC;
           ReadAck : in STD_LOGIC;
           clk0 : in STD_LOGIC;
           clk1 : in STD_LOGIC;
           BitReady : out STD_LOGIC;
           rst : out STD_LOGIC;
           RandBitOut : out STD_LOGIC);
    end component;
    
    component controller is 
    port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : out STD_LOGIC;
           sample : out STD_LOGIC);
    end component;
    
    component sseg_des is
    port (        COUNT : in std_logic_vector(15 downto 0); 				  
                    CLK : in std_logic;
				  VALID : in std_logic;
                DISP_EN : out std_logic_vector(3 downto 0);
               SEGMENTS : out std_logic_vector(6 downto 0));
    end component;
    
    component strm_2_num is 
    port ( bit_in : in STD_LOGIC;
           rst : in STD_LOGIC;
           fix_bias_en : in STD_LOGIC;
           en : in STD_LOGIC;
           clk : in std_logic;
           read_awk : out STD_LOGIC;
           num_out : out STD_LOGIC_VECTOR (15 downto 0);
           ready : out STD_LOGIC;
           goofed : out std_logic;
           working : out std_logic;
           count : out std_logic_vector (4 downto 0));
    end component;
    
    component clk_divx is
    port (  clk : in std_logic;
           sclk : out std_logic);
    end component;

begin

    RO0 : RO port map (output => RO0_out);
    
    RO1 : RO port map (output => RO1_out);
    
    clk_div : clk_divx port map ( clk => sys_clk,
                                  sclk => sclk);
    
    bit_gen : sampler port map (sample => con_sam_out,
                                en => con_en_out,
                                ReadAck => cnt_readAwk,
                                clk0 => RO0_out,
                                clk1 => RO1_out,
                                BitReady => sam_bitReady,
                                rst => sam_rst_out,
                                RandBitOut => bit_strm_bit);
                                
    bit_gen_control : controller port map (clk => RO1_out,
                                           rst => sam_rst_out,
                                           en => con_en_out,
                                           sample => con_sam_out);
                                           
    rnum : strm_2_num port map (bit_in => bit_strm_bit,
                                rst => rst,
                                fix_bias_en => '1',
                                en => '1', --sam_bitReady,
                                clk => sclk,
                                read_awk => cnt_readAwk,
                                num_out => rand_num,
                                ready => fertig);
                               
    
end Behavioral;
