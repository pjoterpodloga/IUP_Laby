----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.02.2023 16:21:02
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
    Port (sw_i : in STD_LOGIC_VECTOR (3 downto 0);
    led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
    led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0);
    clk_i : in STD_LOGIC;
    sum : out STD_LOGIC_VECTOR (2 downto 0));
end top;

architecture Behavioral of top is

signal sum_ones : std_logic_vector (2 downto 0);

begin

    process(clk_i)
    begin
        if rising_edge(clk_i) then
            if sum_ones = "000" then
                led7_seg_o <= "00000011";
            elsif sum_ones = "001" then
                led7_seg_o <= "10011111";
            elsif sum_ones = "010" then
                led7_seg_o <= "00100101";
            elsif sum_ones <= "011" then
                led7_seg_o <= "00001101";
            elsif sum_ones <= "100" then
                led7_seg_o <= "10011001";
            end if;
        end if;
    end process;
    
    sum_ones <= "00"&sw_i(0) + sw_i(1) + sw_i(2) + sw_i(3);
    sum <= sum_ones;
    led7_an_o <= "0111";

end Behavioral;
