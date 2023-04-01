----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2023 15:54:25
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
        clk_i           : in    std_logic;
        R_o             : out   std_logic_vector(3 downto 0);
        G_o             : out   std_logic_vector(3 downto 0);
        B_o             : out   std_logic_vector(3 downto 0);
        sw_i            : in    std_logic_vector(3 downto 0);
        btn_i           : in    std_logic_vector(3 downto 0);  
        hsync_o         : out   std_logic;
        vsync_o         : out   std_logic);
end top;

architecture Behavioral of top is

component vga_bitmap
       port (
       clka: IN std_logic;
       addra: IN std_logic_VECTOR(13 downto 0);
       douta: OUT std_logic_VECTOR(7 downto 0));
end component;

signal clka  : std_logic;
signal addra : std_logic_vector (13 downto 0);
signal douta : std_logic_vector (7  downto 0);

component timing_clk is
    Port ( 
        clk_i           : in    std_logic;
        pixel_clk_o     : out   std_logic;
        hsync_o         : out   std_logic;
        vsync_o         : out   std_logic); 
end component timing_clk;

signal hsync : std_logic;
signal vsync : std_logic;

signal pixel_clk_o  : std_logic;

component vga_controller is

    Port ( 
        clk_i   : in    std_logic;
        R_o     : out   std_logic_vector (3 downto 0);
        G_o     : out   std_logic_vector (3 downto 0);
        B_o     : out   std_logic_vector (3 downto 0);
        sw_i    : in    std_logic_vector (3 downto 0);
        btn_i   : in    std_logic_vector (3 downto 0);
        clk_p   : in    std_logic;
        hsync_i : in    std_logic;
        vsync_i : in    std_logic;
        addr_o  : out   std_logic_vector (13 downto 0);
        clk_o   : out   std_logic;
        data_i  : in    std_logic_vector (7 downto 0));
        
end component vga_controller;

signal  R_internal  :   std_logic_vector(3 downto 0);
signal  G_internal  :   std_logic_vector(3 downto 0);
signal  B_internal  :   std_logic_vector(3 downto 0);

begin

bitmap: vga_bitmap port map (
    clka        => clka,
    addra       => addra,
    douta       => douta);
                    
timings: timing_clk port map (
    clk_i       => clk_i,
    pixel_clk_o => pixel_clk_o,
    hsync_o     => hsync,
    vsync_o     => vsync);

vga_contr: vga_controller port map (
    clk_i   =>  clk_i,
    R_o     =>  R_internal,
    G_o     =>  G_internal,
    B_o     =>  B_internal,
    sw_i    =>  sw_i,
    btn_i   =>  btn_i,
    clk_p   =>  pixel_clk_o,
    hsync_i =>  hsync,
    vsync_i =>  vsync,
    addr_o  =>  addra,
    clk_o   =>  clka,
    data_i  =>  douta);

R_o <= R_internal when vsync = '1' else "0000";
G_o <= G_internal when vsync = '1' else "0000";
B_o <= B_internal when vsync = '1' else "0000";

vsync_o <= vsync;
hsync_o <= hsync;

end Behavioral;
