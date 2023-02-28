----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2023 20:49:08
-- Design Name: 
-- Module Name: tb - Behavioral
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

entity tb is
--  Port ( );
end tb;

architecture Behavioral of tb is

component top is
  Port ( clk_i : in std_logic;
         rst_i : in std_logic;
         led_o : out std_logic_vector(3 downto 0));
end component top;

signal clk_i : std_logic := '0';
signal rst_i : std_logic := '0';
signal led_o : std_logic_vector(3 downto 0);

begin

dut: top port map(
    clk_i => clk_i,
    rst_i => rst_i,
    led_o => led_o);
    
clk_i <= not clk_i after 10ns;
    
stim: process
begin
    wait for 150ns;
    rst_i <= '1';
    wait for 20ns; 
    rst_i <= '0';
    wait for 30ns;
    rst_i <= '1';
    wait for 60ns; 
    rst_i <= '0';  
    wait; 
end process;


end Behavioral;
