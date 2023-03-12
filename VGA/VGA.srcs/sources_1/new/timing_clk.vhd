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
        hsync           : out   std_logic;
        vsync           : out   std_logic);
        
end timing_clk;

architecture Behavioral of timing_clk is

constant VGA_HEIGHT : natural := 480;
constant VGA_WIDTH  : natural := 640;

constant CLK_FREQ   : real  := 100.0E9;
constant CLK_PERIOD : time  := 10ns;

constant PIXEL_CLK  : real  :=  25.175E9;
constant PIXEL_NDIV : natural := 4;

constant H_ACTIVE_VIDEO_TIME    : time  := 25.422us;
constant H_FRONT_PORCH          : time  := 00.635us;
constant H_SYNC_PULSE_TIME      : time  := 03.813us;
constant H_BACK_PORCH           : time  := 01.906us;
constant SCANLINE_TIME          : time  := 31.777us;

constant H_AVT_NDIV : natural   := H_ACTIVE_VIDEO_TIME  / CLK_PERIOD;
constant H_FP_NDIV  : natural   := H_FRONT_PORCH        / CLK_PERIOD;
constant H_SPT_NDIV : natural   := H_SYNC_PULSE_TIME    / CLK_PERIOD;
constant H_BP_NDIV  : natural   := H_BACK_PORCH         / CLK_PERIOD;

constant V_ACTIVE_VIDEO_TIME    : time  := 15.253ms;
constant V_FRONT_PORCH          : time  := 00.317ms;
constant V_SYNC_PULSE_TIME      : time  := 00.063ms;
constant V_BACK_PORCH           : time  := 01.048ms;
constant TOTAL_FRAME_TIME       : time  := 16.683ms;

constant V_AVT_NDIV : natural   := V_ACTIVE_VIDEO_TIME  / CLK_PERIOD;
constant V_FP_NDIV  : natural   := V_FRONT_PORCH        / CLK_PERIOD;
constant V_SPT_NDIV : natural   := V_SYNC_PULSE_TIME    / CLK_PERIOD;
constant V_BP_NDIV  : natural   := V_BACK_PORCH         / CLK_PERIOD; 

type horizontal_enum    is (H_VIDEO, H_F_PORCH, H_B_PORCH, H_SYNC, H_WAITING);
type vertical_enum      is (V_VIDEO, V_F_PORCH, V_B_PORCH, V_SYNC);

signal  pixel_clk_en : std_logic := '0';
signal  pixel_clk_p : natural range 2*PIXEL_NDIV downto 0 := 0;
signal  pixel_clk_q : natural range 2*PIXEL_NDIV downto 0 := 0;
signal  pixel_clk_last_state : std_logic := '0';
signal  pixel_diff  : std_logic;

signal  h_state : horizontal_enum   := H_SYNC;
signal  h_p     : natural range 2*H_AVT_NDIV downto 0 := 0;  
signal  h_q     : natural range 2*V_AVT_NDIV downto 0 := 0;
signal  h_last_state : std_logic := '0';
signal  h_diff  : std_logic;
signal  h_div   : natural range H_AVT_NDIV downto 0 := 0;
signal  h_strobe: std_logic := '0';

signal  v_state : vertical_enum     := V_SYNC;
signal  v_p     : natural range 2*H_AVT_NDIV downto 0 := 0;  
signal  v_q     : natural range 2*V_AVT_NDIV downto 0 := 0;
signal  v_last_state : std_logic := '0';
signal  v_diff  : std_logic;
signal  v_div   : natural range V_AVT_NDIV downto 0 := 0;

begin

pixel_diff <= clk_i xor pixel_clk_last_state;
pixel_clk_p <= pixel_clk_q + 1;

pixel_clk_o <= '0' when pixel_clk_q < PIXEL_NDIV else '1';

pixel_clock: process(pixel_diff, pixel_clk_en, pixel_clk_q)
begin

    if pixel_clk_q >= 2*PIXEL_NDIV then
        pixel_clk_q <= 0;
    end if;
    
    if pixel_clk_en = '0' then
        pixel_clk_last_state <= '0';
        pixel_clk_q <= 0;
    elsif rising_edge(pixel_diff) then
        pixel_clk_last_state <= clk_i;
        pixel_clk_q <= pixel_clk_p;
    end if;
    
end process;

h_diff  <= (clk_i xor h_last_state) and h_strobe;
h_p     <= h_q + 1;

h_div   <=  H_AVT_NDIV  when h_state = H_VIDEO      else
            H_FP_NDIV   when h_state = H_F_PORCH    else
            H_BP_NDIV   when h_state = H_B_PORCH    else H_SPT_NDIV;

hor_state: process(h_diff, h_q, h_state)
begin
    if (h_q >= 2*h_div) or (h_state = H_WAITING) then
        h_q <= 0;
        
        if h_state = H_WAITING then
            h_state <= H_SYNC;
        elsif h_state = H_SYNC then
            h_state <= H_F_PORCH;
            pixel_clk_en <= '1';
        elsif h_state = H_F_PORCH then
            h_state <= H_VIDEO;
        elsif h_state = H_VIDEO then
            h_state <= H_B_PORCH;
            pixel_clk_en <= '0';
        elsif h_state = H_B_PORCH then
            h_state <= H_WAITING;
        end if;
    end if;
    
    if rising_edge(h_diff) then
        h_last_state <= clk_i;
        h_q <= h_p;
    end if;

end process;


v_diff  <= (clk_i xor v_last_state);
v_p     <= v_q + 1;

v_div   <=  V_AVT_NDIV  when v_state = V_VIDEO      else
            V_FP_NDIV   when v_state = V_F_PORCH    else
            V_BP_NDIV   when v_state = V_B_PORCH    else V_SPT_NDIV;

ver_state: process(v_diff, v_q, v_state)
begin
    if v_q >= 2*v_div then
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
    
    if rising_edge(v_diff) then
        v_last_state <= clk_i;
        v_q <= v_p;
    end if;

end process;

hsync <= '0' when h_state = H_SYNC else '1';
vsync <= '0' when v_state = V_SYNC else '1';


end Behavioral;
