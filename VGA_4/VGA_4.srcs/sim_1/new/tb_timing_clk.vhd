----------------------------------------------------------------------------------
-- Company: 
-- Engineer:  Piotr Buluk, Jakub Cichocki
-- 
-- Create Date: 11.05.2023 10:04:37
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

component timing_module is
    Generic (
        CLK_IN      :   natural := 100E6);
        
    Port ( 
        clk_i       :   in  std_logic;
        rst_i       :   in  std_logic;
        pixel_clk_i :   in  std_logic;        
        h_video_a_o :   out std_logic;
        v_video_a_o :   out std_logic;
        hsync_o     :   out std_logic;
        vsync_o     :   out std_logic);
end component timing_module;

constant    CLK_IN      :   natural     :=  100E6;
constant    PERIOD      :   time        :=  (1.0E12/real(CLK_IN)) * 1ps;

constant    PIXEL_PERIOD:   time        :=  (1.0E12/25.0E6) * 1ps;

signal clk_i        :   std_logic   :=  '0';
signal rst_i        :   std_logic   :=  '0';
signal pixel_clk_i  :   std_logic   :=  '0';
signal h_video_a_o  :   std_logic   :=  '0';
signal v_video_a_o  :   std_logic   :=  '0';
signal hsync_o      :   std_logic   :=  '1';
signal vsync_o      :   std_logic   :=  '1';

begin

dut: timing_module
    GENERIC MAP (
        CLK_IN  =>  CLK_IN)
        
    PORT MAP (
        clk_i   =>  clk_i,
        rst_i   =>  rst_i,
        pixel_clk_i =>  pixel_clk_i,
        h_video_a_o =>  h_video_a_o,
        v_video_a_o =>  v_video_a_o,
        hsync_o =>  hsync_o,
        vsync_o =>  vsync_o);
        
clk_i   <=  not clk_i after PERIOD/2;
pixel_clk_i <=  not pixel_clk_i after PIXEL_PERIOD/2;

stim: process
begin


wait;
end process;

end Behavioral;
