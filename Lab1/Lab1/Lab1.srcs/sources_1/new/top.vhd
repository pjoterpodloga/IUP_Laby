----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.02.2023 16:15:45
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( sw_i : in STD_LOGIC_VECTOR(7 downto 0);
           clk_i : in STD_LOGIC;
           an_o : out STD_LOGIC_VECTOR(3 downto 0);
           led_o : out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is

signal p : std_logic;

begin

    process(clk_i, p)
    begin
        if rising_edge(clk_i) then
            if p = '1' then 
                led_o <= "11111100";
            elsif p = '0' then
                led_o <= "10011110";
            end if;
        end if;
    end process;
    
    p <= sw_i(0) xor sw_i(1) xor sw_i(2) xor sw_i(3) xor sw_i(4) xor sw_i(5) xor sw_i(6) xor sw_i(7);
    an_o <= "0111";

end Behavioral;
