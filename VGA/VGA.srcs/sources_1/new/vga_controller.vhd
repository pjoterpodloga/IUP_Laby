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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga_controller is

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
        
end vga_controller;

architecture Behavioral of vga_controller is

alias pixel_H : std_logic_vector(3 downto 0) is data_i(7 downto 4);
alias pixel_L : std_logic_vector(3 downto 0) is data_i(3 downto 0);

constant BMP_FILE_IH_OFFSET :   natural := 118;
constant BITS_PER_PXIEL     :   natural := 4;

constant DISPLAY_HEIGHT     :   natural := 640;
constant DISPLAY_WIDTH      :   natural := 480;

constant IMAGE_HEIGHT       :   natural := 96;
constant IMAGE_WIDTH        :   natural := 256;

constant IMAGE_MAX_X_OFFSET :   natural := DISPLAY_WIDTH  - IMAGE_WIDTH;
constant IMAGE_MAX_Y_OFFSET :   natural := DISPLAY_HEIGHT - IMAGE_HEIGHT;

constant IMAGE_SIZE         :   natural := IMAGE_WIDTH * IMAGE_HEIGHT / 2;

function color_select(img_data: in std_logic_vector(3 downto 0)) 
    return std_logic_vector is variable RGB_o : std_logic_vector(2 downto 0);  
begin

     if img_data = x"0" then
         RGB_o(0) :=  '0';
         RGB_o(1) :=  '0';
         RGB_o(2) :=  '0';
    elsif img_data = x"9" then
         RGB_o(0) :=  '1';
         RGB_o(1) :=  '0';
         RGB_o(2) :=  '0';
    elsif img_data = x"A" then
         RGB_o(0) :=  '0';
         RGB_o(1) :=  '1';
         RGB_o(2) :=  '0';
    elsif img_data = x"B" then
         RGB_o(0) :=  '1';
         RGB_o(1) :=  '1';
         RGB_o(2) :=  '0';
    elsif img_data = x"C" then
         RGB_o(0) :=  '0';
         RGB_o(1) :=  '0';
         RGB_o(2) :=  '1';
    elsif img_data = x"D" then
         RGB_o(0) :=  '1';
         RGB_o(1) :=  '0';
         RGB_o(2) :=  '1';
    elsif img_data = x"E" then
         RGB_o(0) :=  '0';
         RGB_o(1) :=  '1';
         RGB_o(2) :=  '1';
    elsif img_data = x"F" then
         RGB_o(0) :=  '1';
         RGB_o(1) :=  '1';
         RGB_o(2) :=  '1';
    else
         RGB_o(0) :=  '0';
         RGB_o(1) :=  '0';
         RGB_o(2) :=  '0';
    end if;

    return RGB_o;
end;

type bg_img_enum is (background, image);

signal bg_img_state : bg_img_enum;

signal bg_color : std_logic_vector (2 downto 0);

signal pixel_it : natural range IMAGE_SIZE downto 0 := 0;

signal X_disp   : natural range DISPLAY_WIDTH  downto 0 := 0;
signal Y_disp   : natural range DISPLAY_HEIGHT downto 0 := 0;

signal X_img    : natural range IMAGE_WIDTH  downto 0 := 0;
signal Y_img    : natural range IMAGE_HEIGHT downto 0 := 0;

signal pixel_color : std_logic_vector (2 downto 0);

constant CDIV   : natural := 2;

signal clk_pixel    :   std_logic;
signal c_pixel      :   natural range 2*CDIV downto 0 := 0;
signal n_pixel      :   natural range 2*CDIV downto 0 := 0;
signal c_last_state :   std_logic   := '0';
signal c_diff       :   std_logic;

begin

c_diff <= clk_p xor c_last_state;

div_clk_p: process(c_diff, c_pixel)
begin

    if c_pixel = 2*CDIV then
        c_pixel <= 0;
    elsif rising_edge(c_diff) then
        c_last_state <= clk_p;
        c_pixel <= n_pixel;
    end if;
    
end process;

n_pixel     <= c_pixel + 1;
clk_pixel   <= '0'    when c_pixel < CDIV else    '1';

X_disp_inc: process(clk_p, hsync_i)
begin

    if hsync_i = '0' then
        X_disp <= 0;
    elsif rising_edge(clk_p) then
        X_disp <= X_disp + 1;
    end if;

end process;

Y_disp_inc: process(hsync_i, vsync_i)
begin

    if vsync_i = '0' then
        Y_disp <= 0;
    elsif falling_edge(hsync_i) then
        Y_disp <= Y_disp + 1;
    end if;

end process;

Pixel_count: process(clk_pixel, pixel_it)
begin

    if pixel_it = IMAGE_SIZE then
        pixel_it <= 0;
    elsif rising_edge(clk_pixel) then
        if  bg_img_state = image then
            pixel_it <= pixel_it + 1;
        end if;
    end if;

end process;

move_image: process(vsync_i, btn_i)
begin

    if falling_edge(vsync_i) then
        if btn_i(0) = '1' then
            if X_img /= 0 then
                X_img <= X_img - 1;
            end if;
        elsif btn_i(1) = '1' then
            if Y_img /= 0 then
                Y_img <= Y_img - 1;
            end if;           
        elsif btn_i(2) = '1' then
            if Y_img /= IMAGE_MAX_Y_OFFSET then
                Y_img <= Y_img + 1;
            end if; 
        elsif btn_i(3) = '1' then    
            if X_img /= IMAGE_MAX_X_OFFSET then
                X_img <= X_img + 1;
            end if;
        end if;
    end if;

end process;

Img_bg_select: process(clk_i, X_disp, Y_disp, X_img, Y_img)
begin

    if rising_edge(clk_i) then
        if (X_disp >= X_img and X_disp < X_img + IMAGE_WIDTH)  and
           (Y_disp >= Y_img and Y_disp < Y_img + IMAGE_HEIGHT) then
            bg_img_state <= image;
        else
            bg_img_state <= background;
        end if;
    end if;

end process;



clk_o  <= clk_i;
addr_o <= std_logic_vector(to_unsigned(BMP_FILE_IH_OFFSET + pixel_it, addr_o'length));

bg_color <=     "110"   when    sw_i = "000"    else
                "110"   when    sw_i = "001"    else
                "010"   when    sw_i = "010"    else
                "011"   when    sw_i = "011"    else
                "001"   when    sw_i = "100"    else
                "101"   when    sw_i = "101"    else
                "111"   when    sw_i = "110"    else    "000";
                
pixel_color <= color_select(data_i(7 downto 4))   when c_pixel < CDIV else color_select(data_i(3 downto 0));                

R_o <= (others => pixel_color(2))   when    bg_img_state = image    else    (others => bg_color(2));
G_o <= (others => pixel_color(1))   when    bg_img_state = image    else    (others => bg_color(1));
B_o <= (others => pixel_color(0))   when    bg_img_state = image    else    (others => bg_color(0));

end Behavioral;
