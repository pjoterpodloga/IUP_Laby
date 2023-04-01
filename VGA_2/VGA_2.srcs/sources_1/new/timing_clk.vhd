----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2023 10:27:14
-- Design Name: 
-- Module Name: timing_clk - Behavioral
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

entity timing_clk is
    
    Port ( 
        clk_i           : in    std_logic;
        pixel_clk_o     : out   std_logic;
        hsync_o         : out   std_logic;
        vsync_o         : out   std_logic);
        
end timing_clk;

architecture Behavioral of timing_clk is

constant VGA_HEIGHT :   natural := 480;
constant VGA_WIDTH  :   natural := 640;

constant FREQ_IN    :   natural := 100E6;
constant PERIOD_IN  :   time    := (1.0E12/real(FREQ_IN))*1ps;

constant FREQ_PIXEL :   natural := 25E6;
constant PIXEL_NDIV :   natural := FREQ_IN  / FREQ_PIXEL;
constant PERIOD_PXL :   time    := (1.0E12/real(FREQ_IN))*1ps;

constant H_ACTIVE_VIDEO_TIME    : time  := 25.422us;
constant H_FRONT_PORCH          : time  := 00.635us;
constant H_SYNC_PULSE_TIME      : time  := 03.813us;
constant H_BACK_PORCH           : time  := 01.906us;
constant SCANLINE_TIME          : time  := 31.777us;

constant H_AVT_NDIV : natural   := natural(H_ACTIVE_VIDEO_TIME  / PERIOD_IN);
constant H_FP_NDIV  : natural   := natural(H_FRONT_PORCH        / PERIOD_IN);
constant H_SPT_NDIV : natural   := natural(H_SYNC_PULSE_TIME    / PERIOD_IN);
constant H_BP_NDIV  : natural   := natural(H_BACK_PORCH         / PERIOD_IN);

constant V_ACTIVE_VIDEO_TIME    : time  := 15.253ms;
constant V_FRONT_PORCH          : time  := 00.317ms;
constant V_SYNC_PULSE_TIME      : time  := 00.063ms;
constant V_BACK_PORCH           : time  := 01.048ms;
constant TOTAL_FRAME_TIME       : time  := 16.683ms;

constant V_AVT_NDIV : natural   := natural(V_ACTIVE_VIDEO_TIME  / PERIOD_IN);
constant V_FP_NDIV  : natural   := natural(V_FRONT_PORCH        / PERIOD_IN);
constant V_SPT_NDIV : natural   := natural(V_SYNC_PULSE_TIME    / PERIOD_IN);
constant V_BP_NDIV  : natural   := natural(V_BACK_PORCH         / PERIOD_IN);

type horizontal_enum    is (H_VIDEO, H_F_PORCH, H_B_PORCH, H_SYNC, H_WAITING);
type vertical_enum      is (V_VIDEO, V_F_PORCH, V_B_PORCH, V_SYNC);

component freq_divider is
    Generic (
        FREQ_IN     :   natural :=  100E6;
        FREQ_OUT    :   natural :=  10E6);
        
    Port (
        clk_i   :   in  std_logic;
        clk_en  :   in  std_logic;
        rst_i   :   in  std_logic;
        clk_o   :   out std_logic);
end component freq_divider;

signal  pixel_clk_en    : std_logic := '0';
signal  pixel_clk       : std_logic;

signal  h_state : horizontal_enum   := H_WAITING;  
signal  h_q     : natural range V_AVT_NDIV downto 0 := 0;
signal  h_div   : natural range H_AVT_NDIV downto 0;
signal  h_strobe: std_logic := '0';

signal  v_state : vertical_enum     := V_F_PORCH; 
signal  v_q     : natural range V_AVT_NDIV downto 0 := 0;
signal  v_div   : natural range V_AVT_NDIV downto 0 := 0;

begin


pixel_clock: freq_divider
    generic map(
        FREQ_IN     =>  natural(FREQ_IN),
        FREQ_OUT    =>  natural(FREQ_PIXEL))
    
    port map(
        clk_i       =>  clk_i,
        clk_en      =>  pixel_clk_en,
        rst_i       =>  '0',
        clk_o       =>  pixel_clk);
        
pixel_clk_o <= pixel_clk;

h_div   <=  H_AVT_NDIV  when h_state = H_VIDEO      else
            H_FP_NDIV   when h_state = H_F_PORCH    else
            H_BP_NDIV   when h_state = H_B_PORCH    else H_SPT_NDIV;

hor_state: process(clk_i, h_div, h_strobe, h_q, h_state)
begin
    if (h_q = h_div) or (h_state = H_WAITING) then
        h_q <= 0;
        
        if h_state = H_WAITING and h_strobe = '1' then
            h_state <= H_SYNC;
        elsif h_state = H_SYNC then
            h_state <= H_B_PORCH;
        elsif h_state = H_B_PORCH then
            h_state <= H_VIDEO;
            pixel_clk_en <= '1';
        elsif h_state = H_VIDEO then
            h_state <= H_F_PORCH;
            pixel_clk_en <= '0';
        elsif h_state = H_F_PORCH then
            h_state <= H_WAITING;
        end if;
    end if;
    
    if rising_edge(clk_i) then
        h_q <= h_q + 1;
    end if;

end process;

v_div   <=  V_AVT_NDIV  when v_state = V_VIDEO      else
            V_FP_NDIV   when v_state = V_F_PORCH    else
            V_BP_NDIV   when v_state = V_B_PORCH    else V_SPT_NDIV;

ver_state: process(clk_i, v_div, v_q, v_state)
begin
    if v_q = v_div then
        v_q <= 0;
        
        if v_state = V_SYNC then
            v_state <= V_B_PORCH;
        elsif v_state = V_B_PORCH then
            v_state <= V_VIDEO;
            h_strobe <= '1';
        elsif v_state = V_VIDEO then
            v_state <= V_F_PORCH;
             h_strobe <= '0';
        elsif v_state = V_F_PORCH then
            v_state <= V_SYNC;
        end if;
    end if;
    
    if rising_edge(clk_i) then
        v_q <= v_q + 1;
    end if;

end process;

sync_state: process(clk_i, h_state, v_state)
begin

    if rising_edge(clk_i) then
        if h_state = H_SYNC then
            hsync_o <= '0';
        else
            hsync_o <= '1';
        end if;
        
        if v_state = V_SYNC then
            vsync_o <= '0';
        else
            vsync_o <= '1';
        end if;
        
        
    end if;

end process;


end Behavioral;
