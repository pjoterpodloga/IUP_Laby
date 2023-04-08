----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2023 16:56:27
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
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timing_clk is
    Generic (
        CLK_I_FREQ    :   natural :=  100E6);
        
    Port (
        clk_i       :   in  std_logic;
        pixel_clk_o :   out std_logic;
        hsync_o     :   out std_logic;
        vsync_o     :   out std_logic;
        q_pixel_o   :   out natural range 4 downto 0);
end timing_clk;

architecture Behavioral of timing_clk is

constant    VGA_HEIGHT      :   natural :=  480;
constant    VGA_WIDTH       :   natural :=  640;

constant    CLK_I_PERIOD    :   time    :=  (1.0E12 / real(CLK_I_FREQ)) * 1ps;

constant    PIXEL_FREQ      :   real    :=  25.0E6;
constant    PIXEL_PERIOD    :   time    :=  40ns;
constant    PIXEL_NDIV      :   natural :=  CLK_I_FREQ / natural(PIXEL_FREQ);

constant    LINE_FREQ       :   real    :=  31.468E3;
constant    LINE_DURATION   :   time    :=  31.781us;
constant    LINE_NDIV       :   natural :=  CLK_I_FREQ / natural(LINE_FREQ);

--Horizontal timings
constant H_ACTIVE_VIDEO_TIME    : time  := 25.600us;
constant H_FRONT_PORCH          : time  := 00.640us;
constant H_SYNC_PULSE_TIME      : time  := 03.840us;
constant H_BACK_PORCH           : time  := 01.920us;
constant SCANLINE_TIME          : time  := 32.000us;

--Horizontal dividers
constant H_AVT_NDIV :   natural :=  H_ACTIVE_VIDEO_TIME / PIXEL_PERIOD;
constant H_FP_NDIV  :   natural :=  H_FRONT_PORCH       / PIXEL_PERIOD;
constant H_SPT_NDIV :   natural :=  H_SYNC_PULSE_TIME   / PIXEL_PERIOD;
constant H_BP_NDIV  :   natural :=  H_BACK_PORCH        / PIXEL_PERIOD;

constant H_ST_NDIV  :   natural :=  SCANLINE_TIME       / PIXEL_PERIOD;

constant H_MAX_NDIV :   natural :=  H_AVT_NDIV;

--Vertical timings
constant V_ACTIVE_VIDEO_TIME    : time  := 15.255ms;
constant V_FRONT_PORCH          : time  := 00.318ms;
constant V_SYNC_PULSE_TIME      : time  := 00.064ms;
constant V_BACK_PORCH           : time  := 01.049ms;
constant TOTAL_FRAME_TIME       : time  := 16.688ms;

--Vertical dividers
constant V_AVT_NDIV :   natural :=  V_ACTIVE_VIDEO_TIME / LINE_DURATION;
constant V_FP_NDIV  :   natural :=  V_FRONT_PORCH       / LINE_DURATION;
constant V_SPT_NDIV :   natural :=  V_SYNC_PULSE_TIME   / LINE_DURATION;
constant V_BP_NDIV  :   natural :=  V_BACK_PORCH        / LINE_DURATION;

constant V_TFT_NDIV :   natural :=  TOTAL_FRAME_TIME    / LINE_DURATION;

constant V_MAX_NDIV :   natural :=  V_AVT_NDIV;

component freq_div is
    Generic (
        NDIV    :   natural := 10);
        
    Port ( 
        clk_i   :   in  std_logic;
        clk_en  :   in  std_logic;
        rst_i   :   in  std_logic;
        clk_o   :   out std_logic;
        q_out   :   out natural range NDIV downto 0);
end component freq_div;

type horizontal_enum    is (H_VIDEO, H_F_PORCH, H_B_PORCH, H_SYNC, H_WAITING);
type vertical_enum      is (V_VIDEO, V_F_PORCH, V_B_PORCH, V_SYNC, V_WAITING);

signal pixel_clk    :   std_logic;
signal q_pixel      :   natural range 4 downto 0;

