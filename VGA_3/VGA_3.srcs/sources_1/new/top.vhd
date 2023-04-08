----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2023 14:36:04
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
        sw5_i   :   in  std_logic;
        sw6_i   :   in  std_logic;
        sw7_i   :   in  std_logic;
        btn_i   :   in  std_logic_vector(3 downto 0);
        red_o   :   out std_logic_vector(3 downto 0);
        green_o :   out std_logic_vector(3 downto 0);
        blue_o  :   out std_logic_vector(3 downto 0);
        hsync_o :   out std_logic;
        vsync_o :   out std_logic);
        
end top;

architecture Behavioral of top is

component vga_bitmap IS

  PORT (
    clka    : IN    STD_LOGIC;
    addra   : IN    STD_LOGIC_VECTOR(13 DOWNTO 0);
    douta   : OUT   STD_LOGIC_VECTOR(7 DOWNTO 0));
    
end component vga_bitmap;

component timing_clk is
    Generic (
        CLK_I_FREQ    :   natural :=  100E6);
        
    Port (
        clk_i       :   in  std_logic;
        pixel_clk_o :   out std_logic;
        hsync_o     :   out std_logic;
        vsync_o     :   out std_logic;
        q_pixel_o   :   out natural range 4 downto 0);
end component timing_clk;

component vga_controller is

    Port ( 
        clk_i   :   in  std_logic;
        clk_p   :   in  std_logic;
        pixel_i :   in  natural range 4 downto 0;   
        hsync_i :   in  std_logic;
        vsync_i :   in  std_logic;
        btn_i   :   in  std_logic_vector(3 downto 0);
        sw_i    :   in  std_logic_vector(2 downto 0);
        data_i  :   in  std_logic_vector(7 downto 0);
        R_o     :   out std_logic_vector(3 downto 0);
        G_o     :   out std_logic_vector(3 downto 0);
        B_o     :   out std_logic_vector(3 downto 0);
        clk_o   :   out std_logic;
        addr_o  :   out std_logic_vector(13 downto 0));
        
end component vga_controller;

constant    CLK_I_FREQ  :   natural :=  100E6;

signal  pixel_clk       :   std_logic;
signal  q_pixel         :   natural range 4 downto 0;

signal  sw_i    :   std_logic_vector(2 downto 0);

signal hsync    :   std_logic;
signal vsync    :   std_logic;

signal clk      :   std_logic;
signal data     :   std_logic_vector(7  downto 0);
signal addr     :   std_logic_vector(13 downto 0);

begin

timing_clock: timing_clk
    Generic map (
        CLK_I_FREQ  =>  CLK_I_FREQ)
        
    Port map (
        clk_i       =>  clk_i,
        pixel_clk_o =>  pixel_clk,
        hsync_o     =>  hsync,
        vsync_o     =>  vsync,
        q_pixel_o   =>  q_pixel);
        
vga_contr: vga_controller
    Port map( 
        clk_i   =>  clk_i,
        clk_p   =>  pixel_clk,
        pixel_i =>  q_pixel,
        hsync_i =>  hsync,
        vsync_i =>  vsync,
        btn_i   =>  btn_i,
        sw_i    =>  sw_i,
        data_i  =>  data,
        R_o     =>  red_o,
        G_o     =>  green_o,
        B_o     =>  blue_o,
        clk_o   =>  clk,
        addr_o  =>  addr);

bmp_file: vga_bitmap
    Port map(
        clka    =>  clk,
        addra   =>  addr,
        douta   =>  data);

sw_i    <=  sw5_i & sw6_i & sw7_i;

hsync_o <=  hsync;
vsync_o <=  vsync;

end Behavioral;
