----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2023 22:28:22
-- Design Name: 
-- Module Name: tb_top - Behavioral
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

entity tb_top is
--  Port ( );
end tb_top;

architecture Behavioral of tb_top is

component top is
    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           RXD_i : in STD_LOGIC;
           TXD_o : out STD_LOGIC);
end component top;

signal clk_i : STD_LOGIC := '0';
signal rst_i : STD_LOGIC := '0';
signal RXD_i : STD_LOGIC := '1';
signal TXD_o : STD_LOGIC := '1';

constant const_data0 : std_logic_vector (7 downto 0) := "10101010";
constant const_data1 : std_logic_vector (7 downto 0) := "10011001";

constant baud_rate      : real      := 9600.0;
constant PERIOD_baud    : time      := integer(1000000.0/baud_rate) * 1us;

begin

dut: top port map (
    clk_i   => clk_i,
    rst_i   => rst_i,
    RXD_i   => RXD_i,
    TXD_o   => TXD_o);

clk_i <= not clk_i after 5ns;
    
stim: process
begin

    wait for 1us;
    RXD_i <= '0';
    wait for PERIOD_baud;
    RXD_i <= const_data0(0);
    wait for PERIOD_baud;
    RXD_i <= const_data0(1);
    wait for PERIOD_baud;
    RXD_i <= const_data0(2);
    wait for PERIOD_baud;
    RXD_i <= const_data0(3);
    wait for PERIOD_baud;
    RXD_i <= const_data0(4);
    wait for PERIOD_baud;
    RXD_i <= const_data0(5);
    wait for PERIOD_baud;
    RXD_i <= const_data0(6);
    wait for PERIOD_baud;
    RXD_i <= const_data0(7);
    wait for PERIOD_baud*12;
    
    RXD_i <= '0';
    wait for PERIOD_baud;
    RXD_i <= const_data1(0);
    wait for PERIOD_baud;
    RXD_i <= const_data1(1);
    wait for PERIOD_baud;
    RXD_i <= const_data1(2);
    wait for PERIOD_baud;
    RXD_i <= const_data1(3);
    wait for PERIOD_baud;
    RXD_i <= const_data1(4);
    wait for PERIOD_baud;
    RXD_i <= const_data1(5);
    wait for PERIOD_baud;
    RXD_i <= const_data1(6);
    wait for PERIOD_baud;
    RXD_i <= const_data1(7);
    wait for PERIOD_baud*3;
    wait;
end process;

end Behavioral;
