----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Piotr Buluk, Jakub Cichocki
-- 
-- Create Date: 05.04.2023 16:15:58
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
    Port ( 
        clk_i   :   in  std_logic;
        rst_i   :   in  std_logic;
        RXD_i   :   in  std_logic;
        TXD_o   :   out std_logic);
end top;

architecture Behavioral of top is

component freq_div is
    Generic (
        FREQ_IN     :   natural :=  100E6;
        FREQ_OUT    :   natural :=  10E6);
        
    Port ( 
        clk_i   :   in  std_logic;
        clk_en  :   in  std_logic;
        rst_i   :   in  std_logic;
        clk_o   :   out std_logic;
        nclk_o  :   out std_logic);
end component freq_div;

component bus_controller is
    Port (
        clk_i   :   in  std_logic;
        baud_i  :   in  std_logic;
        nbaud_i :   in  std_logic;
        RXD_i   :   in  std_logic;
        data_i  :   in  std_logic_vector(7 downto 0);
        TXD_o   :   out std_logic;
        clk_en  :   out std_logic;
        data_o  :   out std_logic_vector(7 downto 0));
        
end component bus_controller;

constant    FREQ_IN     :   natural :=  100E6;
constant    BAUD_DELTA  :   real    :=  0.00;
constant    BAUD_RATE   :   natural :=  natural(9600.0 * (1.0 + BAUD_DELTA));

signal      baud_clock  :   std_logic;
signal      nbaud_clock:   std_logic;
signal      clock_en    :   std_logic;

signal      data_input  :   std_logic_vector(7 downto 0);
signal      data_output :   std_logic_vector(7 downto 0);

begin

async_clk: freq_div
    generic map (
        FREQ_IN     =>  FREQ_IN,
        FREQ_OUT    =>  BAUD_RATE)
    port map (
        clk_i   =>  clk_i,
        clk_en  =>  clock_en,
        rst_i   =>  rst_i,
        clk_o   =>  baud_clock,
        nclk_o  =>  nbaud_clock);
        
 bus_controll: bus_controller
    port map (
        clk_i   =>  clk_i,
        baud_i  =>  baud_clock,
        nbaud_i =>  nbaud_clock,
        RXD_i   =>  RXD_i,
        data_i  =>  data_output,
        TXD_o   =>  TXD_o,
        clk_en  =>  clock_en,
        data_o  =>  data_input);

data_output <= std_logic_vector(unsigned(data_input) + x"20");

end Behavioral;
