----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2023 14:37:09
-- Design Name: 
-- Module Name: freq_div - Behavioral
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

entity freq_div is
    Generic (
        NDIV    :   natural := 10);
        
    Port ( 
        clk_i   :   in  std_logic;
        clk_en  :   in  std_logic;
        rst_i   :   in  std_logic;
        clk_o   :   out std_logic;
        q_out   :   out natural range NDIV downto 0);
end freq_div;

architecture Behavioral of freq_div is

signal d_q      :   natural range NDIV downto 0 := 0;

signal d_reset  :   boolean :=  false;

signal d_state  :   std_logic   :=  '0';

begin

count: process(clk_i, d_reset)
begin

    if d_reset then
        d_q <= 0;
    elsif rising_edge(clk_i) then
        d_q <= d_q + 1;
    end if;

end process;

reset: process(rst_i, clk_en, d_q)
begin

    if rst_i = '1' or clk_en = '0' or d_q = NDIV then
        d_reset <= true;
    else
        d_reset <= false;
    end if;

end process;

change_state: process(clk_i, d_q)
begin

    if rising_edge(clk_i) then
        if d_q = 0 then
            d_state <= '0';
        elsif d_q = NDIV/2 then
            d_state <= '1';
        end if;
    end if;

end process;

q_out <= d_q;
clk_o <= d_state;

end Behavioral;