signal line_clk     :   std_logic;

signal  h_current_state     :   horizontal_enum :=  H_WAITING;
signal  h_next_state        :   horizontal_enum;

signal  h_div           :   natural range   H_MAX_NDIV downto 0 := 0;
signal  h_q             :   natural         :=  0;

signal  h_active        :   std_logic       :=  '0';


signal  v_current_state :   vertical_enum   := V_SYNC;
signal  v_next_state    :   vertical_enum;

signal  v_div           :   natural range   V_MAX_NDIV downto 0 :=  0;
signal  v_q             :   natural         :=  0;



signal  video_active    :   std_logic   :=  '0';

begin

pixel_clk_divider: freq_div
    Generic map (
        NDIV    =>  PIXEL_NDIV)
        
    Port map (
        clk_i   =>  clk_i,
        clk_en  =>  h_active,
        rst_i   =>  '0',
        clk_o   =>  pixel_clk,
        q_out   =>  q_pixel);
        
h_div <=    H_AVT_NDIV  when    h_current_state = H_VIDEO   else
            H_FP_NDIV   when    h_current_state = H_F_PORCH else
            H_BP_NDIV   when    h_current_state = H_B_PORCH else
            H_SPT_NDIV  when    h_current_state = H_SYNC    else    H_MAX_NDIV;
            
next_hor_state: process(clk_i, h_current_state)
begin

    if rising_edge(clk_i) then
        
        case h_current_state is
            when    H_SYNC      =>  h_next_state <= H_B_PORCH;
            when    H_B_PORCH   =>  h_next_state <= H_VIDEO;
            when    H_VIDEO     =>  h_next_state <= H_F_PORCH;
            when    H_F_PORCH   =>  h_next_state <= H_WAITING;
            when    H_WAITING   =>  h_next_state <= H_SYNC;
            when    others      =>  h_next_state <= H_SYNC;
        end case;
        
    end if;

end process;

change_h_state: process(pixel_clk, h_active, h_q, h_div, h_next_state)
begin
    
    if h_active = '0' then
        h_q <= 0;
    elsif h_q = h_div then
        h_q <= 0;
        h_current_state <= h_next_state;
    elsif rising_edge(pixel_clk) then
        h_q <= h_q + 1;
    end if;

end process;

line_clk_divider: freq_div
    Generic map (
        NDIV    =>  LINE_NDIV)
        
    Port map (
        clk_i   =>  clk_i,
        clk_en  =>  '1',
        rst_i   =>  '0',
        clk_o   =>  line_clk,
        q_out   =>  open);         
            
v_div <=    V_AVT_NDIV  when    v_current_state = V_VIDEO   else
            V_FP_NDIV   when    v_current_state = V_F_PORCH else
            V_BP_NDIV   when    v_current_state = V_B_PORCH else
            V_SPT_NDIV  when    v_current_state = V_SYNC    else    V_MAX_NDIV;
            
next_ver_state: process(clk_i, v_current_state)
begin

    if rising_edge(clk_i) then
        
        case v_current_state is
            when    V_SYNC      =>  v_next_state <= V_B_PORCH;
            when    V_B_PORCH   =>  v_next_state <= V_VIDEO;
            when    V_VIDEO     =>  v_next_state <= V_F_PORCH;  h_active <= '1';
            when    V_F_PORCH   =>  v_next_state <= V_SYNC;     h_active <= '0';
            when    others      =>  v_next_state <= V_SYNC;
        end case;
        
    end if;

end process;

change_v_state: process (line_clk, v_q, v_div, v_next_state)
begin
    
    if v_q = v_div then
        v_q <= 0;
        v_current_state <= v_next_state;
    elsif rising_edge(line_clk) then
        v_q <= v_q + 1;
    end if;

end process;

q_pixel_o   <= q_pixel;

pixel_clk_o <= pixel_clk;

hsync_o     <= '0' when h_current_state = H_SYNC else '1';
vsync_o     <= '0' when v_current_state = V_SYNC else '1';

end Behavioral;
