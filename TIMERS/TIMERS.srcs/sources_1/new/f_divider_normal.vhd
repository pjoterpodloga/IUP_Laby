----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2023 17:17:41
-- Design Name: 
-- Module Name: freq_divider_normal - Behavioral
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

entity f_divider_normal is
    Generic (
        FREQ_IN     :   natural := 100E6;
        FREQ_OUT    :   natural :=  10E6);
        
    Port ( 
        clk_i   :   in  std_logic;
        clk_en  :   in  std_logic;
        rst_i   :   in  std_logic;
        clk_o   :   out std_logic);
end f_divider_normal;

architecture Behavioral of f_divider_normal is

constant    NDIV    :   natural :=  FREQ_IN / FREQ_OUT;

signal  d_pq    :   natural range   NDIV downto 0 :=  0;
signal  d_nq    :   natural range   NDIV downto 0 :=  0;
signal  d_sum_q :   natural range 2*NDIV downto 0;

signal  d_state :   std_logic   := '0';

signal  d_reset :   boolean;
signal  q_reset :   boolean;

begin

countin_p: process(clk_i, d_reset, q_reset, clk_en)
begin

    if d_reset or q_reset then
        d_pq <= 0;
    elsif rising_edge(clk_i) then
        if clk_en = '1' then
            d_pq <= d_pq + 1;
        end if;
    end if;

end process;

countin_n: process(clk_i, d_reset, q_reset, clk_en)
begin

    if d_reset or q_reset then
        d_nq <= 0;
    elsif falling_edge(clk_i) then
        if clk_en = '1' then
            d_nq <= d_nq + 1;
        end if;
    end if;

end process;

change_state: process(clk_i, d_reset, d_sum_q)
begin
    
    if d_sum_q = 0 or d_reset then
        d_state <= '0';
    elsif d_sum_q = NDIV then
        d_state <= '1';
    end if;
    
end process;


d_sum_q <= d_pq + d_nq;

q_reset <= (d_sum_q = 2*NDIV);

d_reset <= (rst_i = '1') or (clk_en = '0');

clk_o   <= d_state;

end Behavioral;
