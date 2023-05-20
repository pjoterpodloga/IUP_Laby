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
        
end vga_image_module;

architecture Behavioral of vga_image_module is

function data2color(data : std_logic_vector(3 downto 0))
    return std_logic_vector is variable color : std_logic_vector(2 downto 0);
    
begin

-- color structure
--                red
--              /       green
--              |      /       blue
--              |      |      /  
--              |      |      |
--  color => (bit_2, bit_1, bit_0)

    if    data = x"0" then
        color := "000";     -- black
    elsif data = x"9" then
        color := "100";     -- red
    elsif data = x"A" then
        color := "010";     -- green
    elsif data = x"B" then
        color := "110";     -- yellow
    elsif data = x"C" then
        color := "001";     -- blue
    elsif data = x"D" then
        color := "101";     -- magenta
    elsif data = x"E" then
        color := "011";     -- cyan
    elsif data = x"F" then
        color := "111";     -- white
    else
        color := "000";     -- black
    end if;

    return color;

end function;

component vga_bitmap
       port (
       clka: IN std_logic;
       addra: IN std_logic_VECTOR(13 downto 0);
       douta: OUT std_logic_VECTOR(7 downto 0));
end component;

type bg_image_enum is (background, image);

constant    PIXEL_PER_BYTE  :   natural :=  2;

constant    IMAGE_WIDTH     :   natural :=  256;
constant    IMAGE_HEIGHT    :   natural :=  96;

constant    DISPLAY_WIDTH   :   natural :=  640;
constant    DISPLAY_HEIGHT  :   natural :=  480;

constant    MAX_IMAGE_W     :   natural :=  DISPLAY_WIDTH  - IMAGE_WIDTH;
constant    MAX_IMAGE_H     :   natural :=  DISPLAY_HEIGHT - IMAGE_HEIGHT;

constant    IMAGE_SIZE      :   natural :=  IMAGE_WIDTH * IMAGE_HEIGHT / PIXEL_PER_BYTE;

type    display_state_enum  is  (DISPLAY_BG, DISPLAY_IMG);

signal  display_x   :   natural range DISPLAY_WIDTH  downto 0   :=  0;
signal  display_y   :   natural range DISPLAY_HEIGHT downto 0   :=  0;

signal  last_disp_x :   std_logic   :=  '0';

signal  image_x     :   natural range IMAGE_WIDTH    downto 0   := 0;
signal  image_y     :   natural range IMAGE_HEIGHT   downto 0   := 0;

signal  image_pos_x :   natural range MAX_IMAGE_W    downto 0   :=  (DISPLAY_WIDTH  - IMAGE_WIDTH ) / 2;
signal  image_pos_y :   natural range MAX_IMAGE_H    downto 0   :=  (DISPLAY_HEIGHT - IMAGE_HEIGHT) / 2;

signal  last_img_x  :   std_logic   :=  '0';
signal  last_vsync  :   std_logic   :=  '1';

signal  display_state   :   display_state_enum  :=  DISPLAY_BG;

signal  q_pixel     :   natural range PIXEL_PER_BYTE    downto 0   :=  0;
signal  pixel_it    :   natural range IMAGE_SIZE        downto 0   :=  0;
signal  address     :   std_logic_vector(13 downto 0);

signal  data        :   std_logic_vector(7 downto 0)    :=  (others => '0');

signal  bg_color    :   std_logic_vector(2 downto 0)    :=  (others => '0');
signal  img_color   :   std_logic_vector(2 downto 0)    :=  (others => '0');

begin

memory: vga_bitmap
    PORT MAP (
        clka    =>  clk_i,
        addra   =>  address,
        douta   =>  data);
        
display_counting: process(clk_i)
begin

    if rising_edge(clk_i) then
    
        if clk_p = '0' then
            last_disp_x <= '0';
        elsif clk_p /= last_disp_x and h_active_i = '1' then
            last_disp_x <= '1';    
            
            display_x <= display_x + 1;
            
        end if;
        
        if display_x = DISPLAY_WIDTH then
            display_x <= 0;
            display_y <= display_y + 1;
        end if;
    
        if h_active_i = '0' then
            display_x <= 0;
        end if;
        
        if v_active_i = '0' then
            display_y <= 0;
        end if;
    
    end if;

end process;

image_counting: process(clk_i)
begin

    if rising_edge(clk_i) then
    
        if display_state = DISPLAY_IMG then
        
            if clk_p = '0' then
                last_img_x <= '0';
                
            elsif clk_p /= last_img_x and h_active_i = '1' then
                last_img_x <= '1';
                
                q_pixel <= q_pixel + 1;
                
                image_x <= image_x + 1;
                
            end if;
        
        end if;
        
        if image_x = IMAGE_WIDTH then
            image_x <= 0;
            image_y <= image_y + 1;
        end if;
        
        if image_y = IMAGE_HEIGHT then
            image_y <= 0;
        end if;
        
        if q_pixel = PIXEL_PER_BYTE then
            q_pixel <= 0;
            pixel_it <= pixel_it + 1;
        end if;
        
        if h_active_i = '0' then
            q_pixel <= 0;
            pixel_it <= 0;
        end if;
        
        if v_active_i = '0' then
            image_x <= 0;
            image_y <= 0;
        end if;
    
    end if;

end process;

display_state_switch: process(clk_i)
begin

    if rising_edge(clk_i) then
    
        if  (display_x >= image_pos_x) and (display_x < image_pos_x + IMAGE_WIDTH) and
            (display_y >= image_pos_y) and (display_y < image_pos_y + IMAGE_HEIGHT) then
            
            display_state <= DISPLAY_IMG;
            
        else
        
            display_state <= DISPLAY_BG;
        end if;
    
    end if;

end process;

image_move: process(clk_i)
begin

    if rising_edge(clk_i) then
    
        if vsync_i = '1' then
            last_vsync <= '1';
            
        elsif vsync_i /= last_vsync then
            last_vsync <= '0';
            
            if    (btn_i(3) = '1' and image_pos_x /= 0) then
                image_pos_x <= image_pos_x - 1;                             -- left
            elsif (btn_i(2) = '1' and image_pos_y /= 0) then
                image_pos_y <= image_pos_y - 1;                             -- down
            elsif (btn_i(1) = '1' and image_pos_y /= MAX_IMAGE_H) then
                image_pos_y <= image_pos_y + 1;                             -- up
            elsif (btn_i(0) = '1' and image_pos_x /= MAX_IMAGE_W) then
                image_pos_x <= image_pos_x + 1;                             -- right
            end if;
            
        end if;
    
    end if;

end process;

set_img_pixel: process(clk_i)
begin

    if rising_edge(clk_i) then
    
        bg_color    <=  sw_i;
    
        if q_pixel = 0 then
            img_color <= data2color(data(7 downto 4));
        elsif q_pixel = 1 then
            img_color <= data2color(data(3 downto 0));
        end if;
        
    end if;

end process;

address <= std_logic_vector(to_unsigned(pixel_it, address'length));

red_o   <=  img_color(2) when display_state = DISPLAY_IMG else bg_color(2);
green_o <=  img_color(1) when display_state = DISPLAY_IMG else bg_color(1);
blue_o  <=  img_color(0) when display_state = DISPLAY_IMG else bg_color(0);

end Behavioral;
