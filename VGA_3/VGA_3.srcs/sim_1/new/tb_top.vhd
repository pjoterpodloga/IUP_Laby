----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2023 19:06:47
-- Design Name: 
-- Module Name: tb_top - Behavioral
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

entity tb_top is
--  Port ( );
end tb_top;

architecture Behavioral of tb_top is

component top is

    Port ( 
        clk_i   :   in  std_logic;
        sw5_i   :   in  std_logic;
        sw6_i   :   in  std_logic;
        sw7_i   :   in  std_logic;
        btn_i   :   in  std_logic_vector(3 downto 0);
        red_o   :   out std_logic_vector(3 downto 0);
        green_o :   out std_logic_vector(3 downto 0);
        blue_o  :   out std_logic_vector(3 downto 0);
        hsync_o :   out std_logic;
        vsync_o :   out std_logic);
        
end component top;

signal  clk_i   :   std_logic   :=  '0';
signal  sw5_i   :   std_logic   :=  '0';
signal  sw6_i   :   std_logic   :=  '0';
signal  sw7_i   :   std_logic   :=  '0';
signal  btn_i   :   std_logic_vector(3 downto 0)    :=  "0000";
signal  red_i   :   std_logic_vector(3 downto 0)    :=  "0000";
signal  green_i :   std_logic_vector(3 downto 0)    :=  "0000";
signal  blue_i  :   std_logic_vector(3 downto 0)    :=  "0000";
signal  hsync_o :   std_logic   :=  '1';
signal  vsync_o :   std_logic   :=  '1';

begin


end Behavioral;
