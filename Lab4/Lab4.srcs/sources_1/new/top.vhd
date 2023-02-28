----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2023 20:40:35
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
  Port ( clk_i : in std_logic;
         rst_i : in std_logic;
         led_o : out std_logic_vector(3 downto 0));
end top;

architecture Behavioral of top is
    
signal p : std_logic_vector(3 downto 0) := (others => '0');
signal q : std_logic_vector(3 downto 0) := (others => '0');
    
begin

    process(clk_i, rst_i)
        begin
            if rst_i = '1' then
                q <= (others => '0');
            elsif rising_edge(clk_i) then
                q <= p;
            end if;
    end process;

    p <= q(2 downto 0) & (not q(3));
    led_o <= q;

end Behavioral;
