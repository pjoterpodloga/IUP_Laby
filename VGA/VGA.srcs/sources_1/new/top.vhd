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
--  Port ( );
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
        hsync           : out   std_logic;
        vsync           : out   std_logic); 
end component timing_clk;

signal clk_i        : std_logic;
signal pixel_clk_o  : std_logic;
signal hsync        : std_logic;
signal vsync        : std_logic;

begin

bitmap: vga_bitmap port map (
    clka        => clka,
    addra       => addra,
    douta       => douta);
                    
timings: timing_clk port map (
    clk_i       => clk_i,
    pixel_clk_o => pixel_clk_o,
    hsync       => hsync,
    vsync       => vsync);


end Behavioral;
