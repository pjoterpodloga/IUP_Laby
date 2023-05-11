----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.05.2023 20:03:01
-- Design Name: 
-- Module Name: vga_image_module - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga_image_module is

    Port (
        clk_i   :   in std_logic;
        clk_p   :   in std_logic;
        vsync_i :   in std_logic;
        sw_i    :   in std_logic_vector(2 downto 0);
        btn_i   :   in std_logic_vector(3 downto 0);
        red_o   :   out std_logic;
        green_o :   out std_logic;
        blue_o  :   out std_logic);
        
end vga_image_module;

architecture Behavioral of vga_image_module is

component vga_bitmap
       port (
       clka: IN std_logic;
       addra: IN std_logic_VECTOR(13 downto 0);
       douta: OUT std_logic_VECTOR(7 downto 0));
end component;

type bg_image_enum is (background, image);

constant    IMAGE_WIDTH     :   natural :=  256;
constant    IMAGE_HEIGHT    :   natural :=  96;

constant    DISPLAY_WIDTH   :   natural :=  640;
constant    DISPLAY_HEIGHT  :   natural :=  480;

constant    MAX_IMAGE_W     :   natural :=  DISPLAY_WIDTH  - IMAGE_WIDTH;
constant    MAX_IMAGE_H     :   natural :=  DISPLAY_HEIGHT - IMAGE_HEIGHT;

constant    IMAGE_SIZE      :   natural :=  IMAGE_WIDTH * IMAGE_HEIGHT / 2;

signal  image_x :   natural range MAX_IMAGE_W downto 0  :=  0;
signal  image_y :   natural range MAX_IMAGE_H downto 0  :=  0;

signal  display_x   :   natural range DISPLAY_WIDTH  downto 0   :=  0;
signal  display_y   :   natural range DISPLAY_HEIGHT downto 0   :=  0;

signal  img_state   :   bg_image_enum;

signal address  :   std_logic_vector(13 downto 0)   :=  (others => '0');
signal data     :   std_logic_vector(7 downto  0)   :=  (others => '0');

signal last_vsync   :   std_logic   := '0';

signal last_xy  :   std_logic   :=  '0';

signal img_pixel:   std_logic_vector(3 downto 0);
signal bg_pixel :   std_logic_vector(3 downto 0);

signal color    :   std_logic_vector(2 downto  0)   :=  (others => '0');

signal q_pixel  :   natural range 2 downto 0        :=  0;

signal pixel    :   std_logic_vector(3 downto 0);

signal pixel_it :   natural range 2*IMAGE_SIZE downto 0 :=  0;
signal last_p   :   std_logic   :=  '0';

begin

memory: vga_bitmap
    PORT MAP (
        clka    =>  clk_i,
        addra   =>  address,
        douta   =>  data);

pixel_counting: process(clk_i)
begin

    if rising_edge(clk_i) then
    
        if clk_p = '0' then
            last_p  <= '0';
    
        elsif (img_state = image) and (last_p /= clk_p) then
            last_p  <=  '0';
            
            q_pixel <= q_pixel + 1;
            
            pixel_it <= pixel_it + 1;
            
            display_x <= display_x + 1;
            
            if display_x = DISPLAY_WIDTH then
                display_x <= 0;
                display_y <= display_y + 1;
            end if;
            
            if display_y = DISPLAY_HEIGHT then
                display_y <= 0;
            end if;
            
            if q_pixel = 1 then
                q_pixel <= 0;
            end if;
            
            if pixel_it = IMAGE_SIZE then
                pixel_it <= 0;
            end if;
            
        end if;
    
    end if;
end process;

bg_img_state_switching: process(clk_i)
begin

    if rising_edge(clk_i) then
    
        if (display_x >= image_x) and (display_x <= image_x + IMAGE_WIDTH)
            and (display_y >= image_y) and (display_y <= image_y + IMAGE_HEIGHT) then
            img_state <= image;
        else
            img_state <= background;
        end if;
        
    end if;

end process;

image_move: process(clk_i)
begin

    if rising_edge(clk_i) then
        
        if vsync_i = '1' then
            last_vsync <= '1';
        elsif vsync_i /= last_vsync then
            if (btn_i(0) = '1') and (image_x /= 0) then
                image_x <= image_x - 1;
            elsif (btn_i(1) = '1') and (image_y /= 0) then
                image_y <= image_y - 1;
            elsif (btn_i(2) = '1') and (image_y /= MAX_IMAGE_H) then
                image_y <= image_y + 1;
            elsif (btn_i(3) = '1') and (image_x /= MAX_IMAGE_W) then
                image_x <= image_x + 1;
            end if;
        end if;
    end if;

end process;

address <= std_logic_vector(to_unsigned(pixel_it, address'length));

img_pixel   <= data(7 downto 4) when q_pixel = 0 else data(3 downto 0);
bg_pixel    <=  x"9"    when sw_i = "000" else
                x"A"    when sw_i = "001" else
                x"B"    when sw_i = "010" else
                x"C"    when sw_i = "011" else
                x"D"    when sw_i = "100" else
                x"E"    when sw_i = "101" else
                x"F"    when sw_i = "110" else x"0";

pixel <= img_pixel  when    img_state = image   else    bg_pixel;

color <=    "000"   when    pixel = x"0"    else    -- black
            "100"   when    pixel = x"9"    else    -- red
            "010"   when    pixel = x"A"    else    -- green
            "110"   when    pixel = x"B"    else    -- yellow
            "001"   when    pixel = x"C"    else    -- blue
            "101"   when    pixel = x"D"    else    -- magenta
            "011"   when    pixel = x"E"    else    -- cyan
            "111"   when    pixel = x"F"    else    -- white
            "000";

red_o   <=  color(2);
green_o <=  color(1);
blue_o  <=  color(0);

end Behavioral;
