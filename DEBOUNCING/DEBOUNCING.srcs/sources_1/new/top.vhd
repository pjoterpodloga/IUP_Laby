----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2023 13:46:53
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( 
        clk_i   : in    std_logic;
        btn_i   : in    std_logic;
        out_o   : out   std_logic);
end top;

architecture Behavioral of top is

component divider is
    generic ( 
        CLK_FREQ_IN  : natural;
        CLK_FREQ_OUT : natural);
    Port (
        clk_i : in  std_logic;
        rst_i : in  std_logic;
        clk_o : out std_logic);
        
end component divider;

constant CLK_FREQ : natural := 100E6;
constant CLK_PERIOD : time := (1E9 / CLK_FREQ) * 1ns;

constant CLK_FREQ_OUT : natural := 1E3;

signal rst_i : std_logic := '0';
signal clk_o : std_logic := '0';

constant min_time_pressed : natural := 10;

signal counter_btn  : natural range 10E3 to 0 := 0;
signal counter_p    : natural range 10E3 to 0;
signal counter_n    : natural range 10E3 to 0;
signal pass_signal  : std_logic := '0';

begin

div: divider 
    generic map (
        CLK_FREQ_IN     => CLK_FREQ,
        CLK_FREQ_OUT    => CLK_FREQ_OUT)
        
    port map (
        clk_i   => clk_i,
        rst_i   => rst_i,
        clk_o   => clk_o);
        
counter_p <= counter_btn + 1;
counter_n <= counter_btn - 1;
        
debouncing: process(clk_o, btn_i, counter_btn)
begin
    
    if counter_btn > min_time_pressed then
        pass_signal <= '1';
    end if;
    
    if rising_edge(clk_o) then
        if btn_i = '1' then
            counter_btn <= counter_p;
        elsif counter_btn /= 0 then
            counter_btn <= counter_n;
        elsif counter_btn = 0 then
            pass_signal <= '0';
        end if;
    end if;
    
end process;

out_o <= pass_signal;

end Behavioral;
