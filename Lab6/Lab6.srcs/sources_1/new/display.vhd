----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2023 10:28:57
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display is
    Port (  clk_i   : in std_logic;
            rst_i   : in std_logic;
            digit_i : in std_logic_vector(31 downto 0);
            led7_an_o   : out std_logic_vector(3 downto 0);
            led7_seg_o  : out std_logic_vector(7 downto 0));
end display;

architecture Behavioral of display is

    constant mux_freq : integer := 10000000;
    constant clk_freq : integer := 100000000;
    constant clk_div  : integer := clk_freq / mux_freq;
    
    type an_enum is (all_off, an0_on, an1_on, an2_on, an3_on, all_on);
    
    signal an_state : an_enum := all_on;
    
    alias digit0_i : std_logic_vector(7 downto 0) is digit_i  (7 downto 0);
    alias digit1_i : std_logic_vector(7 downto 0) is digit_i (15 downto 8);
    alias digit2_i : std_logic_vector(7 downto 0) is digit_i(23 downto 16);
    alias digit3_i : std_logic_vector(7 downto 0) is digit_i(31 downto 24);
    
    signal p : integer := 0;
    signal q : integer := 0;
    signal mux_clk : std_logic := '0';
    signal last_state : std_logic := '0';
    
begin
    
    mux_clock: process(clk_i, last_state, q)
    begin
        if last_state /= clk_i then
            last_state <= clk_i;
            q <= p;
        end if;
        
        if q >= (2 * clk_div) - 1 then
            q <= 0;
        end if;
    end process;
    
    p <= q + 1;
    
    multiplexing: process(rst_i, mux_clk)
    begin
        if rst_i = '1' then
            an_state <= all_on;
        elsif rising_edge(mux_clk) then
            
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
    
    mux_clk <= '1' when (q < clk_div) else '0';
    
    led7_an_o <=    "1111" when (an_state = all_off) else
                    "1110" when (an_state = an0_on)  else
                    "1101" when (an_state = an1_on)  else
                    "1011" when (an_state = an2_on)  else
                    "0111" when (an_state = an3_on)  else "0000";
                    
    led7_seg_o <=   (7 downto 0 => '1') when (an_state = all_off) else
                    digit0_i            when (an_state = an0_on)  else
                    digit1_i            when (an_state = an1_on)  else
                    digit2_i            when (an_state = an2_on)  else
                    digit3_i            when (an_state = an3_on)  else (7 downto 0 => '0');

end Behavioral;
