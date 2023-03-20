----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2023 17:47:49
-- Design Name: 
-- Module Name: encoder - Behavioral
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

entity encoder is
    Port ( 
        hex_i   :   in  std_logic_vector(15 downto 0);
        digit_o :   out std_logic_vector(31 downto 0));
end encoder;

architecture Behavioral of encoder is

subtype byte is std_logic_vector(7 downto 0);

alias   digit0  :   byte    is  digit_o(7  downto  0);
alias   digit1  :   byte    is  digit_o(15 downto  8);
alias   digit2  :   byte    is  digit_o(23 downto 16);
alias   digit3  :   byte    is  digit_o(31 downto 24);

alias   hex0    :   std_logic_vector(3 downto 0)    is  hex_i(3  downto   0);
alias   hex1    :   std_logic_vector(3 downto 0)    is  hex_i(7  downto   4);
alias   hex2    :   std_logic_vector(3 downto 0)    is  hex_i(11 downto   8);
alias   hex3    :   std_logic_vector(3 downto 0)    is  hex_i(15 downto  12);

function hex2seg(hex : in std_logic_vector(3 downto 0))
    return byte is variable seg : byte;
begin
    
    if  hex = x"0" then
        seg :=  "00000011";
    elsif   hex = x"1" then
        seg :=  "10011111";
    elsif   hex = x"2"  then
        seg :=  "00100101";
    elsif   hex = x"3"  then
        seg :=  "00001101";
    elsif   hex = x"4"  then
        seg :=  "10011001";
    elsif   hex = x"5"  then
        seg :=  "01001001";
    elsif   hex = x"6"  then
        seg :=  "01000001";
    elsif   hex = x"7"  then
        seg :=  "00011111";
    elsif   hex = x"8"  then
        seg :=  "00000001";
    elsif   hex = x"9"  then
        seg :=  "00001001";
    elsif   hex = x"A"  then
        seg :=  "11111101";
    else
        seg :=  "11111111";
    end if;
    
    return seg; 
end function;

begin

digit0  <= hex2seg(hex0);
digit1  <= hex2seg(hex1);
digit2  <= hex2seg(hex2);
digit3  <= hex2seg(hex3);

end Behavioral;
