----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2023 14:52:50
-- Design Name: 
-- Module Name: top_tb - Behavioral
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

entity top_tb is
--  Port ( );
end top_tb;

architecture Behavioral of top_tb is

component top is
    Port ( 
        clk_i   : in    std_logic;
        btn_i   : in    std_logic;
        out_o   : out   std_logic);
end component top;

signal clk_i   :     std_logic := '0';
signal btn_i   :     std_logic := '0';
signal out_o   :     std_logic := '0';

begin

clk_i <= not clk_i after 5ns;

stim: process
begin
    wait for 1ms;
    btn_i <= '1';
    wait for 5ms;
    btn_i <= '0';
    wait for 20ms;
    btn_i <= '1';
    wait for 20 ms;
    btn_i <= '0';
    wait;
end process;

end Behavioral;
