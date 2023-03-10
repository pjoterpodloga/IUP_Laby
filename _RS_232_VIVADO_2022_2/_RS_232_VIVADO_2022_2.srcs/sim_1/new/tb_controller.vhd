----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2023 19:39:46
-- Design Name: 
-- Module Name: tb_controller - Behavioral
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

entity tb_controller is
--  Port ( );
end tb_controller;

architecture Behavioral of tb_controller is

component async_clk is
    Port (  clk_i : in std_logic;
            clk_baud : out std_logic;
            clk_en   : in std_logic);
end component async_clk;

signal clk_i    :  std_logic := '0';
signal clk_baud :  std_logic := '0';
signal clk_en   :  std_logic := '0';

component rs232_controller is
    Port (  RXD_i : in std_logic;
            TXD_o : out std_logic;
            --RX_trig : in std_logic;
            --TX_trig : in std_logic;
            clk_en  : out std_logic;
            clk_baud : in std_logic;
            data_o : out std_logic_vector (7 downto 0);
            data_i : in  std_logic_vector (7 downto 0));
end component rs232_controller;

signal RXD_i :      std_logic := '1';
signal TXD_o :      std_logic := '1';
signal TX_trig :    std_logic := '0';
signal data_o :     std_logic_vector (7 downto 0) := ( others => '0');
signal data_i :     std_logic_vector (7 downto 0) := ( others => '0');

component sum is
    Port (  data_i : in  std_logic_vector (7 downto 0);
            data_o : out std_logic_vector (7 downto 0));
end component sum;




constant const_data : std_logic_vector (7 downto 0) := "10101010";

constant baud_rate      : real      := 9600.0;
constant PERIOD_baud    : time      := integer(1000000.0/baud_rate) * 1us;

begin

dut1: async_clk port map (   
    clk_i       => clk_i,
    clk_baud    => clk_baud,
    clk_en      => clk_en);
    
 dut2: rs232_controller port map (
    RXD_i       => RXD_i,
    TXD_o       => TXD_o,
    --TX_trig     => TX_trig,
    clk_en      => clk_en,
    clk_baud    => clk_baud,
    data_o      => data_o,
    data_i      => data_i);
    
 dut3: sum port map (
    data_i => data_o,
    data_o => data_i);

    clk_i <= not clk_i after 5ns;
    
stim: process
begin

    wait for 1us;
    RXD_i <= '0';
    wait for PERIOD_baud;
    RXD_i <= const_data(0);
    wait for PERIOD_baud;
    RXD_i <= const_data(1);
    wait for PERIOD_baud;
    RXD_i <= const_data(2);
    wait for PERIOD_baud;
    RXD_i <= const_data(3);
    wait for PERIOD_baud;
    RXD_i <= const_data(4);
    wait for PERIOD_baud;
    RXD_i <= const_data(5);
    wait for PERIOD_baud;
    RXD_i <= const_data(6);
    wait for PERIOD_baud;
    RXD_i <= const_data(7);
    wait for PERIOD_baud*3;
    TX_trig <= '1';
    wait for PERIOD_baud;
    TX_trig <= '0';
    wait;
end process;

end Behavioral;
