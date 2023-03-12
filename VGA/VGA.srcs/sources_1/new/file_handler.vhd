----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2023 09:36:35
-- Design Name: 
-- Module Name: file_handler - Behavioral
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

entity file_handler is
    
    Port (
        clk_i   : in  std_logic;
        R_o     : out std_logic;
        G_o     : out std_logic;
        B_o     : out std_logic;
        sw_i    : in std_logic_vector (3 downto 0);
        adrr_o  : out std_logic_vector (13 downto 0);
        clk_o   : out std_logic;
        data_o  : in  std_logic_vector (7 downto 0));
        
end file_handler;

architecture Behavioral of file_handler is

constant bmp_file_h_offset  : natural := 54;
constant bits_per_pixel     : natural := 4;

begin


end Behavioral;
