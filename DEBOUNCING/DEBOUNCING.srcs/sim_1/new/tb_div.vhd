----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2023 13:58:41
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
        CLK_FREQ_IN  : natural;
        CLK_FREQ_OUT : natural);
    Port (
        clk_i : in  std_logic;
        rst_i : in  std_logic;
        clk_o : out std_logic);
        
end component divider;

constant CLK_FREQ : natural := 100E6;
constant CLK_PERIOD : time := (1E9 / CLK_FREQ) * 1ns;

constant CLK_FREQ_OUT : natural := 10E6;

signal clk_i : std_logic := '0';
signal rst_i : std_logic := '0';
signal clk_o : std_logic := '0';

begin

dut: divider 
    generic map (
        CLK_FREQ_IN     => CLK_FREQ,
        CLK_FREQ_OUT    => CLK_FREQ_OUT)
        
    port map (
        clk_i   => clk_i,
        rst_i   => rst_i,
        clk_o   => clk_o);
        
 clk_i <= not clk_i after CLK_PERIOD/2;
 
 stim: process
 begin
 
    wait;
 
 end process;

end Behavioral;
