----------------------------------------------------------------------------------
-- Company: 
-- Engineer:  Piotr Buluk, Jakub Cichocki
-- 
-- Create Date: 10.05.2023 17:19:37
-- Design Name: 
-- Module Name: top3 - Behavioral
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
        sw5_i   :   in  std_logic;
        sw6_i   :   in  std_logic;
        sw7_i   :   in  std_logic;
        btn_i   :   in  std_logic_vector(3 downto 0);
        hsync_o :   out std_logic;
        vsync_o :   out std_logic;
        red_o   :   out std_logic_vector(3 downto 0);
        green_o :   out std_logic_vector(3 downto 0);
        blue_o  :   out std_logic_vector(3 downto 0));
end top;

architecture Behavioral of top is

begin


end Behavioral;
