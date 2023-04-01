----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.04.2023 13:11:12
-- Design Name: 
-- Module Name: tbs - Behavioral
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

entity tbs is
    Generic (
        MAX_NDIV    :   natural :=  10);
        
    Port (
        clk_i       :   in  std_logic;
        clk_en      :   in  std_logic;
        rst_i       :   in  std_logic;
        ndiv_i      :   in  natural range MAX_NDIV + 1 downto 0;
        strobe_o    :   out std_logic);
end tbs;

architecture Behavioral of tbs is

signal  d_q     :   natural range MAX_NDIV + 1 downto 0 :=  0;
signal  strobe  :   std_logic   := '0';

begin
        
 counting: process(clk_i)
 begin
 
    if rst_i = '1' or strobe = '1' then
        d_q <= 0;
    elsif rising_edge(clk_i) then
        d_q <= d_q + 1;
    end if;
 
 end process;
        
 strobe_activate: process(d_q)
 begin
 
    if d_q = 0 then
        strobe <= '0';
    elsif d_q = ndiv_i then
        strobe <= '1';
    end if;
 
 end process;

strobe_o <= strobe;

end Behavioral;
