----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2023 11:18:36
-- Design Name: 
-- Module Name: tb_async_clk - Behavioral
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

entity tb_async_clk is
--  Port ( );
end tb_async_clk;

architecture Behavioral of tb_async_clk is

component async_clk is
    Port (  clk_i : in std_logic;
            clk_baud : out std_logic;
            clk_en   : in std_logic);
end component async_clk;

signal clk_i    :  std_logic := '0';
signal clk_baud :  std_logic := '0';
signal clk_en   :  std_logic := '0';

begin


dut: async_clk port map (   
    clk_i       => clk_i,
    clk_baud    => clk_baud,
    clk_en      => clk_en);
    
    clk_i <= not clk_i after 5ns;
    
stim: process
begin
    wait for 100us;
    clk_en <= '1';
    wait for 2ms;
    clk_en <= '0';
    wait;
end process;

end Behavioral;
