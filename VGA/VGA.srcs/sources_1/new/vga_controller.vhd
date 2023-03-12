----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2023 09:20:10
-- Design Name: 
-- Module Name: vga_controller - Behavioral
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

entity vga_controller is

    Port ( 
        pixel_clk_i : in  std_logic;
        vsync       : in  std_logic;
        hsync       : in  std_logic;
        R_o         : out std_logic_vector (3 downto 0);
        G_o         : out std_logic_vector (3 downto 0);
        B_o         : out std_logic_vector (3 downto 0);
        R_i         : in  std_logic;
        G_i         : in  std_logic;
        B_i         : in  std_logic);
        
end vga_controller;

architecture Behavioral of vga_controller is

begin

write_line: process(pixel_clk_i)
begin

    if falling_edge(pixel_clk_i) then
        R_o <= R_i & R_i & R_i & R_i;
        G_o <= G_i & G_i & G_i & G_i;
        B_o <= B_i & B_i & B_i & B_i;
    end if;

end process;

end Behavioral;
