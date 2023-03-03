----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2023 14:23:35
-- Design Name: 
-- Module Name: top - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port (  clk_i : in std_logic;
            rst_i : in std_logic;
            led_o : out std_logic);
end top;

architecture Behavioral of top is

constant N_div : integer := 10;

signal q : integer  range N_div downto 0 := 0;
signal last_state : std_logic := '0';
signal clk_out : std_logic := '0';

begin

    process(clk_i, rst_i, last_state, q)
    begin
        if q >= N_div then
            q <= 0;
            clk_out <= not clk_out;
        end if;
    
        if rst_i = '1' then
            q <= 0;
        elsif last_state /= clk_i then
            last_state <= clk_i;
            q <= q + 1;
        end if;
    end process;
    
    led_o <= clk_out;
    
end Behavioral;
