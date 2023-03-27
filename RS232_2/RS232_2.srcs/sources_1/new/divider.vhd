----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.03.2023 19:04:35
-- Design Name: 
-- Module Name: divider - Behavioral
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

entity divider is
    Generic (
        FREQ_IN         :   natural :=  100E6;
        FREQ_OUT        :   natural :=  10E6;
        INCLUDE_ENABLE  :   boolean :=  false);
    Port ( 
        clk_i   :   in  std_logic;
        clk_en  :   in  std_logic;
        clk_o   :   out std_logic);
end divider;

architecture Behavioral of divider is

constant    NDIV    :   natural := FREQ_IN  / FREQ_OUT;

signal d_nq     :   natural range NDIV downto 0   := 0;
signal d_pq     :   natural range NDIV downto 0   := 0;

signal d_q_sum  :   natural range NDIV downto 0;

signal d_enable :   std_logic   := '1';

signal d_q_rst  :   boolean;
signal o_state  :   boolean;

begin 

d_q_rst <= true when d_nq = NDIV and d_pq = NDIV else false;

div_p: process(clk_i, d_q_rst)
begin
    if d_q_rst then
        d_pq <= 0;
    elsif rising_edge(clk_i) then
        d_pq <= d_pq + 1;
    end if;
end process;

div_n: process(clk_i, d_q_rst)
begin
    
    if d_q_rst then
        d_nq <= 0;
    elsif falling_edge(clk_i) then
        d_nq <= d_nq + 1;
    end if;
end process;

d_q_sum <= d_pq + d_nq;

state: process(d_q_sum, clk_i)
begin
    if rising_edge(clk_i) then
        if (d_q_sum = NDIV) then
            o_state <=  true;
        elsif (d_q_sum = 0) then
            o_state <=  false;
        end if;
    end if;
    
end process;

clk_o   <= '1'  when o_state else    '0';

d_ADD_ENABLE: if INCLUDE_ENABLE generate
    d_enable    <=  clk_en;
end generate;

d_REMOVE_ENABLE: if not INCLUDE_ENABLE generate
    d_enable    <= '1';
end generate;

end Behavioral;
