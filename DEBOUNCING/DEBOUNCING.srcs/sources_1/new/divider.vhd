----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2023 13:47:17
-- Design Name: 
-- Module Name: divider - Behavioral
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

entity divider is
    generic ( 
        CLK_FREQ_IN  : natural := 100E6;
        CLK_FREQ_OUT : natural := 001E6);
    Port (
        clk_i : in  std_logic;
        rst_i : in  std_logic;
        clk_o : out std_logic);
        
end divider;

architecture Behavioral of divider is

constant NDIV : natural := natural(CLK_FREQ_IN / CLK_FREQ_OUT);

signal q : natural range 2*NDIV downto 0 := 0;
signal p : natural range 2*NDIV downto 0;

signal last_state   : std_logic := '0';
signal diff         : std_logic;

begin

diff <= (clk_i xor last_state);
p <= q + 1;

div: process(clk_i, rst_i, diff, q)
begin

    if q >= 2*NDIV then
        q <= 0;
    end if;

    if (rst_i = '1') then
        q <= 0;
        last_state <= '0';
    elsif rising_edge(diff) then
        last_state <= clk_i;
        q <= p;
    end if;

end process;

clk_o <= '0' when q < NDIV else '1';

end Behavioral;
