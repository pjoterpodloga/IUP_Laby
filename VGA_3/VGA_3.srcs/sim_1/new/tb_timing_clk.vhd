----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2023 18:16:48
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
    Generic (
        CLK_I_FREQ    :   natural :=  100E6);
        
    Port (
        clk_i       :   in  std_logic;
        pixel_clk_o :   out std_logic;
        hsync_o     :   out std_logic;
        vsync_o     :   out std_logic;
        q_pixel_o   :   out std_logic_vector(2 downto 0));
end component timing_clk;

constant    FREQ_IN :   natural :=  100E6;
constant    PERIOD  :   time    :=  (1.0E12/real(FREQ_IN)) * 1ps;

signal clk_i        :   std_logic   :=  '0';
signal pixel_clk_o  :   std_logic   :=  '0';
signal hsync_o      :   std_logic   :=  '0';
signal vsync_o      :   std_logic   :=  '0';
signal q_pixel_o    :   std_logic_vector(2 downto 0)    :=  "000";

begin

clk_i <= not clk_i after PERIOD/2;

dut: timing_clk
    Generic map (
        CLK_I_FREQ  =>  FREQ_IN)
        
    Port map (
        clk_i       =>  clk_i,
        pixel_clk_o =>  pixel_clk_o,
        hsync_o     =>  hsync_o,
        vsync_o     =>  vsync_o,
        q_pixel_o   =>  q_pixel_o);

stim: process
begin

wait;
end process;

end Behavioral;
