----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2023 14:32:18
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
    Port (  clk_i : in std_logic;
            rst_i : in std_logic;
            led_o : out std_logic);
end component top;

signal clk_i : std_logic := '0';
signal rst_i : std_logic := '0';
signal led_o : std_logic := '0';

begin

dut: top port map(  clk_i => clk_i,
                    rst_i => rst_i,
                    led_o => led_o);
                    
    clk_i <= not clk_i after 10ns;
    
stim: process
begin
    wait;
end process;

end Behavioral;
