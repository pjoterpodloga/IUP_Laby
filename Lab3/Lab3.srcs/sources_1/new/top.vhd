----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2023 19:54:06
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port( clk_i : in STD_LOGIC;
          rst_i : in STD_LOGIC;
          led_o : out STD_LOGIC_VECTOR(2 downto 0));
end top;

architecture Behavioral of top is

signal q : std_logic_vector(2 downto 0) := (others => '0');
signal p : std_logic_vector(2 downto 0) := (others => '0');

begin

    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            q <= (others => '0');
        elsif rising_edge(clk_i) then
            q <= p;
        end if;
    end process;

    p <= q + 1;
    led_o <= q(2) & (q(2) xor q(1)) & (q(1) xor q(0));

end Behavioral;
