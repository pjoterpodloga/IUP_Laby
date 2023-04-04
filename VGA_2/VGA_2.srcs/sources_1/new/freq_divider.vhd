----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.04.2023 10:44:44
-- Design Name: 
-- Module Name: freq_divider - Behavioral
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

entity freq_divider is
    Generic (
        FREQ_IN     :   natural :=  100E6;
        FREQ_OUT    :   natural :=  10E6);
        
    Port (
        clk_i   :   in  std_logic;
        clk_en  :   in  std_logic;
        rst_i   :   in  std_logic;
        clk_o   :   out std_logic);
end freq_divider;

architecture Behavioral of freq_divider is

constant NDIV   :   natural :=  FREQ_IN / FREQ_OUT;

signal d_nq :   natural range NDIV downto 0 := 0; 
signal d_pq :   natural range NDIV downto 0 := 0;

signal d_q_sum  :   natural range 2*NDIV downto 0;

signal d_reset  :   boolean;

begin

counting_p: process(clk_i, d_reset, d_pq)
begin
    
    if d_reset then
        d_pq    <=  0;
    elsif rising_edge(clk_i) then
        d_pq    <=  d_pq + 1;
    end if;

end process;

counting_n: process(clk_i, d_reset, d_nq)
begin
    
    if d_reset then
        d_nq    <=  0;
    elsif falling_edge(clk_i) then
        d_nq    <=  d_nq + 1;
    end if;

end process;

d_state: process(d_q_sum, d_reset)
begin

    if d_reset then
        clk_o <= '0';
    elsif d_q_sum = NDIV then
        clk_o <= '1';
    end if;

end process;

reset: process(d_q_sum, clk_en, rst_i)
begin

    if rst_i = '1' then
        d_reset <= true;
    elsif clk_en = '0' then
        d_reset <= true;
    elsif d_q_sum = 2*NDIV then
        d_reset <= true;
    else
        d_reset <= false;
    end if;

end process;

d_q_sum <= d_pq + d_nq;

end Behavioral;
