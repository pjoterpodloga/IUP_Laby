----------------------------------------------------------------------------------
-- Company: 
-- Engineer:  Piotr Buluk, Jakub Cichocki
-- 
-- Create Date: 10.05.2023 17:23:38
-- Design Name: 
-- Module Name: clk_div - Behavioral
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

entity clk_div is
    Generic (
        CLK_IN      :   natural :=  100E6;
        CLK_OUT     :   natural :=  10E6);
        
    Port ( 
        clk_i   :   in  std_logic;
        rst_i   :   in  std_logic;
        clk_o   :   out std_logic;
        q_out   :   out natural range CLK_IN/CLK_OUT downto 0);
end clk_div;

architecture Behavioral of clk_div is

constant NDIV   :   natural :=  CLK_IN/CLK_OUT;

signal q_count  :   natural range NDIV downto 0 := 0;
signal q_state  :   std_logic   := '0';

begin

counting: process(clk_i, rst_i)
begin

    if (rst_i = '1') then
        q_count <= 0;
    elsif rising_edge(clk_i) then
        q_count <= q_count + 1;
    end if;
    
    if (q_count = NDIV) then
        q_count <= 0;
    end if;

end process;

state_switch: process(clk_i)
begin

    if (rst_i = '1') then
        q_state <= '0';        
    elsif (rising_edge(clk_i)) then
        
        if (q_count = 0) then
            q_state <= '0';
        elsif (q_count = NDIV/2) then
            q_state <= '1';
        end if;
        
    end if;

end process;

clk_o <= q_state;

q_out <= q_count;

end Behavioral;
