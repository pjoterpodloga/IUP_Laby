----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.05.2023 18:29:57
-- Design Name: 
-- Module Name: synchronizer_module - Behavioral
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

entity synchronizer_module is

    Port ( 
        clk_i   :   in  std_logic;
        rst_i   :   in  std_logic;
        d_in    :   in  std_logic_vector;
        d_out   :   out std_logic_vector);
        
end synchronizer_module;

architecture Behavioral of synchronizer_module is

signal d_sync1  :   std_logic_vector(d_in'range)    :=  (others => '0');
signal d_sync2  :   std_logic_vector(d_in'range)    :=  (others => '0');

begin

sync_process: process(clk_i, rst_i)
begin

    if rst_i = '1' then
        d_sync1 <= (others => '0');
        d_sync2 <= (others => '0');
    elsif rising_edge(clk_i) then
        d_sync1 <= d_in;
        d_sync2 <= d_sync1;
    end if;

end process;

d_out <= d_sync2;

end Behavioral;
