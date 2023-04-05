----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( 
        clk_i   :   in  std_logic;
        rst_i  :   in  std_logic;
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
        clk_o   :   out std_logic);
end component freq_div;

constant    FREQ_IN     :   natural :=  100E6;
constant    BAUD_DELTA  :   real    :=  0.04;
constant    BAUD_RATE   :   natural :=  natural(9600.0 * (1.0 + BAUD_DELTA));

begin

async_clk: freq_div
    generic map (
        FREQ_IN     =>  FREQ_IN,
        FREQ_OUT    =>  BAUD_RATE)
    port map (
        clk_i   =>  clk_i,
        clk_en  =>  '0',
        rst_i   =>  rst_i,
        clk_o   =>  open);

end Behavioral;
