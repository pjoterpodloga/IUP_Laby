----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.03.2023 08:12:00
-- Design Name: 
-- Module Name: tb_div - Behavioral
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

entity tb_div is
--  Port ( );
end tb_div;

architecture Behavioral of tb_div is

component divider is
    generic (
        CLK_FREQ    :   natural range 100E6 downto 0    :=  100E6;
        CLK_OUT     :   natural range 50E6  downto 0    :=  1E6);
    Port ( 
        clk_i       :   in  std_logic;
        clk_o       :   out std_logic);
end component divider;

signal clk_i    :   std_logic   := '0';
signal clk_o    :   std_logic   := '0';

constant    CLK_F   :   natural :=  100E6;
constant    CLK_D   :   natural :=  1E6;

constant    CLK_PERIOD  :   time    :=  natural(1.0E12 * 1.0 / real(CLK_F)) * 1ms;

begin

dut: divider 
    generic map (
    CLK_FREQ    => CLK_F,
    CLK_OUT     => CLK_D)
    
    port map (
    clk_i   => clk_i,
    clk_o   => clk_o);
        

clk_i <= not clk_i after 5ns;

stim: process
begin

wait;

end process;

end Behavioral;
