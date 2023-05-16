----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Piotr Buluk, Jakub Cichocki
-- 
-- Create Date: 10.05.2023 17:55:08
-- Design Name: 
-- Module Name: timing_module - Behavioral
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

entity timing_module is
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
end timing_module;

architecture Behavioral of timing_module is

-- Pixel frequency, should be 25.175e6 but there
-- is no way to generate frictional values;
constant    PIXEL_CLK   :   natural :=  25E6;
constant    PIXEL_PERIOD:   time    :=  (1.0E12/real(PIXEL_CLK)) * 1ps;


-- Horizontal timings
constant    SCANLINE_T  :   time    :=  31.77us;    -- Horizontal scanline time

constant    H_A_VIDEO_T :   time    :=  25.42us;    -- Horizontal video active time
constant    H_F_PORCH_T :   time    :=   0.63us;    -- Horizontal front porch time
constant    H_S_PULSE_T :   time    :=   3.81us;    -- Horizontal sync pulse time
constant    H_B_PORCH_T :   time    :=   1.90us;    -- Horizontal back porch

-- Dividers for clock
constant    H_A_VIDEO_D :   natural :=  640;--(H_A_VIDEO_T / PIXEL_PERIOD);
constant    H_F_PORCH_D :   natural :=   16;--(H_F_PORCH_T / PIXEL_PERIOD);
constant    H_S_PULSE_D :   natural :=   96;--(H_S_PULSE_T / PIXEL_PERIOD);
constant    H_B_PORCH_D :   natural :=   48;--(H_B_PORCH_T / PIXEL_PERIOD);

-- Maximum possible h_count value to limit range
constant    H_MAX_DIV   :   natural :=  H_A_VIDEO_D;


-- Vertical timings
constant    FRAME_T     :   time    :=  16.68ms;    -- Whole frametime

constant    V_A_VIDEO_T :   time    :=  15.25ms;    -- Vertical active video time
constant    V_F_PORCH_T :   time    :=   0.31ms;    -- Vertical front porch time
constant    V_S_PULSE_T :   time    :=   0.06ms;    -- Vertical sync pulse time
constant    V_B_PORCH_T :   time    :=   1.04ms;    -- Vertical back porch time

-- Divider for clock
constant    V_A_VIDEO_D :   natural :=  480;--(V_A_VIDEO_T / SCANLINE_T);
constant    V_F_PORCH_D :   natural :=   10;--(V_F_PORCH_T / SCANLINE_T);
constant    V_S_PULSE_D :   natural :=    2;--(V_S_PULSE_T / SCANLINE_T);
constant    V_B_PORCH_D :   natural :=   33;--(V_B_PORCH_T / SCANLINE_T);

-- Maximum possible v_count value to limit range
constant    V_MAX_DIV   :   natural :=  V_A_VIDEO_D;

constant    FRAME_PER_S :   real    :=  1.0E12 / (FRAME_T / 1ps);

-- H and V states
type    h_state_enum    is  (H_VIDEO, H_F_PORCH, H_S_PULSE, H_B_PORCH);
type    v_state_enum    is  (V_VIDEO, V_F_PORCH, V_S_PULSE, V_B_PORCH);

-- H State signals
signal  h_current_state :   h_state_enum;
signal  h_next_state    :   h_state_enum;

-- H Clock signals
signal  h_count :   natural range H_MAX_DIV downto 0    :=  0;
signal  h_div   :   natural range H_MAX_DIV downto 0    :=  0;
signal  h_last  :   std_logic   :=  '0';

-- V State signals
signal  v_current_state :   v_state_enum;
signal  v_next_state    :   v_state_enum;

-- V Clock signals
signal  v_count :   natural range V_MAX_DIV downto 0    :=  0;
signal  v_div   :   natural range V_MAX_DIV downto 0    :=  0;
signal  v_last  :   h_state_enum;

signal  internal_hsync  :   std_logic   :=  '1';
signal  internal_vsync  :   std_logic   :=  '1';
signal  internal_h_video  :   std_logic :=  '1';
signal  internal_v_video  :   std_logic :=  '1';

begin

HV_state_machines: process(clk_i)
begin

    if rising_edge(clk_i) then
    
        -- State machine for H
        case h_current_state is
            when H_VIDEO    =>  
                h_next_state    <=  H_F_PORCH;  
                h_div           <=  H_A_VIDEO_D;
            when H_F_PORCH  =>
                h_next_state    <=  H_S_PULSE;
                h_div           <=  H_F_PORCH_D;
            when H_S_PULSE  =>
                h_next_state    <=  H_B_PORCH;
                h_div           <=  H_S_PULSE_D;
            when H_B_PORCH  =>
                h_next_state    <=  H_VIDEO;
                h_div           <=  H_B_PORCH_D;
            when others     =>
                h_next_state    <=  H_VIDEO;
                h_div           <=  0;
        end case;
        
        -- State machine for V
        case v_current_state is
            when V_VIDEO    =>  
                v_next_state    <=  V_F_PORCH;  
                v_div           <=  V_A_VIDEO_D;
            when V_F_PORCH  =>
                v_next_state    <=  V_S_PULSE;
                v_div           <=  V_F_PORCH_D;
            when V_S_PULSE  =>
                v_next_state    <=  V_B_PORCH;
                v_div           <=  V_S_PULSE_D;
            when V_B_PORCH  =>
                v_next_state    <=  V_VIDEO;
                v_div           <=  V_B_PORCH_D;
            when others     =>
                v_next_state    <=  V_VIDEO;
                v_div           <=  0;
        end case;
        
    end if;
    
end process;

-- H counting process
h_counting: process(clk_i)
begin

    if rising_edge(clk_i) then  -- Synchonized with global clock
    
        if pixel_clk_i = '0' then
            h_last <= '0';
        elsif (pixel_clk_i /= h_last) then
            h_last <= '1';

            h_count <=  h_count + 1;
    
            if h_count = h_div - 1 then
                h_count <= 0;
                h_current_state <= h_next_state;
            end if;
            
            if h_current_state = H_S_PULSE then
                internal_hsync <= '0';
            else
                internal_hsync <= '1';
            end if;
            
            if h_current_state = H_VIDEO and v_current_state = V_VIDEO then
                internal_h_video <= '1';
            else
                internal_h_video <= '0';
            end if;
            
        end if;
    end if;

end process;

-- V counting process
v_counting: process(clk_i)
begin

    if rising_edge(clk_i) then  -- Synchonized with global clock
    
        if v_last /= H_B_PORCH then
            v_last <= h_current_state;
        elsif (h_current_state /= v_last) then
            v_last <= h_next_state;

            v_count <=  v_count + 1;
    
            if v_count = v_div - 1 then
                v_count <= 0;
                v_current_state <= v_next_state;
            end if;
            
            if v_current_state = V_S_PULSE then
                internal_vsync <= '0';
            else
                internal_vsync <= '1';
            end if;
            
            if v_current_state = V_VIDEO then
                internal_v_video <= '1';
            else
                internal_v_video <= '0';
            end if;
            
        end if;
    end if;

end process;

hsync_o <=  internal_hsync;
vsync_o <=  internal_vsync;

h_video_a_o <= internal_h_video;
v_video_a_o <= internal_v_video;

end Behavioral;
