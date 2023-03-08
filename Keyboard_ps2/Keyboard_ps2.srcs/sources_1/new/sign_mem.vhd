----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2023 16:37:08
-- Design Name: 
-- Module Name: sign_mem - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sign_mem is
    Port (  rst_i : in std_logic;
            sign_data_i : in std_logic_vector (7 downto 0);
            sign_trig_i : in std_logic;
            sign_o  : out std_logic_vector (7 downto 0));
end sign_mem;

architecture Behavioral of sign_mem is

subtype byte is std_logic_vector (7 downto 0);

constant BREAK_KEY : byte := x"F0";

signal char_mem : byte;

begin

mem: process(sign_trig_i, rst_i)
begin
    if rst_i = '1' then
        char_mem <= (others => '0');
    elsif rising_edge(sign_trig_i) then
        if sign_data_i /= BREAK_KEY then
            char_mem <= sign_data_i;
        end if;
    end if;

end process;

sign_o <= char_mem;

end Behavioral;
