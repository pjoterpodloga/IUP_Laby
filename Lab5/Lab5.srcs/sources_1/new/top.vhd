----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.03.2023 14:54:07
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
    generic ( N_div : integer := 4 );
    Port (  clk_i : in STD_LOGIC;
            rst_i : in STD_LOGIC;
            led_o : out STD_LOGIC);
end top;

architecture Behavioral of top is

signal q : integer range N_div * 2 downto 0 := 0;
signal last_state : std_logic := '0';

begin

    process(clk_i, rst_i, last_state, q)
    begin
        if rst_i = '1' then
            q <= 0;
        elsif last_state /= clk_i then
            last_state <= clk_i;
            q <= q + 1;
        end if;
        
        if q >= (N_div * 2) - 1 then
            q <= 0;
        end if;        
    end process;    
    
    led_o <= '1' when (q < N_div) else '0';
    
end Behavioral;
