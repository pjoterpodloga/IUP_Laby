----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2023 12:18:26
-- Design Name: 
-- Module Name: tb_timing_clk - Behavioral
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

entity tb_timing_clk is
--  Port ( );
end tb_timing_clk;

architecture Behavioral of tb_timing_clk is

component timing_clk is
    
    Port ( 
        clk_i           : in    std_logic;
        pixel_clk_o     : out   std_logic;
        hsync           : out   std_logic;
        vsync           : out   std_logic);
        
end component timing_clk;

signal clk_i           : std_logic := '0';
signal pixel_clk_o     : std_logic := '0';
signal hsync           : std_logic := '0';
signal vsync           : std_logic := '0';

begin

dut: timing_clk port map (
    clk_i => clk_i,
    pixel_clk_o => pixel_clk_o,
    hsync => hsync,
    vsync => vsync);

clk_i <= not clk_i after 5ns;

stim: process
begin
    
wait;

end process;

end Behavioral;
