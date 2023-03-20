----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2023 17:08:47
-- Design Name: 
-- Module Name: display - Behavioral
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

entity display is
    Generic (
        FREQ_IN     :   natural := 100E6;
        FREQ_MUX    :   natural := 1E3);
    Port ( 
        clk_i       :   in  std_logic;
        digit_o     :   in  std_logic_vector(31 downto 0);
        led7_an_o   :   out std_logic_vector( 3 downto 0);
        led7_seg_o  :   out std_logic_vector( 7 downto 0));
end display;

architecture Behavioral of display is

component divider is
    Generic (
        FREQ_IN     :   natural := 100E6;
        FREQ_OUT    :   natural := 1E6);
        
    Port (
        clk_i   :   in  std_logic;
        clk_o   :   out std_logic);
end component divider;

subtype byte is std_logic_vector(7 downto 0);

alias digit0 : byte is digit_o( 7 downto 0);
alias digit1 : byte is digit_o(15 downto 8);
alias digit2 : byte is digit_o(23 downto 16);
alias digit3 : byte is digit_o(31 downto 24);

type led_an_enum is (all_off, an0_on, an1_on, an2_on, an3_on, all_on);

signal an_state :   led_an_enum := an0_on;

signal mux_clk  :   std_logic;

begin

div: divider
    generic map (
        FREQ_IN     => FREQ_IN,
        FREQ_OUT    => FREQ_MUX)
        
    port map (
        clk_i   => clk_i,
        clk_o   => mux_clk);

multiplexing: process(mux_clk, an_state)
begin
    if rising_edge(mux_clk) then
    
        if an_state = all_on then
            an_state <= an0_on;
        elsif an_state = an0_on then
            an_state <= an1_on;
        elsif an_state = an1_on then
            an_state <= an2_on;
        elsif an_state = an2_on then
            an_state <= an3_on;
        elsif an_state = an3_on then
            an_state <= an0_on;
        end if;
    
    end if;
end process;

led7_an_o   <=  "0000"  when    an_state = all_on   else
                "1110"  when    an_state = an0_on   else
                "1101"  when    an_state = an1_on   else
                "1011"  when    an_state = an2_on   else
                "0111"  when    an_state = an3_on   else    "1111";

led7_seg_o  <=  digit0  when    an_state = an0_on   else
                digit1  when    an_state = an1_on   else
                digit2  when    an_state = an2_on   else
                digit3  when    an_state = an3_on   else
                (others => '0') when    an_state = all_on else (others => '1');

end Behavioral;
