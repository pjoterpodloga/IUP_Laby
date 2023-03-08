----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2023 16:43:38
-- Design Name: 
-- Module Name: display - Behavioral
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

entity display is
    Port (  sign_i : in std_logic_vector (7 downto 0);
            led7_an_o : out std_logic_vector (3 downto 0);
            led7_seg_o : out std_logic_vector (7 downto 0));
end display;

architecture Behavioral of display is

subtype byte is std_logic_vector (7 downto 0);

function key2seg(key_in : byte) return byte is
    variable seg_out : byte;
begin

       if key_in = x"45" then   --0
        seg_out := "00000011";
    elsif key_in = x"16" then   --1
        seg_out := "10011111";
    elsif key_in = x"1E" then   --2
        seg_out := "00100101";
    elsif key_in = x"26" then   --3
        seg_out := "00001101";
    elsif key_in = x"25" then   --4
        seg_out := "10011001";
    elsif key_in = x"2E" then   --5
        seg_out := "01001001";
    elsif key_in = x"36" then   --6
        seg_out := "01000001";
    elsif key_in = x"3D" then   --7
        seg_out := "00011111";
    elsif key_in = x"3E" then   --8
        seg_out := "00000001";
    elsif key_in = x"46" then   --9
        seg_out := "00001001";
    elsif key_in = x"1C" then   --A
        seg_out := "00010001";
    elsif key_in = x"32" then   --B
        seg_out := "11000001";
    elsif key_in = x"21" then   --C
        seg_out := "11100101";
    elsif key_in = x"23" then   --D
        seg_out := "10000101";
    elsif key_in = x"24" then   --E
        seg_out := "01100001";
    elsif key_in = x"2B" then   --F
        seg_out := "01110001";
    else                        --default
        seg_out := (7 downto 0 => '1');
    end if;          

    return seg_out;
end function;

begin

    led7_an_o <= "1110";
    led7_seg_o <= key2seg(sign_i);

end Behavioral;
