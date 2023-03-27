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
        FREQ_OUT        :   natural :=  1E6;
        INCLUDE_ENABLE  :   boolean :=  false);
    Port ( 
        clk_i   :   in  std_logic;
        clk_en  :   in  std_logic;
        clk_o   :   out std_logic);
end divider;

architecture Behavioral of divider is

constant    NDIV    :   natural := FREQ_IN  / FREQ_OUT;

signal d_q      :   natural range 2*NDIV downto 0   := 0;
signal d_p      :   natural range 2*NDIV downto 0;
signal d_lstate :   std_logic := '0';
signal d_diff   :   std_logic;

signal d_enable :   std_logic   := '1';

signal o_state  :   boolean;

begin

d_diff  <= clk_i xor d_lstate;

div: process(d_diff, d_q)
begin

    if (d_q = 2*NDIV) or (d_enable = '0') then
        d_lstate    <= '0';
        d_q         <= 0;
    elsif rising_edge(d_diff) then
        d_lstate    <= clk_i;
        d_q         <= d_p;
    end if;

end process;

state: process(d_q)
begin
    if (d_q = NDIV) then
        o_state <=  true;
    elsif (d_q = 0) then
        o_state <=  false;
    end if;
    
end process;

clk_o   <= '1'  when o_state else    '0';

d_p     <= d_q + 1;

d_ADD_ENABLE: if INCLUDE_ENABLE generate
    d_enable    <=  clk_en;
end generate;

d_REMOVE_ENABLE: if not INCLUDE_ENABLE generate
    d_enable    <= '1';
end generate;

end Behavioral;
