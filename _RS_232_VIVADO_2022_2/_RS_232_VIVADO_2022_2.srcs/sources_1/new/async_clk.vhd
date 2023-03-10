----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2023 10:40:24
-- Design Name: 
-- Module Name: async_clk - Behavioral
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

entity async_clk is
    Port (  clk_i : in std_logic;
            clk_baud : out std_logic;
            clk_en   : in std_logic);
end async_clk;

architecture Behavioral of async_clk is


subtype byte is std_logic_vector (7 downto 0);

constant delta_freq : real    := 0.00;
constant clk_freq   : integer := 100000000;
constant clk_out    : integer := integer(9600.0*(1.0 + delta_freq));
constant N_div      : integer := clk_freq/clk_out;

type clock_enum is (clk_on, clk_off);

signal clock_state : clock_enum := clk_off;

signal q : integer range (N_div*2) downto 0 := 0;
signal p : integer range (N_div*2) downto 0 := 0;

signal last_state : std_logic;

signal edge_trig : std_logic;

begin


start_clk: process(clk_en, clock_state)
begin
    if clk_en = '1' and clock_state = clk_off then
        clock_state <= clk_on;
    elsif clk_en = '0' and clock_state = clk_on then
        clock_state <= clk_off;
    end if;
end process;

div: process(clock_state, edge_trig, q)
begin

    if q >= (N_div * 2) then
        q <= 0;
    end if;

    if clock_state = clk_off then
        q <= 0;
        last_state <= '0';
    elsif rising_edge(edge_trig) then    
        last_state <= clk_i;
        q <= p;
    end if;

end process;

    p <= q + 1;
    edge_trig <= clk_i xor last_state;

    clk_baud <= '0' when (clock_state = clk_off) or (q < N_div) else '1';

end Behavioral;
