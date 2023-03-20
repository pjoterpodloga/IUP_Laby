----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2023 17:07:00
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
    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           start_stop_button_i : in STD_LOGIC;
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is

constant CLK_FREQ       :   natural :=  100E6;
constant DEBOUNCe_TIME  :   time    :=  50ms;

component display is
    Generic (
        FREQ_IN     :   natural := 100E6;
        FREQ_MUX    :   natural := 1E3);
    Port ( 
        clk_i       :   in  std_logic;
        digit_o     :   in  std_logic_vector(31 downto 0);
        led7_an_o   :   out std_logic_vector( 3 downto 0);
        led7_seg_o  :   out std_logic_vector( 7 downto 0));
end component display;

component encoder is
    Port ( 
        hex_i   :   in  std_logic_vector(15 downto 0);
        digit_o :   out std_logic_vector(31 downto 0));
end component encoder;

component stopwatch is
    Generic (
        FREQ_IN :   natural := 100E6);
    Port (
        clk_i   :   in  std_logic;
        rst_i   :   in  std_logic;
        start_stop_button_i :   in  std_logic;
        hex_o :   out std_logic_vector(15 downto 0));
end component stopwatch;

component debounce is
    generic
    (   BTN_DOWN_TIME   :   time    :=  50ms;
        CLK_FREQ        :   natural :=  100E6);
    Port
    (   clk_i   :   in  std_logic;
        btn_i   :   in  std_logic;
        btn_o   :   out std_logic);
end component debounce;

signal digit_internal   :   std_logic_vector(31 downto 0);
signal hex_internal     :   std_logic_vector(15 downto 0);
signal button_internal  :   std_logic;

begin

disp: display
    generic map(
        FREQ_IN     => CLK_FREQ,
        FREQ_MUX    => 1E3)
        
    port map( 
        clk_i       => clk_i,
        digit_o     => digit_internal,
        led7_an_o   => led7_an_o,
        led7_seg_o  => led7_seg_o);
        
enc: encoder
    port map( 
        hex_i   =>  hex_internal,
        digit_o => digit_internal);
        
sw: stopwatch
    generic map(
        FREQ_IN => CLK_FREQ)
        
    port map(
        clk_i               => clk_i,
        rst_i               => rst_i,
        start_stop_button_i => button_internal,
        hex_o               => hex_internal);
        
deboun: debounce
    generic map(   
        BTN_DOWN_TIME   => DEBOUNCE_TIME,
        CLK_FREQ        => CLK_FREQ)
    port map(   
        clk_i   => clk_i,
        btn_i   => start_stop_button_i,
        btn_o   => button_internal);

end Behavioral;
