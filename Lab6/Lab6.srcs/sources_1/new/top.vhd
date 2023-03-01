----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.03.2023 16:17:30
-- Design Name: 
-- Module Name: top - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port (  clk_i : in std_logic;
            rst_i : in std_logic;            
            btn_i : in std_logic_vector(3 downto 0);
            sw_i : in std_logic_vector(7 downto 0);
            led7_an_o : out std_logic_vector(3 downto 0);
            led7_seg_o : out std_logic_vector(7 downto 0));
end top;

architecture Behavioral of top is

constant mux_freq : integer := 1000;
constant mux_period : integer := 1/mux_freq;

type anx_enum is (all_off, an0_on, an1_on, an2_on, an3_on, all_on);
type btn_enum is (idle, save_seg0, save_seg1, save_seg2, save_seg3);

subtype byte is std_logic_vector(7 downto 0);

signal digit_anx : std_logic_vector(31 downto 0);
alias digit_seg3 : std_logic_vector(7 downto 0) is digit_anx(31 downto 24);
alias digit_seg2 : std_logic_vector(7 downto 0) is digit_anx(23 downto 16);
alias digit_seg1 : std_logic_vector(7 downto 0) is digit_anx(15 downto 8);
alias digit_seg0 : std_logic_vector(7 downto 0) is digit_anx(7 downto 0);

signal digit0, digit1, digit2, digit3 : std_logic_vector (3 downto 0);

signal anx_state : anx_enum := all_off;

function hex2seg(hex_in : std_logic_vector(3 downto 0)) return byte is
    variable seg_out : byte;
begin
    if hex_in = "0000" then
        seg_out := "00000011";
    elsif hex_in = "0001" then
        seg_out := "10011111";
    elsif hex_in = "0010" then
        seg_out := "00100101";
    elsif hex_in = "0011" then
        seg_out := "00001101";
    elsif hex_in = "0100" then
        seg_out := "10011001";
    elsif hex_in = "0101" then
        seg_out := "01001001";
    elsif hex_in = "0110" then
        seg_out := "01000001";
    elsif hex_in = "0111" then
        seg_out := "00011111";
    elsif hex_in = "1000" then
        seg_out := "00000001";
    elsif hex_in = "1001" then
        seg_out := "00001001";
    elsif hex_in = "1010" then
        seg_out := "00010001";
    elsif hex_in = "1011" then
        seg_out := "11000001";
    elsif hex_in = "1100" then
        seg_out := "11100101";
    elsif hex_in = "1101" then
        seg_out := "10000101";
    elsif hex_in = "1110" then
        seg_out := "01100001";
    elsif hex_in = "1111" then
        seg_out := "01110001";
    end if;          
    
    return seg_out;
end function;

begin

    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
           anx_state <= all_on;
        elsif rising_edge(clk_i) then
        
            if anx_state = all_on then
                anx_state <= an0_on;
            elsif anx_state = an0_on then
                anx_state <= an1_on;
            elsif anx_state = an1_on then
                anx_state <= an2_on;
            elsif anx_state = an2_on then
                anx_state <= an3_on;
            elsif anx_state = an3_on then
                anx_state <= an0_on;
            end if;
            
        end if;
    end process;
    
    process(clk_i, btn_i)
    begin
        if rising_edge(clk_i) then
            if btn_i(0) = '1' then
                digit0 <= sw_i(3 downto 0);
            elsif btn_i(1) = '1' then
                digit1 <= sw_i(3 downto 0);
            elsif btn_i(2) = '1' then
                digit2 <= sw_i(3 downto 0);
            elsif btn_i(3) = '1' then
                digit3 <= sw_i(3 downto 0);
            end if;
        end if;
    end process;
    
    digit_seg0 <= hex2seg(digit0);
    digit_seg1 <= hex2seg(digit1);
    digit_seg2 <= hex2seg(digit2);
    digit_seg3 <= hex2seg(digit3);
    
    digit_seg0(0) <= not sw_i(4);
    digit_seg1(0) <= not sw_i(5);
    digit_seg2(0) <= not sw_i(6);
    digit_seg3(0) <= not sw_i(7);
    
    led7_an_o <= "1110" when (anx_state = an0_on)   else
                 "1101" when (anx_state = an1_on)   else
                 "1011" when (anx_state = an2_on)   else
                 "0111" when (anx_state = an3_on)   else
                 "0000" when (anx_state = all_on)   else "1111";
    
    led7_seg_o <=   digit_seg0 when (anx_state = an0_on) else
                    digit_seg1 when (anx_state = an1_on) else
                    digit_seg2 when (anx_state = an2_on) else
                    digit_seg3 when (anx_state = an3_on) else
                    (others => '0') when (anx_state = all_on) else (others => '1');

end Behavioral;
