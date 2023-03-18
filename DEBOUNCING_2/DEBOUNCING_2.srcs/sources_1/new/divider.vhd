----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.03.2023 08:02:51
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divider is
    generic (
        CLK_FREQ    :   natural range 100E6 downto 0    :=  100E6;
        CLK_OUT     :   natural range 50E6  downto 0    :=  1E6);
    Port ( 
        clk_i       :   in  std_logic;
        clk_o       :   out std_logic);
end divider;

architecture Behavioral of divider is

constant    NDIV     :   natural :=  CLK_FREQ / CLK_OUT;

signal  d_q          :  natural range 2*NDIV downto 0   := 0;
signal  d_p          :  natural range 2*NDIV downto 0; 
signal  d_diff       :  std_logic;
signal  d_last_state :  std_logic   := '0';
signal  d_out        :  std_logic   := '0';

begin

d_diff  <=  clk_i xor d_last_state;

div: process(clk_i, d_diff, d_q)
begin

    if d_q = NDIV then
        d_out <= '1';
    end if;    
       
    if d_q = 2*NDIV then
        d_out <= '0';
        d_q <= 0;
    elsif rising_edge(d_diff) then
        d_last_state <= clk_i;
        d_q <= d_p;
    end if;

d_p <= d_q + 1;

clk_o <= d_out;

end process;

end Behavioral;
