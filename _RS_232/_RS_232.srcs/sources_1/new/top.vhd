----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2023 10:40:24
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
           RXD_i : in STD_LOGIC;
           TXD_o : out STD_LOGIC);
end top;

architecture Behavioral of top is

component async_clk is
    Port (  clk_i : in std_logic;
            clk_baud : out std_logic;
            clk_en   : in std_logic);
end component async_clk;

signal clk_baud :  std_logic := '0';
signal clk_en   :  std_logic := '0';

begin

clk: async_clk port map (
    clk_i => clk_i,
    clk_baud => clk_baud,
    clk_en => clk_en);

end Behavioral;
