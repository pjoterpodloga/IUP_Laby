----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2023 10:40:24
-- Design Name: 
-- Module Name: rs232_controller - Behavioral
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

entity rs232_controller is
    Port (  RXD_i : in std_logic;
            TXD_o : out std_logic;
            RX_trig : in std_logic;
            TX_trig : in std_logic;
            clk_i   : in std_logic;
            clk_en  : out std_logic;
            clk_baud : in std_logic;
            data_o : out std_logic_vector (7 downto 0);
            data_i : in  std_logic_vector (7 downto 0));
end rs232_controller;

architecture Behavioral of rs232_controller is

begin


end Behavioral;
