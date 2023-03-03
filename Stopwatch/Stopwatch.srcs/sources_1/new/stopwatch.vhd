----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2023 20:27:48
-- Design Name: 
-- Module Name: stopwatch - Behavioral
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

entity stopwatch is
    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           start_stop_button_i : in STD_LOGIC;
           digit_o : out STD_LOGIC_VECTOR (31 downto 0));
end stopwatch;

architecture Behavioral of stopwatch is

type stopwatch_enum is ( start, stop, restart, overflow);

subtype byte is std_logic_vector (7 downto 0);
subtype half_byte is unsigned (3 downto 0);

signal stopwatch_state : stopwatch_enum := restart;

signal stopwatch_millis  : unsigned (7 downto 0) := (7 downto 0 => '0');
signal stopwatch_seconds : unsigned (7 downto 0) := (7 downto 0 => '0'); 

alias stopwatch_millis_01   : unsigned (3 downto 0) is stopwatch_millis (3 downto 0);
alias stopwatch_millis_1    : unsigned (3 downto 0) is stopwatch_millis (7 downto 4);

alias stopwatch_seconds_1   : unsigned (3 downto 0) is stopwatch_seconds (3 downto 0);
alias stopwatch_seconds_10  : unsigned (3 downto 0) is stopwatch_seconds (7 downto 4);

alias digit3_o : byte is digit_o (31 downto 24);
alias digit2_o : byte is digit_o (23 downto 16);
alias digit1_o : byte is digit_o (15 downto 8);
alias digit0_o : byte is digit_o (7  downto 0);

signal clk_in : std_logic;

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


component divider is
    Port (  clk_i : in  std_logic;
            clk_o : out std_logic);
end component divider;

begin


div: divider port map ( clk_i => clk_i,
                        clk_o => clk_in);

counting: process(clk_in, stopwatch_state, start_stop_button_i)
begin

    if rising_edge(clk_in) then
    
        if stopwatch_state = start then
            stopwatch_millis_01 <= stopwatch_millis_01 + 1;
        end if;
        
        if stopwatch_millis_01 >= 9 then
            stopwatch_millis_01 <= "0000";
            stopwatch_millis_1  <= stopwatch_millis_1 + 1;
        end if;
        
        if stopwatch_millis_1 >= 9 then
            stopwatch_millis_1 <= "0000";
            stopwatch_seconds_1  <= stopwatch_seconds_1 + 1;
        end if;
        
        if stopwatch_seconds_1 >= 9 then
            stopwatch_seconds_1 <= "0000";
            stopwatch_seconds_10  <= stopwatch_seconds_10 + 1;
        end if;
        
        if stopwatch_seconds_10 >= 6 then
            stopwatch_state <= overflow;
        end if;

    end if;
    
    if rising_edge(start_stop_button_i) then
    
        if stopwatch_state = start then
            stopwatch_state <= stop;
        elsif stopwatch_state = stop then
            stopwatch_state <= restart;
            
            stopwatch_millis  <= (others => '0');
            stopwatch_seconds <= (others => '0');
            
        elsif stopwatch_state = restart then
            stopwatch_state <= start;
        elsif stopwatch_state = overflow then
            stopwatch_state <= stop;
        end if;
        
    end if;
end process;

digit0_o <= hex2seg(stopwatch_millis_01)    when stopwatch_state /= overflow else (6 => '0', others => '1');
digit1_o <= hex2seg(stopwatch_millis_1)     when stopwatch_state /= overflow else (6 => '0', others => '1');
digit2_o <= hex2seg(stopwatch_seconds_1)    when stopwatch_state /= overflow else (6 => '0', others => '1');
digit3_o <= hex2seg(stopwatch_seconds_10)   when stopwatch_state /= overflow else (6 => '0', others => '1');

end Behavioral;
