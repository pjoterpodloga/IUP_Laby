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

component synchronizer_module is

    Port ( 
        clk_i   :   in  std_logic;
        rst_i   :   in  std_logic;
        d_in    :   in  std_logic_vector;
        d_out   :   out std_logic_vector);
        
end component synchronizer_module;

component clk_div is
    Generic (
        CLK_IN      :   natural :=  100E6;
        CLK_OUT     :   natural :=  10E6);
        
    Port ( 
        clk_i   :   in  std_logic;
        rst_i   :   in  std_logic;
        clk_o   :   out std_logic;
        q_out   :   out natural range CLK_IN/CLK_OUT downto 0);
end component clk_div;

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

component vga_image_module is

    Port (
        clk_i       :   in std_logic;
        clk_p       :   in std_logic;
        vsync_i     :   in std_logic;        
        h_active_i  :   in std_logic;
        v_active_i  :   in std_logic;
        sw_i        :   in std_logic_vector(2 downto 0);
        btn_i       :   in std_logic_vector(3 downto 0);
        red_o       :   out std_logic;
        green_o     :   out std_logic;
        blue_o      :   out std_logic);
        
end component vga_image_module;

constant    CLK_IN      :   natural :=  100E6;
constant    PIXEL_CLK   :   natural :=   25E6;

-- top
signal sw_i     :   std_logic_vector(2 downto 0);
signal hsync    :   std_logic;
signal vsync    :   std_logic; 

-- synchronizer
signal sw_sync  :   std_logic_vector(2 downto 0);
signal btn_sync :   std_logic_vector(btn_i'range);

-- pixel clock
signal clk_p    :   std_logic;
signal q_pixel  :   natural range 4 downto 0;

-- timing module
signal h_video_active :   std_logic;
signal v_video_active :   std_logic;

signal red   :  std_logic;
signal green :  std_logic;
signal blue  :  std_logic;

begin

sw_i <= sw5_i & sw6_i & sw7_i;
sync_sw:    synchronizer_module PORT MAP ( clk_i => clk_i, rst_i => '0', d_in => sw_i, d_out => sw_sync);

sync_btn:   synchronizer_module PORT MAP ( clk_i => clk_i, rst_i => '0', d_in => btn_i, d_out => btn_sync);

pixel_clock: clk_div
    GENERIC MAP(
        CLK_IN  =>  CLK_IN,
        CLK_OUT =>  PIXEL_CLK)
    
    PORT MAP(
        clk_i   =>  clk_i,
        rst_i   =>  '0',
        clk_o   =>  clk_p,
        q_out   =>  q_pixel);

timing_m:   timing_module 
    GENERIC MAP(
        CLK_IN      =>  CLK_IN)
        
    PORT MAP(
        clk_i       =>  clk_i,
        rst_i       =>  '0',
        pixel_clk_i =>  clk_p,
        h_video_a_o =>  h_video_active,
        v_video_a_o =>  v_video_active,
        hsync_o     =>  hsync,
        vsync_o     =>  vsync);

vga_module:     vga_image_module
    PORT MAP (
        clk_i       =>  clk_i,
        clk_p       =>  clk_p,
        vsync_i     =>  vsync,
        h_active_i  =>  h_video_active,
        v_active_i  =>  v_video_active,
        sw_i        =>  sw_sync,
        btn_i       =>  btn_sync,
        red_o       =>  red,
        green_o     =>  green,
        blue_o      =>  blue);

red_o   <=  (others => red)     when h_video_active = '1' else (others => '0');
green_o <=  (others => green)   when h_video_active = '1' else (others => '0');
blue_o  <=  (others => blue)    when h_video_active = '1' else (others => '0');    

hsync_o <=  hsync;
vsync_o <=  vsync;

end Behavioral;
