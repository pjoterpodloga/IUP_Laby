----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.03.2023 08:48:17
-- Design Name: 
-- Module Name: debounce - Behavioral
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

entity debounce is
    generic
    (   BTN_DOWN_TIME   :   time    :=  50ms;
        CLK_FREQ        :   natural :=  100E6);
    Port
    (   clk_i   :   in  std_logic;
        btn_i   :   in  std_logic;
        btn_o   :   out std_logic);
end debounce;

architecture Behavioral of debounce is

constant    DIV_MULTIPLIER  :   natural :=  10; 
constant    DIV_FREQ        :   natural :=  1000ms / BTN_DOWN_TIME * DIV_MULTIPLIER;
constant    MAX_PULSE_WIDTH :   natural :=  DIV_MULTIPLIER * 100;

component divider is
    generic (
        FREQ_IN     :   natural := 100E6;
        FREQ_OUT    :   natural := 1E6);
    Port ( 
        clk_i       :   in  std_logic;
        clk_o       :   out std_logic);
end component divider;

signal  clk_debounce    :   std_logic;

signal  debounce_q          :   natural range MAX_PULSE_WIDTH downto 0 :=  0;
signal  debounce_p          :   natural range MAX_PULSE_WIDTH downto 0;
signal  debounce_n          :   natural range MAX_PULSE_WIDTH downto 0;

signal  pass_signal :   std_logic   := '0';

begin

div: divider 
    generic map (
    FREQ_IN     => CLK_FREQ,
    FREQ_OUT    => DIV_FREQ)
    
    port map (
    clk_i   => clk_i,
    clk_o   => clk_debounce);

debounce_counter:   process(clk_debounce, debounce_q)
begin

    if debounce_q = DIV_MULTIPLIER + 1 then
        pass_signal <= '1';
    end if;    
    
    if rising_edge(clk_debounce) then
        if  debounce_q /= MAX_PULSE_WIDTH and btn_i = '1' then
            debounce_q <= debounce_n;
        elsif debounce_q > 0 and btn_i = '0' and pass_signal = '1' then
            debounce_q <= debounce_p;
        else
            debounce_q <= 0;
            pass_signal <= '0';
        end if;
    end if;

end process;

debounce_n <= debounce_q + 1;
debounce_p <= debounce_q - 1;

btn_o   <=  pass_signal;

end Behavioral;
