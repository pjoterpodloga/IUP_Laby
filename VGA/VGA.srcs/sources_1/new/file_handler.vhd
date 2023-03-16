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


signal Y_line   :   natural := 0;

signal X_disp   :   natural := 0;
signal Y_disp   :   natural := 0;

signal v_reset  :   std_logic;
signal h_reset  :   std_logic;
signal h_load   :   std_logic;

type color_array is array (IMAGE_WIDTH downto 0) of std_logic_vector(2 downto 0);
-- 0: Red | 1: Green | 2: Blue

signal C_array :    color_array;

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

begin

inc_X_disp: process(clk_p, h_reset)
begin

    if h_reset = '1' then
        X_disp <= 0;
    elsif falling_edge(clk_p) then
        X_disp <= X_disp + 1;
    end if;
end process;

inc_Y_disp: process(hsync_i, v_reset)
begin

    if v_reset = '1' then
        Y_disp <= 0;
    elsif falling_edge(hsync_i) then
        Y_disp <= Y_disp + 1;
    end if;
end process;

vsync_reset: process(vsync_i, hsync_i)
begin

    if hsync_i = '0' then
        v_reset <= '0';
    elsif falling_edge(vsync_i) then
        v_reset <= '1';
    end if;

end process;

hsync_load: process(hsync_i)
begin

    if hsync_i = '1' then
        h_reset <= '1';
        h_load <= '0';
    elsif falling_edge(hsync_i) then
        h_reset <= '0';
        if Y_line /= IMAGE_HEIGHT then
            h_load <= '1';
        end if;
        
    end if;

end process;

load_line: process(clk_i, h_load, v_reset)
variable x : natural := 0;
variable c_it : natural range IMAGE_WIDTH downto 0 := 0;
variable c_data: std_logic_vector (3 downto 0);
begin

    if v_reset = '1' then
        Y_line <=  0;
    elsif rising_edge(h_load) then
    
        while x /= READS_PER_LINE loop
            addr_o <= std_logic_vector(to_unsigned(BMP_FILE_IH_OFFSET + x + Y_line * READS_PER_LINE, addr_o'length));        
            if clk_i = '0' then
                clk_o <= '0';
            
            elsif rising_edge(clk_i) then
                clk_o <= '1';
                
                for k in 0 to 1 loop
                    
                    if k = 0 then
                        c_data := pixel_L;
                    else
                        c_data := pixel_H;
                    end if;
                    
                    C_array(c_it) <= color_select(c_data);
                    
                    c_it := c_it + 1;
                end loop;
            
            end if;
            
        end loop;
    
    end if;

end process;

R_o <= C_array(X_disp)(0);
G_o <= C_array(X_disp)(1);
B_o <= C_array(X_disp)(2);

end Behavioral;
