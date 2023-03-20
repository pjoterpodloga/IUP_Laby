----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2023 17:47:49
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
        FREQ_IN     :   natural := 100E6;
        FREQ_OUT    :   natural := 1E6);
        
    Port (
        clk_i   :   in  std_logic;
        clk_o   :   out std_logic);
end divider;

architecture Behavioral of divider is

constant    NDIV    :   natural :=  FREQ_IN / FREQ_OUT;

signal  d_q         :   natural range 2*NDIV downto 0   :=  0;
signal  d_p         :   natural range 2*NDIV downto 0;
signal  last_state  :   std_logic   :=  '0';
signal  d_diff      :   std_logic;

begin

d_diff <= clk_i xor last_state;

counting: process(d_diff, d_q)
begin

    if d_q = 2 * NDIV then
        d_q <= 0;   
    elsif rising_edge(d_diff) then
        last_state <= clk_i;
        d_q <= d_p;
    end if;

end process;

d_p <= d_q + 1;

clk_o <= '0' when d_q < NDIV else '1';

end Behavioral;
