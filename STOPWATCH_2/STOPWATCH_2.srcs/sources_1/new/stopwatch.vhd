----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2023 17:47:49
-- Design Name: 
-- Module Name: stopwatch - Behavioral
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

entity stopwatch is
    Generic (
        FREQ_IN :   natural := 100E6);
    Port (
        clk_i   :   in  std_logic;
        rst_i   :   in  std_logic;
        start_stop_button_i :   in  std_logic;
        hex_o :   out std_logic_vector(15 downto 0));
end stopwatch;

architecture Behavioral of stopwatch is

constant C_FREQ :   natural := 100;

type sw_enum is (SW_STOP, SW_START, SW_RESET, SW_OVERFLOW);

subtype digit   is  natural range 10 downto 0;

alias   hex0 : std_logic_vector(3 downto 0) is hex_o(3  downto 0);
alias   hex1 : std_logic_vector(3 downto 0) is hex_o(7  downto 4);
alias   hex2 : std_logic_vector(3 downto 0) is hex_o(11 downto 8);
alias   hex3 : std_logic_vector(3 downto 0) is hex_o(15 downto 12);

component divider is
    Generic (
        FREQ_IN     :   natural := 100E6;
        FREQ_OUT    :   natural := 1E6);
        
    Port (
        clk_i   :   in  std_logic;
        clk_o   :   out std_logic);
end component divider;

signal  c_clk   : std_logic;

signal  sw_state    :   sw_enum := SW_STOP;

signal  millis_01   :   digit   := 0;
signal  millis_10   :   digit   := 0;

signal  seconds_01  :   digit   := 0;
signal  seconds_10  :   digit   := 0;

begin

div: divider
    generic map (
        FREQ_IN     => FREQ_IN,
        FREQ_OUT    => C_FREQ)
        
    port map (
        clk_i   => clk_i,
        clk_o   => c_clk);
        
counting: process(c_clk, sw_state)
begin

    if rising_edge(c_clk) then
        if sw_state = SW_START then
            millis_01 <= millis_01 + 1;
            
            if millis_01 = 10 then
                millis_01 <= 0;
                millis_10 <= millis_10 + 1;
            end if;
            
            if millis_10 = 10 then
                millis_10   <= 0;
                seconds_01  <= seconds_01 + 1;
            end if;
            
            if seconds_01 = 10 then
                seconds_01 <= 0;
                seconds_10 <= seconds_10 + 1;
            end if;
            
        elsif sw_state = SW_STOP then    
            millis_01 <= 0;
            millis_10 <= 0;
            
            seconds_01 <= 0;
            seconds_10 <= 0;
        elsif sw_state = SW_OVERFLOW then
            seconds_10 <= 0;
        end if;
    end if;

end process;

state_switch: process(start_stop_button_i, sw_state, seconds_10)
begin
    
    if rst_i = '1' then    
        sw_state <= sw_stop;
    elsif seconds_10 = 6 then
        sw_state <= sw_overflow; 
    elsif rising_edge(start_stop_button_i) then
        
        if sw_state = sw_stop then
            sw_state <= sw_start;
        elsif sw_state = sw_start then
            sw_state <= sw_reset;
        elsif sw_state = sw_reset then
            sw_state <= sw_stop;
        elsif sw_state = sw_overflow then
            sw_state <= sw_stop;
        end if;
        
    end if;

end process;

hex0 <= std_logic_vector(to_unsigned(millis_01, hex0'length))   when sw_state /= sw_overflow else x"A";
hex1 <= std_logic_vector(to_unsigned(millis_10, hex0'length))   when sw_state /= sw_overflow else x"A";
hex2 <= std_logic_vector(to_unsigned(seconds_01, hex0'length))  when sw_state /= sw_overflow else x"A";
hex3 <= std_logic_vector(to_unsigned(seconds_10, hex0'length))  when sw_state /= sw_overflow else x"A";

end Behavioral;