----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2023 18:27:07
-- Design Name: 
-- Module Name: time_based_event - Behavioral
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

entity time_based_event is
    Generic (
        FREQ_IN     :   natural :=  100E6;
        MAX_NDIV    :   natural :=  10);
        
    Port ( 
        clk_i       :   in  std_logic;
        rst_i       :   in  std_logic;
        strobe_o    :   out std_logic;
        ndiv_i      :   in  natural range MAX_NDIV downto 0);
end time_based_event;

architecture Behavioral of time_based_event is

signal tbe_q    :   natural range MAX_NDIV downto 0 :=  0;

begin

counting: process(clk_i, rst_i, ndiv_i)
begin
    
    if rst_i = '1' then
        tbe_q <= 0;
    elsif rising_edge(clk_i) then
        tbe_q <= tbe_q + 1;
        strobe_o <= '0';
    end if;
    
    if tbe_q = ndiv_i then
        tbe_q <= 0;
        strobe_o <= '1';
    end if;
    
end process;

end Behavioral;
