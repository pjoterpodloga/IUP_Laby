----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.02.2023 16:18:11
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
    Port ( sw_i : in STD_LOGIC_VECTOR(7 downto 0);
           clk_i : in STD_LOGIC;
           an_o : out STD_LOGIC_VECTOR(3 downto 0);
           led_o : out STD_LOGIC_VECTOR (7 downto 0));
end component top;

signal sw_i : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
signal clk_i : STD_LOGIC := '0';
signal an_o : STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal led_o : STD_LOGIC_VECTOR(7 downto 0) := "00000000";

begin

dut : top port map(
    clk_i => clk_i,
    sw_i => sw_i,
    an_o => an_o,
    led_o => led_o);

clk_i <= not clk_i after 10 ns;

stim: process
    begin
        wait for 100 ns;
        sw_i <= "10101010";
        wait for 100 ns;
        sw_i <= "10101011";
        wait;
end process;

end Behavioral;
