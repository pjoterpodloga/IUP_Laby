----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2023 09:36:35
-- Design Name: 
-- Module Name: file_handler - Behavioral
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

entity file_handler is
    
    Port (
        clk_i   : in    std_logic;
        R_o     : out   std_logic;
        G_o     : out   std_logic;
        B_o     : out   std_logic;
        sw_i    : in    std_logic_vector (3 downto 0);
        btn_i   : in    std_logic_vector (3 downto 0);
        clk_p   : in    std_logic;
        hsync_i : in    std_logic;
        vsync_i : in    std_logic;
        addr_o  : out   std_logic_vector (13 downto 0);
        clk_o   : out   std_logic;
        data_i  : in    std_logic_vector (7 downto 0));
        
end file_handler;

architecture Behavioral of file_handler is

--subtype DWORD   is std_logic_vector (31 downto 0);
--subtype WORD    is std_logic_vector (15 downto 0);
--subtype HWORD   is std_logic_vector (7  downto 0);

--type BMP_Header is record
--    Signature   :   WORD;
--    FileSize    :   DWORD;
--    DataOffset  :   DWORD; 
--end record BMP_Header;

--type BMP_Info is record
--    Size        :   DWORD;
--    Width       :   DWORD;
--    Height      :   DWORD;
--    Planes      :   WORD;
--    BitCount    :   WORD;
--    Compression :   DWORD;
--    ImageSize   :   DWORD;
--    XpixelsPerM :   DWORD;
--    YpixelsPerM :   DWORD;
--    ColorsUsed  :   DWORD;
--    ColorsImp   :   DWORD;
--    CT_Red      :   HWORD;
--    CT_Green    :   HWORD;
--    CT_Blue     :   HWORD;
--end record BMP_Info;

--type header_enum is (H_WAIT, H_SIG0, H_SIG1, H_FS, H_DO, H_END);

--signal header_state : header_enum := H_WAIT;

--signal header   : BMP_header;
--signal info     : BMP_Info;

alias pixel_H : std_logic_vector(3 downto 0) is data_i(7 downto 4);
alias pixel_L : std_logic_vector(3 downto 0) is data_i(3 downto 0);

constant BMP_FILE_H_OFFSET  :   natural := 14;
constant BMP_FILE_IH_OFFSET :   natural := 54;
constant BITS_PER_PXIEL     :   natural := 4;

constant DISPLAY_HEIGHT     :   natural := 640;
constant DISPLAY_WIDTH      :   natural := 480;

constant IMAGE_HEIGHT       :   natural := 96;
constant IMAGE_WIDTH        :   natural := 256;

constant IMAGE_MAX_X_OFFSET :   natural := DISPLAY_WIDTH  - IMAGE_WIDTH;
constant IMAGE_MAX_Y_OFFSET :   natural := DISPLAY_HEIGHT - IMAGE_HEIGHT;

constant READS_PER_LINE     :   natural := IMAGE_WIDTH / 2;

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
    end if;

    return RGB_o;
end;

type color_array is array (IMAGE_WIDTH downto 0) of std_logic_vector(2 downto 0);
-- 0: Red | 1: Green | 2: Blue
type bg_img_enum is (background, image);

signal bg_img_state : bg_img_enum;

signal C_array :    color_array;

signal pixel_it : natural := 0;

signal X_disp   : natural := 0;
signal Y_disp   : natural := 0;

signal X_img    : natural := 0;
signal Y_img    : natural := 0;

signal s_load   : std_logic;
signal r_load   : std_logic;

signal bg_color : std_logic_vector (2 downto 0);

signal image_load_en : std_logic := '0';

signal file_count   : natural := 0;
signal r_file_count : std_logic := '0';

begin

line_count: process(clk_i, file_count)
begin

    if r_file_count = '1' then
        file_count <= 0;
    elsif rising_edge(clk_i) then
        if file_count /= IMAGE_WIDTH then
            file_count <= file_count + 1;
        end if;
    end if;

end process;

image_detect: process(X_disp, Y_disp, X_img, Y_img)
begin

    if rising_edge(clk_p) then
        if (X_disp >= X_img and X_disp < X_img + IMAGE_WIDTH)  or
           (Y_disp >= Y_img and Y_disp < Y_img + IMAGE_HEIGHT) then
            bg_img_state <= image;
        else
            bg_img_state <= background;
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

load_data: process(s_load, r_load)
begin

    if rising_edge(s_load) then  

        C_array(pixel_it) <= color_select(data_i(7 downto 4));
        C_array(pixel_it + 1) <= color_select(data_i(3 downto 0));
            
    end if;
    
end process;

clk_o  <= clk_i;
addr_o <= std_logic_vector(to_unsigned(BMP_FILE_IH_OFFSET + X_img + (Y_img * READS_PER_LINE), addr_o'length));

bg_color <=     "110"   when    sw_i = "000"    else
                "110"   when    sw_i = "001"    else
                "010"   when    sw_i = "010"    else
                "011"   when    sw_i = "011"    else
                "001"   when    sw_i = "100"    else
                "101"   when    sw_i = "101"    else
                "111"   when    sw_i = "110"    else    "000";                

R_o <= C_array(X_disp)(0)   when    bg_img_state = image    else    bg_color(0);
G_o <= C_array(X_disp)(1)   when    bg_img_state = image    else    bg_color(1);
B_o <= C_array(X_disp)(2)   when    bg_img_state = image    else    bg_color(2);

end Behavioral;
