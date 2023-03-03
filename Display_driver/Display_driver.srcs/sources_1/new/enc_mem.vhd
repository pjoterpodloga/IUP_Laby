----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2023 15:32:52
-- Design Name: 
-- Module Name: enc_mem - Behavioral
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

entity enc_mem is
    Port (  clk_i : in std_logic;
            btn_i : in std_logic_vector(3 downto 0);
            sw_i : in std_logic_vector(7 downto 0);
            digit_o : out std_logic_vector(31 downto 0));
end enc_mem;

architecture Behavioral of enc_mem is

subtype byte is std_logic_vector(7 downto 0);
subtype half_byte is std_logic_vector(3 downto 0);

signal hex_mem : std_logic_vector (15 downto 0) := "1000"&"0111"&"0001"&"1000";
alias  hex3_mem : half_byte is hex_mem (15 downto 12);
alias  hex2_mem : half_byte is hex_mem (11 downto 8);
alias  hex1_mem : half_byte is hex_mem (7  downto 4);
alias  hex0_mem : half_byte is hex_mem (3  downto 0);

alias digit3_o : byte is digit_o (31 downto 24);
alias digit2_o : byte is digit_o (23 downto 16);
alias digit1_o : byte is digit_o (15 downto 8);
alias digit0_o : byte is digit_o (7 downto 0);


function hex2seg(hex_in : half_byte) return byte is
    variable seg_out : byte;
begin
    if hex_in = "0000" then
        seg_out := "00000011";
    elsif hex_in = "0001" then
        seg_out := "10011111";
    elsif hex_in = "0010" then
        seg_out := "00100101";
    elsif hex_in = "0011" then
        seg_out := "00001101";
    elsif hex_in = "0100" then
        seg_out := "10011001";
    elsif hex_in = "0101" then
        seg_out := "01001001";
    elsif hex_in = "0110" then
        seg_out := "01000001";
    elsif hex_in = "0111" then
        seg_out := "00011111";
    elsif hex_in = "1000" then
        seg_out := "00000001";
    elsif hex_in = "1001" then
        seg_out := "00001001";
    elsif hex_in = "1010" then
        seg_out := "00010001";
    elsif hex_in = "1011" then
        seg_out := "11000001";
    elsif hex_in = "1100" then
        seg_out := "11100101";
    elsif hex_in = "1101" then
        seg_out := "10000101";
    elsif hex_in = "1110" then
        seg_out := "01100001";
    elsif hex_in = "1111" then
        seg_out := "01110001";
    end if;          
    
    return seg_out;
end function;

begin
    
    save_hex: process(clk_i, btn_i)
    begin
        if rising_edge(clk_i) then
            
            if btn_i(0) = '1' then
                hex0_mem <= sw_i(3 downto 0);
            elsif btn_i(1) = '1' then
                hex1_mem <= sw_i(3 downto 0);
            elsif btn_i(2) = '1' then
                hex2_mem <= sw_i(3 downto 0);
            elsif btn_i(3) = '1' then
                hex3_mem <= sw_i(3 downto 0);
            end if;
            
        end if;
    end process;

    digit0_o <= hex2seg(hex0_mem)(7 downto 1) & not sw_i(4);
    digit1_o <= hex2seg(hex1_mem)(7 downto 1) & not sw_i(5);
    digit2_o <= hex2seg(hex2_mem)(7 downto 1) & not sw_i(6);
    digit3_o <= hex2seg(hex3_mem)(7 downto 1) & not sw_i(7);

end Behavioral;