----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2023 15:00:45
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
    Port (  clk_i : in std_logic;
            rst_i : in std_logic;
            digit_i : in std_logic_vector (31 downto 0);
            led7_an_o : out std_logic_vector (3 downto 0);
            led7_seg_o : out std_logic_vector (7 downto 0));
end display;

architecture Behavioral of display is

type an_enum is (all_off, an0_on, an1_on, an2_on, an3_on, all_on);
subtype byte is std_logic_vector (7 downto 0);

constant mux_clk  : integer := 10000000;
constant clk_freq : integer := 100000000;
constant N_div : integer := clk_freq / mux_clk;

alias digit3_i : byte is digit_i (31 downto 24);
alias digit2_i : byte is digit_i (23 downto 16);
alias digit1_i : byte is digit_i (15 downto 8);
alias digit0_i : byte is digit_i (7 downto 0);

signal an_state : an_enum := all_on;

signal q : integer range N_div downto 0 := 0;
signal last_state : std_logic := '0';
signal clk_mux : std_logic := '0';

begin

    clk_i_div: process(clk_i, q, last_state, clk_mux)
    begin
        if q >= N_div then
            q <= 0;
            clk_mux <= not clk_mux;
        end if;
        
        if last_state /= clk_i then
            last_state <= clk_i;
            q <= q + 1;
        end if;
    end process;
    
    multiplexing: process(clk_mux, an_state, rst_i)
    begin
        if rising_edge(clk_mux) then
            if rst_i = '1' then
                an_state <= all_on;
            elsif an_state = all_on then
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

    led7_an_o <=    "1111" when an_state = all_off  else
                    "1110" when an_state = an0_on   else
                    "1101" when an_state = an1_on   else
                    "1011" when an_state = an2_on   else
                    "0111" when an_state = an3_on   else "0000";
                    
    led7_seg_o <=   (7 downto 0 => '1') when an_state = all_off else
                    digit0_i when an_state = an0_on else
                    digit1_i when an_state = an1_on else
                    digit2_i when an_state = an2_on else
                    digit3_i when an_state = an3_on else (7 downto 0 => '0');

end Behavioral;
