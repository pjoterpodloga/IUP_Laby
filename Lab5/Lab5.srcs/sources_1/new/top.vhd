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
    Port (  clk_i : in STD_LOGIC;
            rst_i : in STD_LOGIC;
            led_o : out STD_LOGIC);
end top;

architecture Behavioral of top is

constant CLK_FREQ : natural := 100E6;
constant OUT_FREQ : natural := 1;

constant N_DIV : natural := CLK_FREQ / OUT_FREQ; 
--constant N_DIV : natural := 33;

signal q : natural range 2 * N_DIV + 1 downto 0 := 0;
signal p : natural range 2 * N_DIV + 1 downto 0;
signal last_state : std_logic := '0';
signal diff : std_logic;

begin

    diff <= clk_i xor last_state;
    p <= q + 1;

    process(clk_i, rst_i, diff, q)
    begin
    
        if rst_i = '1' then
            q <= 0;
        elsif rising_edge(diff) then
            last_state <= clk_i;
            q <= p;
        end if;
        
        if q >= (N_DIV * 2) then
            q <= 0;
        end if;
                
    end process;    
    
    led_o <= '0' when (q < N_DIV) else '1';
    
end Behavioral;
